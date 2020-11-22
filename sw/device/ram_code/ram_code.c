// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/examples/demos.h"
#include "sw/device/lib/ise.h"
#include "sw/device/lib/arch/device.h"
#include "sw/device/lib/dif/dif_gpio.h"
#include "sw/device/lib/dif/dif_spi_device.h"
#include "sw/device/lib/dif/dif_rv_timer.h"
#include "sw/device/lib/handler.h"
#include "sw/device/lib/irq.h"
#include "sw/device/lib/dif/dif_uart.h"
#include "sw/device/lib/pinmux.h"
#include "sw/device/lib/runtime/hart.h"
#include "sw/device/lib/runtime/log.h"
#include "sw/device/lib/runtime/print.h"
#include "sw/device/lib/testing/check.h"
#include "sw/device/lib/testing/test_status.h"

#include "hw/top_earlgrey/sw/autogen/top_earlgrey.h"  // Generated.
#include "sw/device/lib/base/memory.h"
#include "sw/device/lib/runtime/print.h"
#include <stdint.h>
//#include <stdio.h>
static dif_uart_t uart;


int main(int argc, char **argv) {
    CHECK(dif_uart_init(
            (dif_uart_params_t){
                .base_addr = mmio_region_from_addr(TOP_EARLGREY_UART_BASE_ADDR),
            },
            &uart) == kDifUartOk);
    CHECK(dif_uart_configure(&uart, (dif_uart_config_t){
                                      .baudrate = kUartBaudrate,
                                      .clk_freq_hz = kClockFreqPeripheralHz,
                                      .parity_enable = kDifUartToggleDisabled,
                                      .parity = kDifUartParityEven,
                                  }) == kDifUartConfigOk);
    base_uart_stdout(&uart);

    pinmux_init();

    // Add DATE and TIME because I keep fooling myself with old versions
    LOG_INFO("Built at: " __DATE__ ", " __TIME__);

    uint8_t test_values[] = {0,0x55,0xFF};
    for(unsigned int i=0;i<sizeof(test_values);i++){
        LOG_INFO("status %08x",ise_status());
        uint8_t buf[4];
        memset(buf,test_values[i],sizeof(buf));
        uint32_t buf32;
        memcpy(&buf32,buf,4);
        LOG_INFO("write %08x",buf32);
        ise_put(buf32);
        uint32_t tmp32 = ise_get();
        LOG_INFO("read %08x",tmp32);
        CHECK(0==memcmp(&tmp32,&buf32,sizeof(buf)));
    }
    LOG_INFO("DONE");
    return 0;
}

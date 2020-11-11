// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/examples/demos.h"
#include "sw/device/lib/aes2.h"
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


/**
 * set AES key.
 *
 * @param aes_cfg AES configuration object.
 * @param key     AES key.
 * @param key_len AES key length.
 *
 * @return 0 on success, Error code otherwise.
 */
static int aes_set_key(const aes_cfg_t *aes_cfg,
                                                    const char *key_share0,
                                                    size_t key_len) {
  static const uint8_t kKeyShare1[32] = {0};

  aes2_clear();
  while (!aes2_idle()) {
    ;
  }
  aes2_init(*aes_cfg);

  aes2_key_put(key_share0, kKeyShare1, aes_cfg->key_len);
  return 0;
}

/*
 * AES encryption with previously loaded key.
 *
 * @param buf_out        ciphertext
 * @param buf_in         plain text to be encrypted.
 *
 * @return 0 on success, Error code otherwise.
 */
static int aes_block_encryption(void *buf_out, const void *buf_in) {
  aes2_data_put_wait(buf_in);
  aes2_manual_trigger();
  aes2_data_get_wait(buf_out);
  return 0;
}

static int aes128_enc(const aes_cfg_t *aes_cfg, const void*key, void*buf_out, const void*buf_in){
    int status = aes_set_key(aes_cfg, key, 16);
    if(status) return status;
    status=aes_block_encryption(buf_out, buf_in);
    return status;
}

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
    LOG_INFO("Hello World!");
    LOG_INFO("Built at: " __DATE__ ", " __TIME__);

    aes_cfg_t aes_cfg;
    aes_cfg.key_len = kAes128;
    aes_cfg.operation = kAesEnc;
    aes_cfg.mode = kAesEcb;
    aes_cfg.manual_operation = true;
    uint8_t test_values[] = {0,0x55,0xFF};
    for(unsigned int i=0;i<sizeof(test_values);i++){
        uint8_t buf[16];
        uint8_t tmp[16];
        memset(buf,test_values[i],sizeof(buf));
        memset(tmp,test_values[i]-1,sizeof(buf));
        LOG_INFO("AES %02x",test_values[i]);
        aes128_enc(&aes_cfg,buf,tmp,buf);
        for(unsigned int j=0;j<16;j++){
            base_printf("%02x ",tmp[j]);
        }
        base_printf("\n");
    }
    LOG_INFO("DONE");
    return 0;
}

// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef OPENTITAN_HW_TOP_ISE_SW_AUTOGEN_TOP_ISE_H_
#define OPENTITAN_HW_TOP_ISE_SW_AUTOGEN_TOP_ISE_H_

/**
 * @file
 * @brief Top-specific Definitions
 *
 * This file contains preprocessor and type definitions for use within the
 * device C/C++ codebase.
 *
 * These definitions are for information that depends on the top-specific chip
 * configuration, which includes:
 * - Device Memory Information (for Peripherals and Memory)
 * - PLIC Interrupt ID Names and Source Mappings
 * - Alert ID Names and Source Mappings
 * - Pinmux Pin/Select Names
 * - Power Manager Wakeups
 */

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Peripheral base address for uart in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_UART_BASE_ADDR 0x40000000u

/**
 * Peripheral size for uart in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_UART_BASE_ADDR and
 * `TOP_ISE_UART_BASE_ADDR + TOP_ISE_UART_SIZE_BYTES`.
 */
#define TOP_ISE_UART_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for gpio in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_GPIO_BASE_ADDR 0x40010000u

/**
 * Peripheral size for gpio in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_GPIO_BASE_ADDR and
 * `TOP_ISE_GPIO_BASE_ADDR + TOP_ISE_GPIO_SIZE_BYTES`.
 */
#define TOP_ISE_GPIO_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for spi_device in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_SPI_DEVICE_BASE_ADDR 0x40020000u

/**
 * Peripheral size for spi_device in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_SPI_DEVICE_BASE_ADDR and
 * `TOP_ISE_SPI_DEVICE_BASE_ADDR + TOP_ISE_SPI_DEVICE_SIZE_BYTES`.
 */
#define TOP_ISE_SPI_DEVICE_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for flash_ctrl in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_FLASH_CTRL_BASE_ADDR 0x40030000u

/**
 * Peripheral size for flash_ctrl in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_FLASH_CTRL_BASE_ADDR and
 * `TOP_ISE_FLASH_CTRL_BASE_ADDR + TOP_ISE_FLASH_CTRL_SIZE_BYTES`.
 */
#define TOP_ISE_FLASH_CTRL_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for rv_timer in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_RV_TIMER_BASE_ADDR 0x40080000u

/**
 * Peripheral size for rv_timer in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_RV_TIMER_BASE_ADDR and
 * `TOP_ISE_RV_TIMER_BASE_ADDR + TOP_ISE_RV_TIMER_SIZE_BYTES`.
 */
#define TOP_ISE_RV_TIMER_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for ise in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_ISE_BASE_ADDR 0x400F0000u

/**
 * Peripheral size for ise in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_ISE_BASE_ADDR and
 * `TOP_ISE_ISE_BASE_ADDR + TOP_ISE_ISE_SIZE_BYTES`.
 */
#define TOP_ISE_ISE_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for ipc in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_IPC_BASE_ADDR 0x400E0000u

/**
 * Peripheral size for ipc in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_IPC_BASE_ADDR and
 * `TOP_ISE_IPC_BASE_ADDR + TOP_ISE_IPC_SIZE_BYTES`.
 */
#define TOP_ISE_IPC_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for aes in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_AES_BASE_ADDR 0x40110000u

/**
 * Peripheral size for aes in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_AES_BASE_ADDR and
 * `TOP_ISE_AES_BASE_ADDR + TOP_ISE_AES_SIZE_BYTES`.
 */
#define TOP_ISE_AES_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for hmac in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_HMAC_BASE_ADDR 0x40120000u

/**
 * Peripheral size for hmac in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_HMAC_BASE_ADDR and
 * `TOP_ISE_HMAC_BASE_ADDR + TOP_ISE_HMAC_SIZE_BYTES`.
 */
#define TOP_ISE_HMAC_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for rv_plic in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_RV_PLIC_BASE_ADDR 0x40090000u

/**
 * Peripheral size for rv_plic in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_RV_PLIC_BASE_ADDR and
 * `TOP_ISE_RV_PLIC_BASE_ADDR + TOP_ISE_RV_PLIC_SIZE_BYTES`.
 */
#define TOP_ISE_RV_PLIC_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for pinmux in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_PINMUX_BASE_ADDR 0x40070000u

/**
 * Peripheral size for pinmux in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_PINMUX_BASE_ADDR and
 * `TOP_ISE_PINMUX_BASE_ADDR + TOP_ISE_PINMUX_SIZE_BYTES`.
 */
#define TOP_ISE_PINMUX_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for padctrl in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_PADCTRL_BASE_ADDR 0x40160000u

/**
 * Peripheral size for padctrl in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_PADCTRL_BASE_ADDR and
 * `TOP_ISE_PADCTRL_BASE_ADDR + TOP_ISE_PADCTRL_SIZE_BYTES`.
 */
#define TOP_ISE_PADCTRL_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for alert_handler in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_ALERT_HANDLER_BASE_ADDR 0x40130000u

/**
 * Peripheral size for alert_handler in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_ALERT_HANDLER_BASE_ADDR and
 * `TOP_ISE_ALERT_HANDLER_BASE_ADDR + TOP_ISE_ALERT_HANDLER_SIZE_BYTES`.
 */
#define TOP_ISE_ALERT_HANDLER_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for pwrmgr in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_PWRMGR_BASE_ADDR 0x400A0000u

/**
 * Peripheral size for pwrmgr in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_PWRMGR_BASE_ADDR and
 * `TOP_ISE_PWRMGR_BASE_ADDR + TOP_ISE_PWRMGR_SIZE_BYTES`.
 */
#define TOP_ISE_PWRMGR_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for rstmgr in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_RSTMGR_BASE_ADDR 0x400B0000u

/**
 * Peripheral size for rstmgr in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_RSTMGR_BASE_ADDR and
 * `TOP_ISE_RSTMGR_BASE_ADDR + TOP_ISE_RSTMGR_SIZE_BYTES`.
 */
#define TOP_ISE_RSTMGR_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for clkmgr in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_CLKMGR_BASE_ADDR 0x400C0000u

/**
 * Peripheral size for clkmgr in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_CLKMGR_BASE_ADDR and
 * `TOP_ISE_CLKMGR_BASE_ADDR + TOP_ISE_CLKMGR_SIZE_BYTES`.
 */
#define TOP_ISE_CLKMGR_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for nmi_gen in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_NMI_GEN_BASE_ADDR 0x40140000u

/**
 * Peripheral size for nmi_gen in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_NMI_GEN_BASE_ADDR and
 * `TOP_ISE_NMI_GEN_BASE_ADDR + TOP_ISE_NMI_GEN_SIZE_BYTES`.
 */
#define TOP_ISE_NMI_GEN_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for usbdev in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_USBDEV_BASE_ADDR 0x40150000u

/**
 * Peripheral size for usbdev in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_USBDEV_BASE_ADDR and
 * `TOP_ISE_USBDEV_BASE_ADDR + TOP_ISE_USBDEV_SIZE_BYTES`.
 */
#define TOP_ISE_USBDEV_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for sensor_ctrl in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_SENSOR_CTRL_BASE_ADDR 0x40170000u

/**
 * Peripheral size for sensor_ctrl in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_SENSOR_CTRL_BASE_ADDR and
 * `TOP_ISE_SENSOR_CTRL_BASE_ADDR + TOP_ISE_SENSOR_CTRL_SIZE_BYTES`.
 */
#define TOP_ISE_SENSOR_CTRL_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for keymgr in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_KEYMGR_BASE_ADDR 0x401a0000u

/**
 * Peripheral size for keymgr in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_KEYMGR_BASE_ADDR and
 * `TOP_ISE_KEYMGR_BASE_ADDR + TOP_ISE_KEYMGR_SIZE_BYTES`.
 */
#define TOP_ISE_KEYMGR_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for otp_ctrl in top ise.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_ISE_OTP_CTRL_BASE_ADDR 0x401b0000u

/**
 * Peripheral size for otp_ctrl in top ise.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_ISE_OTP_CTRL_BASE_ADDR and
 * `TOP_ISE_OTP_CTRL_BASE_ADDR + TOP_ISE_OTP_CTRL_SIZE_BYTES`.
 */
#define TOP_ISE_OTP_CTRL_SIZE_BYTES 0x4000u


/**
 * Memory base address for rom in top ise.
 */
#define TOP_ISE_ROM_BASE_ADDR 0x00008000u

/**
 * Memory size for rom in top ise.
 */
#define TOP_ISE_ROM_SIZE_BYTES 0x4000u

/**
 * Memory base address for ram_main in top ise.
 */
#define TOP_ISE_RAM_MAIN_BASE_ADDR 0x10000000u

/**
 * Memory size for ram_main in top ise.
 */
#define TOP_ISE_RAM_MAIN_SIZE_BYTES 0x10000u

/**
 * Memory base address for ram_ret in top ise.
 */
#define TOP_ISE_RAM_RET_BASE_ADDR 0x18000000u

/**
 * Memory size for ram_ret in top ise.
 */
#define TOP_ISE_RAM_RET_SIZE_BYTES 0x1000u

/**
 * Memory base address for eflash in top ise.
 */
#define TOP_ISE_EFLASH_BASE_ADDR 0x20000000u

/**
 * Memory size for eflash in top ise.
 */
#define TOP_ISE_EFLASH_SIZE_BYTES 0x10000u


/**
 * PLIC Interrupt Source Peripheral.
 *
 * Enumeration used to determine which peripheral asserted the corresponding
 * interrupt.
 */
typedef enum top_ise_plic_peripheral {
  kTopIsePlicPeripheralUnknown = 0, /**< Unknown Peripheral */
  kTopIsePlicPeripheralGpio = 1, /**< gpio */
  kTopIsePlicPeripheralUart = 2, /**< uart */
  kTopIsePlicPeripheralSpiDevice = 3, /**< spi_device */
  kTopIsePlicPeripheralFlashCtrl = 4, /**< flash_ctrl */
  kTopIsePlicPeripheralHmac = 5, /**< hmac */
  kTopIsePlicPeripheralAlertHandler = 6, /**< alert_handler */
  kTopIsePlicPeripheralNmiGen = 7, /**< nmi_gen */
  kTopIsePlicPeripheralUsbdev = 8, /**< usbdev */
  kTopIsePlicPeripheralPwrmgr = 9, /**< pwrmgr */
  kTopIsePlicPeripheralKeymgr = 10, /**< keymgr */
  kTopIsePlicPeripheralLast = 10, /**< \internal Final PLIC peripheral */
} top_ise_plic_peripheral_t;

/**
 * PLIC Interrupt Source.
 *
 * Enumeration of all PLIC interrupt sources. The interrupt sources belonging to
 * the same peripheral are guaranteed to be consecutive.
 */
typedef enum top_ise_plic_irq_id {
  kTopIsePlicIrqIdNone = 0, /**< No Interrupt */
  kTopIsePlicIrqIdGpioGpio0 = 1, /**< gpio_gpio 0 */
  kTopIsePlicIrqIdGpioGpio1 = 2, /**< gpio_gpio 1 */
  kTopIsePlicIrqIdGpioGpio2 = 3, /**< gpio_gpio 2 */
  kTopIsePlicIrqIdGpioGpio3 = 4, /**< gpio_gpio 3 */
  kTopIsePlicIrqIdGpioGpio4 = 5, /**< gpio_gpio 4 */
  kTopIsePlicIrqIdGpioGpio5 = 6, /**< gpio_gpio 5 */
  kTopIsePlicIrqIdGpioGpio6 = 7, /**< gpio_gpio 6 */
  kTopIsePlicIrqIdGpioGpio7 = 8, /**< gpio_gpio 7 */
  kTopIsePlicIrqIdGpioGpio8 = 9, /**< gpio_gpio 8 */
  kTopIsePlicIrqIdGpioGpio9 = 10, /**< gpio_gpio 9 */
  kTopIsePlicIrqIdGpioGpio10 = 11, /**< gpio_gpio 10 */
  kTopIsePlicIrqIdGpioGpio11 = 12, /**< gpio_gpio 11 */
  kTopIsePlicIrqIdGpioGpio12 = 13, /**< gpio_gpio 12 */
  kTopIsePlicIrqIdGpioGpio13 = 14, /**< gpio_gpio 13 */
  kTopIsePlicIrqIdGpioGpio14 = 15, /**< gpio_gpio 14 */
  kTopIsePlicIrqIdGpioGpio15 = 16, /**< gpio_gpio 15 */
  kTopIsePlicIrqIdGpioGpio16 = 17, /**< gpio_gpio 16 */
  kTopIsePlicIrqIdGpioGpio17 = 18, /**< gpio_gpio 17 */
  kTopIsePlicIrqIdGpioGpio18 = 19, /**< gpio_gpio 18 */
  kTopIsePlicIrqIdGpioGpio19 = 20, /**< gpio_gpio 19 */
  kTopIsePlicIrqIdGpioGpio20 = 21, /**< gpio_gpio 20 */
  kTopIsePlicIrqIdGpioGpio21 = 22, /**< gpio_gpio 21 */
  kTopIsePlicIrqIdGpioGpio22 = 23, /**< gpio_gpio 22 */
  kTopIsePlicIrqIdGpioGpio23 = 24, /**< gpio_gpio 23 */
  kTopIsePlicIrqIdGpioGpio24 = 25, /**< gpio_gpio 24 */
  kTopIsePlicIrqIdGpioGpio25 = 26, /**< gpio_gpio 25 */
  kTopIsePlicIrqIdGpioGpio26 = 27, /**< gpio_gpio 26 */
  kTopIsePlicIrqIdGpioGpio27 = 28, /**< gpio_gpio 27 */
  kTopIsePlicIrqIdGpioGpio28 = 29, /**< gpio_gpio 28 */
  kTopIsePlicIrqIdGpioGpio29 = 30, /**< gpio_gpio 29 */
  kTopIsePlicIrqIdGpioGpio30 = 31, /**< gpio_gpio 30 */
  kTopIsePlicIrqIdGpioGpio31 = 32, /**< gpio_gpio 31 */
  kTopIsePlicIrqIdUartTxWatermark = 33, /**< uart_tx_watermark */
  kTopIsePlicIrqIdUartRxWatermark = 34, /**< uart_rx_watermark */
  kTopIsePlicIrqIdUartTxEmpty = 35, /**< uart_tx_empty */
  kTopIsePlicIrqIdUartRxOverflow = 36, /**< uart_rx_overflow */
  kTopIsePlicIrqIdUartRxFrameErr = 37, /**< uart_rx_frame_err */
  kTopIsePlicIrqIdUartRxBreakErr = 38, /**< uart_rx_break_err */
  kTopIsePlicIrqIdUartRxTimeout = 39, /**< uart_rx_timeout */
  kTopIsePlicIrqIdUartRxParityErr = 40, /**< uart_rx_parity_err */
  kTopIsePlicIrqIdSpiDeviceRxf = 41, /**< spi_device_rxf */
  kTopIsePlicIrqIdSpiDeviceRxlvl = 42, /**< spi_device_rxlvl */
  kTopIsePlicIrqIdSpiDeviceTxlvl = 43, /**< spi_device_txlvl */
  kTopIsePlicIrqIdSpiDeviceRxerr = 44, /**< spi_device_rxerr */
  kTopIsePlicIrqIdSpiDeviceRxoverflow = 45, /**< spi_device_rxoverflow */
  kTopIsePlicIrqIdSpiDeviceTxunderflow = 46, /**< spi_device_txunderflow */
  kTopIsePlicIrqIdFlashCtrlProgEmpty = 47, /**< flash_ctrl_prog_empty */
  kTopIsePlicIrqIdFlashCtrlProgLvl = 48, /**< flash_ctrl_prog_lvl */
  kTopIsePlicIrqIdFlashCtrlRdFull = 49, /**< flash_ctrl_rd_full */
  kTopIsePlicIrqIdFlashCtrlRdLvl = 50, /**< flash_ctrl_rd_lvl */
  kTopIsePlicIrqIdFlashCtrlOpDone = 51, /**< flash_ctrl_op_done */
  kTopIsePlicIrqIdFlashCtrlOpError = 52, /**< flash_ctrl_op_error */
  kTopIsePlicIrqIdHmacHmacDone = 53, /**< hmac_hmac_done */
  kTopIsePlicIrqIdHmacFifoEmpty = 54, /**< hmac_fifo_empty */
  kTopIsePlicIrqIdHmacHmacErr = 55, /**< hmac_hmac_err */
  kTopIsePlicIrqIdAlertHandlerClassa = 56, /**< alert_handler_classa */
  kTopIsePlicIrqIdAlertHandlerClassb = 57, /**< alert_handler_classb */
  kTopIsePlicIrqIdAlertHandlerClassc = 58, /**< alert_handler_classc */
  kTopIsePlicIrqIdAlertHandlerClassd = 59, /**< alert_handler_classd */
  kTopIsePlicIrqIdNmiGenEsc0 = 60, /**< nmi_gen_esc0 */
  kTopIsePlicIrqIdNmiGenEsc1 = 61, /**< nmi_gen_esc1 */
  kTopIsePlicIrqIdNmiGenEsc2 = 62, /**< nmi_gen_esc2 */
  kTopIsePlicIrqIdUsbdevPktReceived = 63, /**< usbdev_pkt_received */
  kTopIsePlicIrqIdUsbdevPktSent = 64, /**< usbdev_pkt_sent */
  kTopIsePlicIrqIdUsbdevDisconnected = 65, /**< usbdev_disconnected */
  kTopIsePlicIrqIdUsbdevHostLost = 66, /**< usbdev_host_lost */
  kTopIsePlicIrqIdUsbdevLinkReset = 67, /**< usbdev_link_reset */
  kTopIsePlicIrqIdUsbdevLinkSuspend = 68, /**< usbdev_link_suspend */
  kTopIsePlicIrqIdUsbdevLinkResume = 69, /**< usbdev_link_resume */
  kTopIsePlicIrqIdUsbdevAvEmpty = 70, /**< usbdev_av_empty */
  kTopIsePlicIrqIdUsbdevRxFull = 71, /**< usbdev_rx_full */
  kTopIsePlicIrqIdUsbdevAvOverflow = 72, /**< usbdev_av_overflow */
  kTopIsePlicIrqIdUsbdevLinkInErr = 73, /**< usbdev_link_in_err */
  kTopIsePlicIrqIdUsbdevRxCrcErr = 74, /**< usbdev_rx_crc_err */
  kTopIsePlicIrqIdUsbdevRxPidErr = 75, /**< usbdev_rx_pid_err */
  kTopIsePlicIrqIdUsbdevRxBitstuffErr = 76, /**< usbdev_rx_bitstuff_err */
  kTopIsePlicIrqIdUsbdevFrame = 77, /**< usbdev_frame */
  kTopIsePlicIrqIdUsbdevConnected = 78, /**< usbdev_connected */
  kTopIsePlicIrqIdPwrmgrWakeup = 79, /**< pwrmgr_wakeup */
  kTopIsePlicIrqIdKeymgrOpDone = 80, /**< keymgr_op_done */
  kTopIsePlicIrqIdKeymgrErr = 81, /**< keymgr_err */
  kTopIsePlicIrqIdLast = 81, /**< \internal The Last Valid Interrupt ID. */
} top_ise_plic_irq_id_t;

/**
 * PLIC Interrupt Source to Peripheral Map
 *
 * This array is a mapping from `top_ise_plic_irq_id_t` to
 * `top_ise_plic_peripheral_t`.
 */
extern const top_ise_plic_peripheral_t
    top_ise_plic_interrupt_for_peripheral[82];

/**
 * PLIC Interrupt Target.
 *
 * Enumeration used to determine which set of IE, CC, threshold registers to
 * access for a given interrupt target.
 */
typedef enum top_ise_plic_target {
  kTopIsePlicTargetIbex0 = 0, /**< Ibex Core 0 */
  kTopIsePlicTargetLast = 0, /**< \internal Final PLIC target */
} top_ise_plic_target_t;

/**
 * Alert Handler Source Peripheral.
 *
 * Enumeration used to determine which peripheral asserted the corresponding
 * alert.
 */
typedef enum top_ise_alert_peripheral {
  kTopIseAlertPeripheralAes = 0, /**< aes */
  kTopIseAlertPeripheralSensorCtrl = 1, /**< sensor_ctrl */
  kTopIseAlertPeripheralKeymgr = 2, /**< keymgr */
  kTopIseAlertPeripheralOtpCtrl = 3, /**< otp_ctrl */
  kTopIseAlertPeripheralLast = 3, /**< \internal Final Alert peripheral */
} top_ise_alert_peripheral_t;

/**
 * Alert Handler Alert Source.
 *
 * Enumeration of all Alert Handler Alert Sources. The alert sources belonging to
 * the same peripheral are guaranteed to be consecutive.
 */
typedef enum top_ise_alert_id {
  kTopIseAlertIdAesCtrlErrUpdate = 0, /**< aes_ctrl_err_update */
  kTopIseAlertIdAesCtrlErrStorage = 1, /**< aes_ctrl_err_storage */
  kTopIseAlertIdSensorCtrlAstAlerts0 = 2, /**< sensor_ctrl_ast_alerts 0 */
  kTopIseAlertIdSensorCtrlAstAlerts1 = 3, /**< sensor_ctrl_ast_alerts 1 */
  kTopIseAlertIdSensorCtrlAstAlerts2 = 4, /**< sensor_ctrl_ast_alerts 2 */
  kTopIseAlertIdSensorCtrlAstAlerts3 = 5, /**< sensor_ctrl_ast_alerts 3 */
  kTopIseAlertIdSensorCtrlAstAlerts4 = 6, /**< sensor_ctrl_ast_alerts 4 */
  kTopIseAlertIdSensorCtrlAstAlerts5 = 7, /**< sensor_ctrl_ast_alerts 5 */
  kTopIseAlertIdSensorCtrlAstAlerts6 = 8, /**< sensor_ctrl_ast_alerts 6 */
  kTopIseAlertIdKeymgrFaultErr = 9, /**< keymgr_fault_err */
  kTopIseAlertIdKeymgrOperationErr = 10, /**< keymgr_operation_err */
  kTopIseAlertIdOtpCtrlOtpMacroFailure = 11, /**< otp_ctrl_otp_macro_failure */
  kTopIseAlertIdOtpCtrlOtpCheckFailure = 12, /**< otp_ctrl_otp_check_failure */
  kTopIseAlertIdLast = 12, /**< \internal The Last Valid Alert ID. */
} top_ise_alert_id_t;

/**
 * Alert Handler Alert Source to Peripheral Map
 *
 * This array is a mapping from `top_ise_alert_id_t` to
 * `top_ise_alert_peripheral_t`.
 */
extern const top_ise_alert_peripheral_t
    top_ise_alert_for_peripheral[13];

#define PINMUX_PERIPH_INSEL_IDX_OFFSET 2

// PERIPH_INSEL ranges from 0 to NUM_MIO + 2 -1}
//  0 and 1 are tied to value 0 and 1
#define NUM_MIO 32
#define NUM_DIO 15

#define PINMUX_PERIPH_OUTSEL_IDX_OFFSET 3

/**
 * Pinmux Peripheral Input.
 */
typedef enum top_ise_pinmux_peripheral_in {
  kTopIsePinmuxPeripheralInGpioGpio0 = 0, /**< gpio_gpio 0 */
  kTopIsePinmuxPeripheralInGpioGpio1 = 1, /**< gpio_gpio 1 */
  kTopIsePinmuxPeripheralInGpioGpio2 = 2, /**< gpio_gpio 2 */
  kTopIsePinmuxPeripheralInGpioGpio3 = 3, /**< gpio_gpio 3 */
  kTopIsePinmuxPeripheralInGpioGpio4 = 4, /**< gpio_gpio 4 */
  kTopIsePinmuxPeripheralInGpioGpio5 = 5, /**< gpio_gpio 5 */
  kTopIsePinmuxPeripheralInGpioGpio6 = 6, /**< gpio_gpio 6 */
  kTopIsePinmuxPeripheralInGpioGpio7 = 7, /**< gpio_gpio 7 */
  kTopIsePinmuxPeripheralInGpioGpio8 = 8, /**< gpio_gpio 8 */
  kTopIsePinmuxPeripheralInGpioGpio9 = 9, /**< gpio_gpio 9 */
  kTopIsePinmuxPeripheralInGpioGpio10 = 10, /**< gpio_gpio 10 */
  kTopIsePinmuxPeripheralInGpioGpio11 = 11, /**< gpio_gpio 11 */
  kTopIsePinmuxPeripheralInGpioGpio12 = 12, /**< gpio_gpio 12 */
  kTopIsePinmuxPeripheralInGpioGpio13 = 13, /**< gpio_gpio 13 */
  kTopIsePinmuxPeripheralInGpioGpio14 = 14, /**< gpio_gpio 14 */
  kTopIsePinmuxPeripheralInGpioGpio15 = 15, /**< gpio_gpio 15 */
  kTopIsePinmuxPeripheralInGpioGpio16 = 16, /**< gpio_gpio 16 */
  kTopIsePinmuxPeripheralInGpioGpio17 = 17, /**< gpio_gpio 17 */
  kTopIsePinmuxPeripheralInGpioGpio18 = 18, /**< gpio_gpio 18 */
  kTopIsePinmuxPeripheralInGpioGpio19 = 19, /**< gpio_gpio 19 */
  kTopIsePinmuxPeripheralInGpioGpio20 = 20, /**< gpio_gpio 20 */
  kTopIsePinmuxPeripheralInGpioGpio21 = 21, /**< gpio_gpio 21 */
  kTopIsePinmuxPeripheralInGpioGpio22 = 22, /**< gpio_gpio 22 */
  kTopIsePinmuxPeripheralInGpioGpio23 = 23, /**< gpio_gpio 23 */
  kTopIsePinmuxPeripheralInGpioGpio24 = 24, /**< gpio_gpio 24 */
  kTopIsePinmuxPeripheralInGpioGpio25 = 25, /**< gpio_gpio 25 */
  kTopIsePinmuxPeripheralInGpioGpio26 = 26, /**< gpio_gpio 26 */
  kTopIsePinmuxPeripheralInGpioGpio27 = 27, /**< gpio_gpio 27 */
  kTopIsePinmuxPeripheralInGpioGpio28 = 28, /**< gpio_gpio 28 */
  kTopIsePinmuxPeripheralInGpioGpio29 = 29, /**< gpio_gpio 29 */
  kTopIsePinmuxPeripheralInGpioGpio30 = 30, /**< gpio_gpio 30 */
  kTopIsePinmuxPeripheralInGpioGpio31 = 31, /**< gpio_gpio 31 */
  kTopIsePinmuxPeripheralInLast = 31, /**< \internal Last valid peripheral input */
} top_ise_pinmux_peripheral_in_t;

/**
 * Pinmux MIO Input Selector.
 */
typedef enum top_ise_pinmux_insel {
  kTopIsePinmuxInselConstantZero = 0, /**< Tie constantly to zero */
  kTopIsePinmuxInselConstantOne = 1, /**< Tie constantly to one */
  kTopIsePinmuxInselMio0 = 2, /**< MIO Pad 0 */
  kTopIsePinmuxInselMio1 = 3, /**< MIO Pad 1 */
  kTopIsePinmuxInselMio2 = 4, /**< MIO Pad 2 */
  kTopIsePinmuxInselMio3 = 5, /**< MIO Pad 3 */
  kTopIsePinmuxInselMio4 = 6, /**< MIO Pad 4 */
  kTopIsePinmuxInselMio5 = 7, /**< MIO Pad 5 */
  kTopIsePinmuxInselMio6 = 8, /**< MIO Pad 6 */
  kTopIsePinmuxInselMio7 = 9, /**< MIO Pad 7 */
  kTopIsePinmuxInselMio8 = 10, /**< MIO Pad 8 */
  kTopIsePinmuxInselMio9 = 11, /**< MIO Pad 9 */
  kTopIsePinmuxInselMio10 = 12, /**< MIO Pad 10 */
  kTopIsePinmuxInselMio11 = 13, /**< MIO Pad 11 */
  kTopIsePinmuxInselMio12 = 14, /**< MIO Pad 12 */
  kTopIsePinmuxInselMio13 = 15, /**< MIO Pad 13 */
  kTopIsePinmuxInselMio14 = 16, /**< MIO Pad 14 */
  kTopIsePinmuxInselMio15 = 17, /**< MIO Pad 15 */
  kTopIsePinmuxInselMio16 = 18, /**< MIO Pad 16 */
  kTopIsePinmuxInselMio17 = 19, /**< MIO Pad 17 */
  kTopIsePinmuxInselMio18 = 20, /**< MIO Pad 18 */
  kTopIsePinmuxInselMio19 = 21, /**< MIO Pad 19 */
  kTopIsePinmuxInselMio20 = 22, /**< MIO Pad 20 */
  kTopIsePinmuxInselMio21 = 23, /**< MIO Pad 21 */
  kTopIsePinmuxInselMio22 = 24, /**< MIO Pad 22 */
  kTopIsePinmuxInselMio23 = 25, /**< MIO Pad 23 */
  kTopIsePinmuxInselMio24 = 26, /**< MIO Pad 24 */
  kTopIsePinmuxInselMio25 = 27, /**< MIO Pad 25 */
  kTopIsePinmuxInselMio26 = 28, /**< MIO Pad 26 */
  kTopIsePinmuxInselMio27 = 29, /**< MIO Pad 27 */
  kTopIsePinmuxInselMio28 = 30, /**< MIO Pad 28 */
  kTopIsePinmuxInselMio29 = 31, /**< MIO Pad 29 */
  kTopIsePinmuxInselMio30 = 32, /**< MIO Pad 30 */
  kTopIsePinmuxInselMio31 = 33, /**< MIO Pad 31 */
  kTopIsePinmuxInselLast = 33, /**< \internal Last valid insel value */
} top_ise_pinmux_insel_t;

/**
 * Pinmux MIO Output.
 */
typedef enum top_ise_pinmux_mio_out {
  kTopIsePinmuxMioOut0 = 0, /**< MIO Pad 0 */
  kTopIsePinmuxMioOut1 = 1, /**< MIO Pad 1 */
  kTopIsePinmuxMioOut2 = 2, /**< MIO Pad 2 */
  kTopIsePinmuxMioOut3 = 3, /**< MIO Pad 3 */
  kTopIsePinmuxMioOut4 = 4, /**< MIO Pad 4 */
  kTopIsePinmuxMioOut5 = 5, /**< MIO Pad 5 */
  kTopIsePinmuxMioOut6 = 6, /**< MIO Pad 6 */
  kTopIsePinmuxMioOut7 = 7, /**< MIO Pad 7 */
  kTopIsePinmuxMioOut8 = 8, /**< MIO Pad 8 */
  kTopIsePinmuxMioOut9 = 9, /**< MIO Pad 9 */
  kTopIsePinmuxMioOut10 = 10, /**< MIO Pad 10 */
  kTopIsePinmuxMioOut11 = 11, /**< MIO Pad 11 */
  kTopIsePinmuxMioOut12 = 12, /**< MIO Pad 12 */
  kTopIsePinmuxMioOut13 = 13, /**< MIO Pad 13 */
  kTopIsePinmuxMioOut14 = 14, /**< MIO Pad 14 */
  kTopIsePinmuxMioOut15 = 15, /**< MIO Pad 15 */
  kTopIsePinmuxMioOut16 = 16, /**< MIO Pad 16 */
  kTopIsePinmuxMioOut17 = 17, /**< MIO Pad 17 */
  kTopIsePinmuxMioOut18 = 18, /**< MIO Pad 18 */
  kTopIsePinmuxMioOut19 = 19, /**< MIO Pad 19 */
  kTopIsePinmuxMioOut20 = 20, /**< MIO Pad 20 */
  kTopIsePinmuxMioOut21 = 21, /**< MIO Pad 21 */
  kTopIsePinmuxMioOut22 = 22, /**< MIO Pad 22 */
  kTopIsePinmuxMioOut23 = 23, /**< MIO Pad 23 */
  kTopIsePinmuxMioOut24 = 24, /**< MIO Pad 24 */
  kTopIsePinmuxMioOut25 = 25, /**< MIO Pad 25 */
  kTopIsePinmuxMioOut26 = 26, /**< MIO Pad 26 */
  kTopIsePinmuxMioOut27 = 27, /**< MIO Pad 27 */
  kTopIsePinmuxMioOut28 = 28, /**< MIO Pad 28 */
  kTopIsePinmuxMioOut29 = 29, /**< MIO Pad 29 */
  kTopIsePinmuxMioOut30 = 30, /**< MIO Pad 30 */
  kTopIsePinmuxMioOut31 = 31, /**< MIO Pad 31 */
  kTopIsePinmuxMioOutLast = 31, /**< \internal Last valid mio output */
} top_ise_pinmux_mio_out_t;

/**
 * Pinmux Peripheral Output Selector.
 */
typedef enum top_ise_pinmux_outsel {
  kTopIsePinmuxOutselConstantZero = 0, /**< Tie constantly to zero */
  kTopIsePinmuxOutselConstantOne = 1, /**< Tie constantly to one */
  kTopIsePinmuxOutselConstantHighZ = 2, /**< Tie constantly to high-Z */
  kTopIsePinmuxOutselGpioGpio0 = 3, /**< gpio_gpio 0 */
  kTopIsePinmuxOutselGpioGpio1 = 4, /**< gpio_gpio 1 */
  kTopIsePinmuxOutselGpioGpio2 = 5, /**< gpio_gpio 2 */
  kTopIsePinmuxOutselGpioGpio3 = 6, /**< gpio_gpio 3 */
  kTopIsePinmuxOutselGpioGpio4 = 7, /**< gpio_gpio 4 */
  kTopIsePinmuxOutselGpioGpio5 = 8, /**< gpio_gpio 5 */
  kTopIsePinmuxOutselGpioGpio6 = 9, /**< gpio_gpio 6 */
  kTopIsePinmuxOutselGpioGpio7 = 10, /**< gpio_gpio 7 */
  kTopIsePinmuxOutselGpioGpio8 = 11, /**< gpio_gpio 8 */
  kTopIsePinmuxOutselGpioGpio9 = 12, /**< gpio_gpio 9 */
  kTopIsePinmuxOutselGpioGpio10 = 13, /**< gpio_gpio 10 */
  kTopIsePinmuxOutselGpioGpio11 = 14, /**< gpio_gpio 11 */
  kTopIsePinmuxOutselGpioGpio12 = 15, /**< gpio_gpio 12 */
  kTopIsePinmuxOutselGpioGpio13 = 16, /**< gpio_gpio 13 */
  kTopIsePinmuxOutselGpioGpio14 = 17, /**< gpio_gpio 14 */
  kTopIsePinmuxOutselGpioGpio15 = 18, /**< gpio_gpio 15 */
  kTopIsePinmuxOutselGpioGpio16 = 19, /**< gpio_gpio 16 */
  kTopIsePinmuxOutselGpioGpio17 = 20, /**< gpio_gpio 17 */
  kTopIsePinmuxOutselGpioGpio18 = 21, /**< gpio_gpio 18 */
  kTopIsePinmuxOutselGpioGpio19 = 22, /**< gpio_gpio 19 */
  kTopIsePinmuxOutselGpioGpio20 = 23, /**< gpio_gpio 20 */
  kTopIsePinmuxOutselGpioGpio21 = 24, /**< gpio_gpio 21 */
  kTopIsePinmuxOutselGpioGpio22 = 25, /**< gpio_gpio 22 */
  kTopIsePinmuxOutselGpioGpio23 = 26, /**< gpio_gpio 23 */
  kTopIsePinmuxOutselGpioGpio24 = 27, /**< gpio_gpio 24 */
  kTopIsePinmuxOutselGpioGpio25 = 28, /**< gpio_gpio 25 */
  kTopIsePinmuxOutselGpioGpio26 = 29, /**< gpio_gpio 26 */
  kTopIsePinmuxOutselGpioGpio27 = 30, /**< gpio_gpio 27 */
  kTopIsePinmuxOutselGpioGpio28 = 31, /**< gpio_gpio 28 */
  kTopIsePinmuxOutselGpioGpio29 = 32, /**< gpio_gpio 29 */
  kTopIsePinmuxOutselGpioGpio30 = 33, /**< gpio_gpio 30 */
  kTopIsePinmuxOutselGpioGpio31 = 34, /**< gpio_gpio 31 */
  kTopIsePinmuxOutselLast = 34, /**< \internal Last valid outsel value */
} top_ise_pinmux_outsel_t;

/**
 * Power Manager Wakeup Signals
 */
typedef enum top_ise_power_manager_wake_ups {
  kTopIsePowerManagerWakeUpsPinmuxAonWkupReq = 0, /**<  */
  kTopIsePowerManagerWakeUpsLast = 0, /**< \internal Last valid pwrmgr wakeup signal */
} top_ise_power_manager_wake_ups_t;

/**
 * Reset Manager Software Controlled Resets
 */
typedef enum top_ise_reset_manager_sw_resets {
  kTopIseResetManagerSwResetsSpiDevice = 0, /**<  */
  kTopIseResetManagerSwResetsUsb = 1, /**<  */
  kTopIseResetManagerSwResetsLast = 1, /**< \internal Last valid rstmgr software reset request */
} top_ise_reset_manager_sw_resets_t;

/**
 * Power Manager Reset Request Signals
 */
typedef enum top_ise_power_manager_reset_requests {
  kTopIsePowerManagerResetRequestsNmiGenNmiRstReq = 0, /**<  */
  kTopIsePowerManagerResetRequestsLast = 0, /**< \internal Last valid pwrmgr reset_request signal */
} top_ise_power_manager_reset_requests_t;


// Header Extern Guard
#ifdef __cplusplus
}  // extern "C"
#endif

#endif  // OPENTITAN_HW_TOP_ISE_SW_AUTOGEN_TOP_ISE_H_

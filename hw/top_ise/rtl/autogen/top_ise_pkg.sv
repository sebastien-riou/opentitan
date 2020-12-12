// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// ------------------- W A R N I N G: A U T O - G E N E R A T E D   C O D E !! -------------------//
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED WITH THE FOLLOWING COMMAND:
//
// util/topgen.py -t hw/top_ise/data/top_ise.hjson \
//                --tpl hw/top_earlgrey/data/ \
//                -o hw/top_ise/ \
//                --rnd_cnst_seed 4881560218908238235

package top_ise_pkg;
  /**
   * Peripheral base address for uart in top ise.
   */
  parameter int unsigned TOP_ISE_UART_BASE_ADDR = 32'h40000000;

  /**
   * Peripheral size in bytes for uart in top ise.
   */
  parameter int unsigned TOP_ISE_UART_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for gpio in top ise.
   */
  parameter int unsigned TOP_ISE_GPIO_BASE_ADDR = 32'h40010000;

  /**
   * Peripheral size in bytes for gpio in top ise.
   */
  parameter int unsigned TOP_ISE_GPIO_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for spi_device in top ise.
   */
  parameter int unsigned TOP_ISE_SPI_DEVICE_BASE_ADDR = 32'h40020000;

  /**
   * Peripheral size in bytes for spi_device in top ise.
   */
  parameter int unsigned TOP_ISE_SPI_DEVICE_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for flash_ctrl in top ise.
   */
  parameter int unsigned TOP_ISE_FLASH_CTRL_BASE_ADDR = 32'h40030000;

  /**
   * Peripheral size in bytes for flash_ctrl in top ise.
   */
  parameter int unsigned TOP_ISE_FLASH_CTRL_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for rv_timer in top ise.
   */
  parameter int unsigned TOP_ISE_RV_TIMER_BASE_ADDR = 32'h40080000;

  /**
   * Peripheral size in bytes for rv_timer in top ise.
   */
  parameter int unsigned TOP_ISE_RV_TIMER_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for ise in top ise.
   */
  parameter int unsigned TOP_ISE_ISE_BASE_ADDR = 32'h400F0000;

  /**
   * Peripheral size in bytes for ise in top ise.
   */
  parameter int unsigned TOP_ISE_ISE_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for ipc in top ise.
   */
  parameter int unsigned TOP_ISE_IPC_BASE_ADDR = 32'h400E0000;

  /**
   * Peripheral size in bytes for ipc in top ise.
   */
  parameter int unsigned TOP_ISE_IPC_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for aes in top ise.
   */
  parameter int unsigned TOP_ISE_AES_BASE_ADDR = 32'h40110000;

  /**
   * Peripheral size in bytes for aes in top ise.
   */
  parameter int unsigned TOP_ISE_AES_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for hmac in top ise.
   */
  parameter int unsigned TOP_ISE_HMAC_BASE_ADDR = 32'h40120000;

  /**
   * Peripheral size in bytes for hmac in top ise.
   */
  parameter int unsigned TOP_ISE_HMAC_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for rv_plic in top ise.
   */
  parameter int unsigned TOP_ISE_RV_PLIC_BASE_ADDR = 32'h40090000;

  /**
   * Peripheral size in bytes for rv_plic in top ise.
   */
  parameter int unsigned TOP_ISE_RV_PLIC_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for pinmux in top ise.
   */
  parameter int unsigned TOP_ISE_PINMUX_BASE_ADDR = 32'h40070000;

  /**
   * Peripheral size in bytes for pinmux in top ise.
   */
  parameter int unsigned TOP_ISE_PINMUX_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for padctrl in top ise.
   */
  parameter int unsigned TOP_ISE_PADCTRL_BASE_ADDR = 32'h40160000;

  /**
   * Peripheral size in bytes for padctrl in top ise.
   */
  parameter int unsigned TOP_ISE_PADCTRL_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for alert_handler in top ise.
   */
  parameter int unsigned TOP_ISE_ALERT_HANDLER_BASE_ADDR = 32'h40130000;

  /**
   * Peripheral size in bytes for alert_handler in top ise.
   */
  parameter int unsigned TOP_ISE_ALERT_HANDLER_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for pwrmgr in top ise.
   */
  parameter int unsigned TOP_ISE_PWRMGR_BASE_ADDR = 32'h400A0000;

  /**
   * Peripheral size in bytes for pwrmgr in top ise.
   */
  parameter int unsigned TOP_ISE_PWRMGR_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for rstmgr in top ise.
   */
  parameter int unsigned TOP_ISE_RSTMGR_BASE_ADDR = 32'h400B0000;

  /**
   * Peripheral size in bytes for rstmgr in top ise.
   */
  parameter int unsigned TOP_ISE_RSTMGR_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for clkmgr in top ise.
   */
  parameter int unsigned TOP_ISE_CLKMGR_BASE_ADDR = 32'h400C0000;

  /**
   * Peripheral size in bytes for clkmgr in top ise.
   */
  parameter int unsigned TOP_ISE_CLKMGR_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for nmi_gen in top ise.
   */
  parameter int unsigned TOP_ISE_NMI_GEN_BASE_ADDR = 32'h40140000;

  /**
   * Peripheral size in bytes for nmi_gen in top ise.
   */
  parameter int unsigned TOP_ISE_NMI_GEN_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for usbdev in top ise.
   */
  parameter int unsigned TOP_ISE_USBDEV_BASE_ADDR = 32'h40150000;

  /**
   * Peripheral size in bytes for usbdev in top ise.
   */
  parameter int unsigned TOP_ISE_USBDEV_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for sensor_ctrl in top ise.
   */
  parameter int unsigned TOP_ISE_SENSOR_CTRL_BASE_ADDR = 32'h40170000;

  /**
   * Peripheral size in bytes for sensor_ctrl in top ise.
   */
  parameter int unsigned TOP_ISE_SENSOR_CTRL_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for keymgr in top ise.
   */
  parameter int unsigned TOP_ISE_KEYMGR_BASE_ADDR = 32'h401a0000;

  /**
   * Peripheral size in bytes for keymgr in top ise.
   */
  parameter int unsigned TOP_ISE_KEYMGR_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for otp_ctrl in top ise.
   */
  parameter int unsigned TOP_ISE_OTP_CTRL_BASE_ADDR = 32'h401b0000;

  /**
   * Peripheral size in bytes for otp_ctrl in top ise.
   */
  parameter int unsigned TOP_ISE_OTP_CTRL_SIZE_BYTES = 32'h4000;

  /**
   * Memory base address for rom in top ise.
   */
  parameter int unsigned TOP_ISE_ROM_BASE_ADDR = 32'h00008000;

  /**
   * Memory size for rom in top ise.
   */
  parameter int unsigned TOP_ISE_ROM_SIZE_BYTES = 32'h4000;

  /**
   * Memory base address for ram_main in top ise.
   */
  parameter int unsigned TOP_ISE_RAM_MAIN_BASE_ADDR = 32'h10000000;

  /**
   * Memory size for ram_main in top ise.
   */
  parameter int unsigned TOP_ISE_RAM_MAIN_SIZE_BYTES = 32'h10000;

  /**
   * Memory base address for ram_ret in top ise.
   */
  parameter int unsigned TOP_ISE_RAM_RET_BASE_ADDR = 32'h18000000;

  /**
   * Memory size for ram_ret in top ise.
   */
  parameter int unsigned TOP_ISE_RAM_RET_SIZE_BYTES = 32'h1000;

  /**
   * Memory base address for eflash in top ise.
   */
  parameter int unsigned TOP_ISE_EFLASH_BASE_ADDR = 32'h20000000;

  /**
   * Memory size for eflash in top ise.
   */
  parameter int unsigned TOP_ISE_EFLASH_SIZE_BYTES = 32'h10000;

  // Enumeration for DIO pins.
  typedef enum {
    TopIseDioPinUsbdevDn = 0,
    TopIseDioPinUsbdevDp = 1,
    TopIseDioPinUsbdevD = 2,
    TopIseDioPinUsbdevSuspend = 3,
    TopIseDioPinUsbdevTxModeSe = 4,
    TopIseDioPinUsbdevDnPullup = 5,
    TopIseDioPinUsbdevDpPullup = 6,
    TopIseDioPinUsbdevSe0 = 7,
    TopIseDioPinUsbdevSense = 8,
    TopIseDioPinUartTx = 9,
    TopIseDioPinUartRx = 10,
    TopIseDioPinSpiDeviceSdo = 11,
    TopIseDioPinSpiDeviceSdi = 12,
    TopIseDioPinSpiDeviceCsb = 13,
    TopIseDioPinSpiDeviceSck = 14,
    TopIseDioPinCount = 15
  } top_ise_dio_pin_e;

  // TODO: Enumeration for PLIC Interrupt source peripheral.
  // TODO: Enumeration for PLIC Interrupt Ids.

endpackage

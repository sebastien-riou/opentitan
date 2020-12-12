// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "hw/top_ise/sw/autogen/top_ise.h"

/**
 * PLIC Interrupt Source to Peripheral Map
 *
 * This array is a mapping from `top_ise_plic_irq_id_t` to
 * `top_ise_plic_peripheral_t`.
 */
const top_ise_plic_peripheral_t
    top_ise_plic_interrupt_for_peripheral[82] = {
  [kTopIsePlicIrqIdNone] = kTopIsePlicPeripheralUnknown,
  [kTopIsePlicIrqIdGpioGpio0] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio1] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio2] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio3] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio4] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio5] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio6] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio7] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio8] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio9] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio10] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio11] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio12] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio13] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio14] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio15] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio16] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio17] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio18] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio19] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio20] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio21] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio22] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio23] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio24] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio25] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio26] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio27] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio28] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio29] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio30] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdGpioGpio31] = kTopIsePlicPeripheralGpio,
  [kTopIsePlicIrqIdUartTxWatermark] = kTopIsePlicPeripheralUart,
  [kTopIsePlicIrqIdUartRxWatermark] = kTopIsePlicPeripheralUart,
  [kTopIsePlicIrqIdUartTxEmpty] = kTopIsePlicPeripheralUart,
  [kTopIsePlicIrqIdUartRxOverflow] = kTopIsePlicPeripheralUart,
  [kTopIsePlicIrqIdUartRxFrameErr] = kTopIsePlicPeripheralUart,
  [kTopIsePlicIrqIdUartRxBreakErr] = kTopIsePlicPeripheralUart,
  [kTopIsePlicIrqIdUartRxTimeout] = kTopIsePlicPeripheralUart,
  [kTopIsePlicIrqIdUartRxParityErr] = kTopIsePlicPeripheralUart,
  [kTopIsePlicIrqIdSpiDeviceRxf] = kTopIsePlicPeripheralSpiDevice,
  [kTopIsePlicIrqIdSpiDeviceRxlvl] = kTopIsePlicPeripheralSpiDevice,
  [kTopIsePlicIrqIdSpiDeviceTxlvl] = kTopIsePlicPeripheralSpiDevice,
  [kTopIsePlicIrqIdSpiDeviceRxerr] = kTopIsePlicPeripheralSpiDevice,
  [kTopIsePlicIrqIdSpiDeviceRxoverflow] = kTopIsePlicPeripheralSpiDevice,
  [kTopIsePlicIrqIdSpiDeviceTxunderflow] = kTopIsePlicPeripheralSpiDevice,
  [kTopIsePlicIrqIdFlashCtrlProgEmpty] = kTopIsePlicPeripheralFlashCtrl,
  [kTopIsePlicIrqIdFlashCtrlProgLvl] = kTopIsePlicPeripheralFlashCtrl,
  [kTopIsePlicIrqIdFlashCtrlRdFull] = kTopIsePlicPeripheralFlashCtrl,
  [kTopIsePlicIrqIdFlashCtrlRdLvl] = kTopIsePlicPeripheralFlashCtrl,
  [kTopIsePlicIrqIdFlashCtrlOpDone] = kTopIsePlicPeripheralFlashCtrl,
  [kTopIsePlicIrqIdFlashCtrlOpError] = kTopIsePlicPeripheralFlashCtrl,
  [kTopIsePlicIrqIdHmacHmacDone] = kTopIsePlicPeripheralHmac,
  [kTopIsePlicIrqIdHmacFifoEmpty] = kTopIsePlicPeripheralHmac,
  [kTopIsePlicIrqIdHmacHmacErr] = kTopIsePlicPeripheralHmac,
  [kTopIsePlicIrqIdAlertHandlerClassa] = kTopIsePlicPeripheralAlertHandler,
  [kTopIsePlicIrqIdAlertHandlerClassb] = kTopIsePlicPeripheralAlertHandler,
  [kTopIsePlicIrqIdAlertHandlerClassc] = kTopIsePlicPeripheralAlertHandler,
  [kTopIsePlicIrqIdAlertHandlerClassd] = kTopIsePlicPeripheralAlertHandler,
  [kTopIsePlicIrqIdNmiGenEsc0] = kTopIsePlicPeripheralNmiGen,
  [kTopIsePlicIrqIdNmiGenEsc1] = kTopIsePlicPeripheralNmiGen,
  [kTopIsePlicIrqIdNmiGenEsc2] = kTopIsePlicPeripheralNmiGen,
  [kTopIsePlicIrqIdUsbdevPktReceived] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevPktSent] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevDisconnected] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevHostLost] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevLinkReset] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevLinkSuspend] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevLinkResume] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevAvEmpty] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevRxFull] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevAvOverflow] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevLinkInErr] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevRxCrcErr] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevRxPidErr] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevRxBitstuffErr] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevFrame] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdUsbdevConnected] = kTopIsePlicPeripheralUsbdev,
  [kTopIsePlicIrqIdPwrmgrWakeup] = kTopIsePlicPeripheralPwrmgr,
  [kTopIsePlicIrqIdKeymgrOpDone] = kTopIsePlicPeripheralKeymgr,
  [kTopIsePlicIrqIdKeymgrErr] = kTopIsePlicPeripheralKeymgr,
};


/**
 * Alert Handler Alert Source to Peripheral Map
 *
 * This array is a mapping from `top_ise_alert_id_t` to
 * `top_ise_alert_peripheral_t`.
 */
const top_ise_alert_peripheral_t
    top_ise_alert_for_peripheral[13] = {
  [kTopIseAlertIdAesCtrlErrUpdate] = kTopIseAlertPeripheralAes,
  [kTopIseAlertIdAesCtrlErrStorage] = kTopIseAlertPeripheralAes,
  [kTopIseAlertIdSensorCtrlAstAlerts0] = kTopIseAlertPeripheralSensorCtrl,
  [kTopIseAlertIdSensorCtrlAstAlerts1] = kTopIseAlertPeripheralSensorCtrl,
  [kTopIseAlertIdSensorCtrlAstAlerts2] = kTopIseAlertPeripheralSensorCtrl,
  [kTopIseAlertIdSensorCtrlAstAlerts3] = kTopIseAlertPeripheralSensorCtrl,
  [kTopIseAlertIdSensorCtrlAstAlerts4] = kTopIseAlertPeripheralSensorCtrl,
  [kTopIseAlertIdSensorCtrlAstAlerts5] = kTopIseAlertPeripheralSensorCtrl,
  [kTopIseAlertIdSensorCtrlAstAlerts6] = kTopIseAlertPeripheralSensorCtrl,
  [kTopIseAlertIdKeymgrFaultErr] = kTopIseAlertPeripheralKeymgr,
  [kTopIseAlertIdKeymgrOperationErr] = kTopIseAlertPeripheralKeymgr,
  [kTopIseAlertIdOtpCtrlOtpMacroFailure] = kTopIseAlertPeripheralOtpCtrl,
  [kTopIseAlertIdOtpCtrlOtpCheckFailure] = kTopIseAlertPeripheralOtpCtrl,
};


#ifndef __IPC_BASIC_TEST_H__
#define __IPC_BASIC_TEST_H__

#include <stdint.h>

#define IPC_NLOCK      ipc_tesic_04020r10_NLOCK
#define IPC_NSIGS      ipc_tesic_04020r10_NSIGS
#define IPC_NDATA      ipc_tesic_04020r10_NDATA
#define IPC_SIGS_NOUT  ipc_tesic_04020r10_SIGS_NOUT

static void ipctest_reset_values(){
    ASSERT_EQ_VAL(IPC->CTRL, 0);
    ASSERT_EQ_VAL(IPC->CONF, IPC_CONF(0,1,IPC_NLOCK,IPC_NSIGS,IPC_NDATA));
    for(unsigned int i=0;i<IPC_NLOCK;i++){
        ASSERT_EQ_VAL(IPC->LOCK[i],0);
    }
    for(unsigned int i=0;i<IPC_NSIGS;i++){
        ASSERT_EQ_VAL(IPC->SIGS[i].SIG,0);
    }
    for(unsigned int i=0;i<IPC_NDATA;i++){
        ASSERT_EQ_VAL(IPC->DATA[i],0);
    }
    println("reset_values OK");
}
static void ipctest_ctrl_writeread(){
	IPC->CTRL=0;
    ASSERT_EQ_VAL(IPC->CTRL, 0);
    IPC->CTRL=0xFFFFFFFF;
    ASSERT_EQ_VAL(IPC->CTRL, (1<<IPC_OWNER_WIDTH)-1);
    IPC->CTRL=0;
}
static void ipctest_conf_writeread(){
	IPC->CONF=0;
    ASSERT_EQ_VAL(IPC->CONF, IPC_CONF(0,1,IPC_NLOCK,IPC_NSIGS,IPC_NDATA));
    IPC->CONF=0xFFFFFFFF;
    ASSERT_EQ_VAL(IPC->CONF, IPC_CONF(0,1,IPC_NLOCK,IPC_NSIGS,IPC_NDATA));
}
static void ipctest_fill_data(uint32_t val){
	for(unsigned int i=0;i<IPC_NDATA;i++){
		IPC->DATA[i] = val;
        ASSERT_EQ_VAL(IPC->DATA[i],val);
    }
}
static void ipctest_fill_sigs(uint32_t val){
	for(unsigned int i=0;i<IPC_NSIGS;i++){
		IPC->SIGS[i].SIG = val;
        ASSERT_EQ_VAL(IPC->SIGS[i].SIG,val & IPC_SIGS_MASK(IPC_SIGS_NOUT));
    }
}
static void ipctest_fill_lock(uint32_t val){
	for(unsigned int i=0;i<IPC_NLOCK;i++){
		IPC->LOCK[i] = val;
        ASSERT_EQ_VAL(IPC->LOCK[i],val);
    }
}
static void ipctest_check_data(uint32_t val){
	for(unsigned int i=0;i<IPC_NDATA;i++){
		ASSERT_EQ_VAL(IPC->DATA[i],val);
    }
}
static void ipctest_check_sigs(uint32_t val){
	for(unsigned int i=0;i<IPC_NSIGS;i++){
		ASSERT_EQ_VAL(IPC->SIGS[i].SIG,val & IPC_SIGS_MASK(IPC_SIGS_NOUT));
    }
}
static void ipctest_check_lock(uint32_t val){
	for(unsigned int i=0;i<IPC_NLOCK;i++){
		ASSERT_EQ_VAL(IPC->LOCK[i],val);
    }
}
static void ipctest_data_writeread(){
	ipctest_fill_data(0x55555555);
	ipctest_fill_data(0xFFFFFFFF);
	ipctest_fill_data(0);
}
static void ipctest_sigs_writeread(){
	ipctest_fill_sigs(0x55555555);
	ipctest_fill_sigs(0xFFFFFFFF);
	ipctest_fill_sigs(0);
}
static void ipctest_lock_writeread(){
	ipctest_fill_lock(0x55555555);
	ipctest_fill_lock(0xFFFFFFFF);
	ipctest_fill_lock(0);
}
static void ipctest_writeread(){
    ipctest_ctrl_writeread();
    ipctest_conf_writeread();
    ipctest_data_writeread();
    ipctest_sigs_writeread();
    ipctest_lock_writeread();
    println("writeread OK");
}
static void ipctest_ctrl_clear(){
    ipctest_fill_data(0x33333333);
    ipctest_fill_sigs(0x55555555);
    ipctest_fill_lock(0x77777777);
    IPC->CTRL |= IPC_CTRL_DATA_CLEAR;
    ipctest_check_data(0);
    ipctest_check_sigs(0x55555555);
    ipctest_check_lock(0x77777777);
    ipctest_fill_data(0x33333333);
    IPC->CTRL |= IPC_CTRL_SIGS_CLEAR;
    ipctest_check_data(0x33333333);
    ipctest_check_sigs(0);
    ipctest_check_lock(0x77777777);
    ipctest_fill_sigs(0x55555555);
    IPC->CTRL |= IPC_CTRL_LOCK_CLEAR;
    ipctest_check_data(0x33333333);
    ipctest_check_sigs(0x55555555);
    ipctest_check_lock(0);
    println("ctrl_clear OK");
}
static void ipctest(){
    ipctest_reset_values();
    ipctest_writeread();
    ipctest_ctrl_clear();
    println("ipctest OK");
}

#endif //__IPC_BASIC_TEST_H__

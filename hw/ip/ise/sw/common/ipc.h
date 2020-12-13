//Generic description of IPC hardware
//Instance parameters are supposed to be in another header file which include this one
#ifndef __IPC_H__
#define __IPC_H__

#define IPC_OWNER_WIDTH 5
#define IPC_NID_WIDTH   6
#define IPC_NLOCK_WIDTH 6
#define IPC_NSIGS_WIDTH 6
#define IPC_NDATA_WIDTH 8

#define IPC_MAX_LOCKS (1<<(IPC_NLOCK_WIDTH-1))
#define IPC_MAX_SIGS  (1<<(IPC_NSIGS_WIDTH-1))
#define IPC_MAX_DATA  (1<<(IPC_NDATA_WIDTH-1))

#define IPC_CTRL_DATA_CLEAR 0x20
#define IPC_CTRL_SIGS_CLEAR 0x40
#define IPC_CTRL_LOCK_CLEAR 0x80

#define IPC_CONF_OWNER_OFFSET 0
#define IPC_CONF_NID_OFFSET   (IPC_CONF_OWNER_OFFSET+IPC_OWNER_WIDTH)
#define IPC_CONF_NDATA_OFFSET (IPC_CONF_NID_OFFSET  +IPC_NID_WIDTH)
#define IPC_CONF_NSIGS_OFFSET (IPC_CONF_NDATA_OFFSET+IPC_NDATA_WIDTH)
#define IPC_CONF_NLOCK_OFFSET (IPC_CONF_NSIGS_OFFSET+IPC_NSIGS_WIDTH)

#define IPC_CONF(OWNER,NID,NLOCK,NSIGS,NDATA) ( \
    (OWNER << IPC_CONF_OWNER_OFFSET) | \
    (NID   << IPC_CONF_NID_OFFSET  ) | \
    (NLOCK << IPC_CONF_NLOCK_OFFSET) | \
    (NSIGS << IPC_CONF_NSIGS_OFFSET) | \
    (NDATA << IPC_CONF_NDATA_OFFSET) )

#define IPC_SIGS_MASK(SIGS_NOUT) ((1<<SIGS_NOUT)-1)
    
typedef struct IPC_SIG_struct_t{
    volatile uint32_t SIG;
    volatile uint32_t SIGRD;
    volatile uint32_t SIGCLR;
    volatile uint32_t SIGSET;
} IPC_SIG_t;

typedef struct IPC_struct_t{
    volatile uint32_t DATA[IPC_MAX_DATA]; 
    IPC_SIG_t         SIGS[IPC_MAX_SIGS];          
    volatile uint32_t LOCK[IPC_MAX_LOCKS];
    volatile uint32_t CTRL;
    volatile uint32_t CONF;          
} IPC_t; // 2KB

#endif // __IPC_H__

;*******************************************************************************
;* File Name          : startup_stm32h523xx.s
;* Author             : MCD Application Team
;* Description        : STM32H523xx Non Crypto devices vector table for MDK-ARM toolchain.
;*                      This module performs:
;*                      - Set the initial SP
;*                      - Set the initial PC == Reset_Handler
;*                      - Set the vector table entries with the exceptions ISR address
;*                      - Branches to __main in the C library (which eventually
;*                        calls main()).
;*                      After Reset the Cortex-M33 processor is in Thread mode,
;*                      priority is Privileged, and the Stack is set to Main.
;*******************************************************************************
;* @attention
;*
;* Copyright (c) 2023 STMicroelectronics.
;* All rights reserved.
;*
;* This software is licensed under terms that can be found in the LICENSE file
;* in the root directory of this software component.
;* If no LICENSE file comes with this software, it is provided AS-IS.
;*
;*******************************************************************************
;* <<< Use Configuration Wizard in Context Menu >>>
;
; Amount of memory (in bytes) allocated for Stack
; Tailor this value to your application needs
; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000000

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit

                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset
                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp                     ; Top of Stack
                DCD     Reset_Handler                    ; Reset Handler
                DCD     NMI_Handler                      ; NMI Handler
                DCD     HardFault_Handler                ; Hard Fault Handler
                DCD     MemManage_Handler                ; MPU Fault Handler
                DCD     BusFault_Handler                 ; Bus Fault Handler
                DCD     UsageFault_Handler               ; Usage Fault Handler
                DCD     SecureFault_Handler              ; Secure Fault Handler
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     SVC_Handler                      ; SVCall Handler
                DCD     DebugMon_Handler                 ; Debug Monitor Handler
                DCD     0                                ; Reserved
                DCD     PendSV_Handler                   ; PendSV Handler
                DCD     SysTick_Handler                  ; SysTick Handler
                ; External Interrupts
                DCD     WWDG_IRQHandler                  ; Window WatchDog
                DCD     PVD_AVD_IRQHandler               ; PVD/AVD through EXTI Line detection Interrupt
                DCD     RTC_IRQHandler                   ; RTC non-secure interrupt
                DCD     RTC_S_IRQHandler                 ; RTC secure interrupt
                DCD     TAMP_IRQHandler                  ; Tamper non-secure interrupt
                DCD     RAMCFG_IRQHandler                ; RAMCFG global
                DCD     FLASH_IRQHandler                 ; FLASH non-secure global interrupt
                DCD     FLASH_S_IRQHandler               ; FLASH secure global interrupt
                DCD     GTZC_IRQHandler                  ; Global TrustZone Controller interrupt
                DCD     RCC_IRQHandler                   ; RCC non-secure global interrupt
                DCD     RCC_S_IRQHandler                 ; RCC secure global interrupt
                DCD     EXTI0_IRQHandler                 ; EXTI Line0 interrupt
                DCD     EXTI1_IRQHandler                 ; EXTI Line1 interrupt
                DCD     EXTI2_IRQHandler                 ; EXTI Line2 interrupt
                DCD     EXTI3_IRQHandler                 ; EXTI Line3 interrupt
                DCD     EXTI4_IRQHandler                 ; EXTI Line4 interrupt
                DCD     EXTI5_IRQHandler                 ; EXTI Line5 interrupt
                DCD     EXTI6_IRQHandler                 ; EXTI Line6 interrupt
                DCD     EXTI7_IRQHandler                 ; EXTI Line7 interrupt
                DCD     EXTI8_IRQHandler                 ; EXTI Line8 interrupt
                DCD     EXTI9_IRQHandler                 ; EXTI Line9 interrupt
                DCD     EXTI10_IRQHandler                ; EXTI Line10 interrupt
                DCD     EXTI11_IRQHandler                ; EXTI Line11 interrupt
                DCD     EXTI12_IRQHandler                ; EXTI Line12 interrupt
                DCD     EXTI13_IRQHandler                ; EXTI Line13 interrupt
                DCD     EXTI14_IRQHandler                ; EXTI Line14 interrupt
                DCD     EXTI15_IRQHandler                ; EXTI Line15 interrupt
                DCD     GPDMA1_Channel0_IRQHandler       ; GPDMA1 Channel 0 global interrupt
                DCD     GPDMA1_Channel1_IRQHandler       ; GPDMA1 Channel 1 global interrupt
                DCD     GPDMA1_Channel2_IRQHandler       ; GPDMA1 Channel 2 global interrupt
                DCD     GPDMA1_Channel3_IRQHandler       ; GPDMA1 Channel 3 global interrupt
                DCD     GPDMA1_Channel4_IRQHandler       ; GPDMA1 Channel 4 global interrupt
                DCD     GPDMA1_Channel5_IRQHandler       ; GPDMA1 Channel 5 global interrupt
                DCD     GPDMA1_Channel6_IRQHandler       ; GPDMA1 Channel 6 global interrupt
                DCD     GPDMA1_Channel7_IRQHandler       ; GPDMA1 Channel 7 global interrupt
                DCD     IWDG_IRQHandler                  ; IWDG global interrupt
                DCD     0                                ; Reserved
                DCD     ADC1_IRQHandler                  ; ADC1 global interrupt
                DCD     DAC1_IRQHandler                  ; DAC1 global interrupt
                DCD     FDCAN1_IT0_IRQHandler            ; FDCAN1 interrupt 0
                DCD     FDCAN1_IT1_IRQHandler            ; FDCAN1 interrupt 1
                DCD     TIM1_BRK_IRQHandler              ; TIM1 Break interrupt
                DCD     TIM1_UP_IRQHandler               ; TIM1 Update interrupt
                DCD     TIM1_TRG_COM_IRQHandler          ; TIM1 Trigger and Commutation interrupt
                DCD     TIM1_CC_IRQHandler               ; TIM1 Capture Compare interrupt
                DCD     TIM2_IRQHandler                  ; TIM2 global interrupt
                DCD     TIM3_IRQHandler                  ; TIM3 global interrupt
                DCD     TIM4_IRQHandler                  ; TIM4 global interrupt
                DCD     TIM5_IRQHandler                  ; TIM5 global interrupt
                DCD     TIM6_IRQHandler                  ; TIM6 global interrupt
                DCD     TIM7_IRQHandler                  ; TIM7 global interrupt
                DCD     I2C1_EV_IRQHandler               ; I2C1 Event interrupt
                DCD     I2C1_ER_IRQHandler               ; I2C1 Error interrupt
                DCD     I2C2_EV_IRQHandler               ; I2C2 Event interrupt
                DCD     I2C2_ER_IRQHandler               ; I2C2 Error interrupt
                DCD     SPI1_IRQHandler                  ; SPI1 global interrupt
                DCD     SPI2_IRQHandler                  ; SPI2 global interrupt
                DCD     SPI3_IRQHandler                  ; SPI3 global interrupt
                DCD     USART1_IRQHandler                ; USART1 global interrupt
                DCD     USART2_IRQHandler                ; USART2 global interrupt
                DCD     USART3_IRQHandler                ; USART3 global interrupt
                DCD     UART4_IRQHandler                 ; UART4 global interrupt
                DCD     UART5_IRQHandler                 ; UART5 global interrupt
                DCD     LPUART1_IRQHandler               ; LPUART1 global interrupt
                DCD     LPTIM1_IRQHandler                ; LPTIM1 global interrupt
                DCD     TIM8_BRK_IRQHandler              ; TIM8 Break interrupt
                DCD     TIM8_UP_IRQHandler               ; TIM8 Update interrupt
                DCD     TIM8_TRG_COM_IRQHandler          ; TIM8 Trigger and Commutation interrupt
                DCD     TIM8_CC_IRQHandler               ; TIM8 Capture Compare interrupt
                DCD     ADC2_IRQHandler                  ; ADC2 global interrupt
                DCD     LPTIM2_IRQHandler                ; LPTIM2 global interrupt
                DCD     TIM15_IRQHandler                 ; TIM15 global interrupt
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     USB_DRD_FS_IRQHandler            ; USB DRD FS global interrupt
                DCD     CRS_IRQHandler                   ; CRS global interrupt
                DCD     UCPD1_IRQHandler                 ; UCPD1 global interrupt
                DCD     FMC_IRQHandler                   ; FMC global interrupt
                DCD     OCTOSPI1_IRQHandler              ; OctoSPI1 global interrupt
                DCD     SDMMC1_IRQHandler                ; SDMMC1 global interrupt
                DCD     I2C3_EV_IRQHandler               ; I2C2 Event interrupt
                DCD     I2C3_ER_IRQHandler               ; I2C2 Error interrupt
                DCD     SPI4_IRQHandler                  ; SPI4 global interrupt
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     USART6_IRQHandler                ; USART6 global interrupt
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     GPDMA2_Channel0_IRQHandler       ; GPDMA2 Channel 0 global interrupt
                DCD     GPDMA2_Channel1_IRQHandler       ; GPDMA2 Channel 1 global interrupt
                DCD     GPDMA2_Channel2_IRQHandler       ; GPDMA2 Channel 2 global interrupt
                DCD     GPDMA2_Channel3_IRQHandler       ; GPDMA2 Channel 3 global interrupt
                DCD     GPDMA2_Channel4_IRQHandler       ; GPDMA2 Channel 4 global interrupt
                DCD     GPDMA2_Channel5_IRQHandler       ; GPDMA2 Channel 5 global interrupt
                DCD     GPDMA2_Channel6_IRQHandler       ; GPDMA2 Channel 6 global interrupt
                DCD     GPDMA2_Channel7_IRQHandler       ; GPDMA2 Channel 7 global interrupt
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     FPU_IRQHandler                   ; FPU global interrupt
                DCD     ICACHE_IRQHandler                ; Instruction cache global interrupt
                DCD     DCACHE1_IRQHandler               ; DCACHE1 global interrupt
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     DCMI_PSSI_IRQHandler             ; DCMI PSSI global interrupt
                DCD     FDCAN2_IT0_IRQHandler            ; FDCAN2 interrupt 0
                DCD     FDCAN2_IT1_IRQHandler            ; FDCAN2 interrupt 1
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     DTS_IRQHandler                   ; DTS global interrupt
                DCD     RNG_IRQHandler                   ; RNG global interrupt
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     HASH_IRQHandler                  ; HASH global interrupt
                DCD     0                                ; Reserved
                DCD     CEC_IRQHandler                   ; CEC global interrupt
                DCD     TIM12_IRQHandler                 ; TIM12 global interrupt
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     I3C1_EV_IRQHandler               ; I3C1 Event interrupt
                DCD     I3C1_ER_IRQHandler               ; I3C1 Error interrupt
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     0                                ; Reserved
                DCD     I3C2_EV_IRQHandler               ; I3C2 Event interrupt
                DCD     I3C2_ER_IRQHandler               ; I3C2 Error interrupt

__Vectors_End

__Vectors_Size  EQU    __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY


; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler             [WEAK]
                IMPORT  SystemInit
                IMPORT  __main
                LDR     R0, =SystemInit
                BLX     R0
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler\
                PROC
                EXPORT  NMI_Handler               [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler         [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler         [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler          [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler        [WEAK]
                B       .
                ENDP
SecureFault_Handler\
                PROC
                EXPORT  SecureFault_Handler       [WEAK]
                B       .
                ENDP
SVC_Handler\
                PROC
                EXPORT  SVC_Handler               [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler          [WEAK]
                B       .
                ENDP
PendSV_Handler\
                PROC
                EXPORT  PendSV_Handler            [WEAK]
                B       .
                ENDP
SysTick_Handler\
                PROC
                EXPORT  SysTick_Handler           [WEAK]
                B       .
                ENDP

Default_Handler PROC

                EXPORT  WWDG_IRQHandler                  [WEAK]
                EXPORT  PVD_AVD_IRQHandler               [WEAK]
                EXPORT  RTC_IRQHandler                   [WEAK]
                EXPORT  RTC_S_IRQHandler                 [WEAK]
                EXPORT  TAMP_IRQHandler                  [WEAK]
                EXPORT  RAMCFG_IRQHandler                [WEAK]
                EXPORT  FLASH_IRQHandler                 [WEAK]
                EXPORT  FLASH_S_IRQHandler               [WEAK]
                EXPORT  GTZC_IRQHandler                  [WEAK]
                EXPORT  RCC_IRQHandler                   [WEAK]
                EXPORT  RCC_S_IRQHandler                 [WEAK]
                EXPORT  EXTI0_IRQHandler                 [WEAK]
                EXPORT  EXTI1_IRQHandler                 [WEAK]
                EXPORT  EXTI2_IRQHandler                 [WEAK]
                EXPORT  EXTI3_IRQHandler                 [WEAK]
                EXPORT  EXTI4_IRQHandler                 [WEAK]
                EXPORT  EXTI5_IRQHandler                 [WEAK]
                EXPORT  EXTI6_IRQHandler                 [WEAK]
                EXPORT  EXTI7_IRQHandler                 [WEAK]
                EXPORT  EXTI8_IRQHandler                 [WEAK]
                EXPORT  EXTI9_IRQHandler                 [WEAK]
                EXPORT  EXTI10_IRQHandler                [WEAK]
                EXPORT  EXTI11_IRQHandler                [WEAK]
                EXPORT  EXTI12_IRQHandler                [WEAK]
                EXPORT  EXTI13_IRQHandler                [WEAK]
                EXPORT  EXTI14_IRQHandler                [WEAK]
                EXPORT  EXTI15_IRQHandler                [WEAK]
                EXPORT  GPDMA1_Channel0_IRQHandler       [WEAK]
                EXPORT  GPDMA1_Channel1_IRQHandler       [WEAK]
                EXPORT  GPDMA1_Channel2_IRQHandler       [WEAK]
                EXPORT  GPDMA1_Channel3_IRQHandler       [WEAK]
                EXPORT  GPDMA1_Channel4_IRQHandler       [WEAK]
                EXPORT  GPDMA1_Channel5_IRQHandler       [WEAK]
                EXPORT  GPDMA1_Channel6_IRQHandler       [WEAK]
                EXPORT  GPDMA1_Channel7_IRQHandler       [WEAK]
                EXPORT  IWDG_IRQHandler                  [WEAK]
                EXPORT  ADC1_IRQHandler                  [WEAK]
                EXPORT  DAC1_IRQHandler                  [WEAK]
                EXPORT  FDCAN1_IT0_IRQHandler            [WEAK]
                EXPORT  FDCAN1_IT1_IRQHandler            [WEAK]
                EXPORT  TIM1_BRK_IRQHandler              [WEAK]
                EXPORT  TIM1_UP_IRQHandler               [WEAK]
                EXPORT  TIM1_TRG_COM_IRQHandler          [WEAK]
                EXPORT  TIM1_CC_IRQHandler               [WEAK]
                EXPORT  TIM2_IRQHandler                  [WEAK]
                EXPORT  TIM3_IRQHandler                  [WEAK]
                EXPORT  TIM4_IRQHandler                  [WEAK]
                EXPORT  TIM5_IRQHandler                  [WEAK]
                EXPORT  TIM6_IRQHandler                  [WEAK]
                EXPORT  TIM7_IRQHandler                  [WEAK]
                EXPORT  I2C1_EV_IRQHandler               [WEAK]
                EXPORT  I2C1_ER_IRQHandler               [WEAK]
                EXPORT  I2C2_EV_IRQHandler               [WEAK]
                EXPORT  I2C2_ER_IRQHandler               [WEAK]
                EXPORT  SPI1_IRQHandler                  [WEAK]
                EXPORT  SPI2_IRQHandler                  [WEAK]
                EXPORT  SPI3_IRQHandler                  [WEAK]
                EXPORT  USART1_IRQHandler                [WEAK]
                EXPORT  USART2_IRQHandler                [WEAK]
                EXPORT  USART3_IRQHandler                [WEAK]
                EXPORT  UART4_IRQHandler                 [WEAK]
                EXPORT  UART5_IRQHandler                 [WEAK]
                EXPORT  LPUART1_IRQHandler               [WEAK]
                EXPORT  LPTIM1_IRQHandler                [WEAK]
                EXPORT  TIM8_BRK_IRQHandler              [WEAK]
                EXPORT  TIM8_UP_IRQHandler               [WEAK]
                EXPORT  TIM8_TRG_COM_IRQHandler          [WEAK]
                EXPORT  TIM8_CC_IRQHandler               [WEAK]
                EXPORT  ADC2_IRQHandler                  [WEAK]
                EXPORT  LPTIM2_IRQHandler                [WEAK]
                EXPORT  TIM15_IRQHandler                 [WEAK]
                EXPORT  USB_DRD_FS_IRQHandler            [WEAK]
                EXPORT  CRS_IRQHandler                   [WEAK]
                EXPORT  UCPD1_IRQHandler                 [WEAK]
                EXPORT  FMC_IRQHandler                   [WEAK]
                EXPORT  OCTOSPI1_IRQHandler              [WEAK]
                EXPORT  SDMMC1_IRQHandler                [WEAK]
                EXPORT  I2C3_EV_IRQHandler               [WEAK]
                EXPORT  I2C3_ER_IRQHandler               [WEAK]
                EXPORT  SPI4_IRQHandler                  [WEAK]
                EXPORT  USART6_IRQHandler                [WEAK]
                EXPORT  GPDMA2_Channel0_IRQHandler       [WEAK]
                EXPORT  GPDMA2_Channel1_IRQHandler       [WEAK]
                EXPORT  GPDMA2_Channel2_IRQHandler       [WEAK]
                EXPORT  GPDMA2_Channel3_IRQHandler       [WEAK]
                EXPORT  GPDMA2_Channel4_IRQHandler       [WEAK]
                EXPORT  GPDMA2_Channel5_IRQHandler       [WEAK]
                EXPORT  GPDMA2_Channel6_IRQHandler       [WEAK]
                EXPORT  GPDMA2_Channel7_IRQHandler       [WEAK]
                EXPORT  FPU_IRQHandler                   [WEAK]
                EXPORT  ICACHE_IRQHandler                [WEAK]
                EXPORT  DCACHE1_IRQHandler               [WEAK]
                EXPORT  DCMI_PSSI_IRQHandler             [WEAK]
                EXPORT  FDCAN2_IT0_IRQHandler            [WEAK]
                EXPORT  FDCAN2_IT1_IRQHandler            [WEAK]
                EXPORT  DTS_IRQHandler                   [WEAK]
                EXPORT  RNG_IRQHandler                   [WEAK]
                EXPORT  HASH_IRQHandler                  [WEAK]
                EXPORT  CEC_IRQHandler                   [WEAK]
                EXPORT  TIM12_IRQHandler                 [WEAK]
                EXPORT  I3C1_EV_IRQHandler               [WEAK]
                EXPORT  I3C1_ER_IRQHandler               [WEAK]
                EXPORT  I3C2_EV_IRQHandler               [WEAK]
                EXPORT  I3C2_ER_IRQHandler               [WEAK]

WWDG_IRQHandler
PVD_AVD_IRQHandler
RTC_IRQHandler
RTC_S_IRQHandler
TAMP_IRQHandler
RAMCFG_IRQHandler
FLASH_IRQHandler
FLASH_S_IRQHandler
GTZC_IRQHandler
RCC_IRQHandler
RCC_S_IRQHandler
EXTI0_IRQHandler
EXTI1_IRQHandler
EXTI2_IRQHandler
EXTI3_IRQHandler
EXTI4_IRQHandler
EXTI5_IRQHandler
EXTI6_IRQHandler
EXTI7_IRQHandler
EXTI8_IRQHandler
EXTI9_IRQHandler
EXTI10_IRQHandler
EXTI11_IRQHandler
EXTI12_IRQHandler
EXTI13_IRQHandler
EXTI14_IRQHandler
EXTI15_IRQHandler
GPDMA1_Channel0_IRQHandler
GPDMA1_Channel1_IRQHandler
GPDMA1_Channel2_IRQHandler
GPDMA1_Channel3_IRQHandler
GPDMA1_Channel4_IRQHandler
GPDMA1_Channel5_IRQHandler
GPDMA1_Channel6_IRQHandler
GPDMA1_Channel7_IRQHandler
IWDG_IRQHandler
ADC1_IRQHandler
DAC1_IRQHandler
FDCAN1_IT0_IRQHandler
FDCAN1_IT1_IRQHandler
TIM1_BRK_IRQHandler
TIM1_UP_IRQHandler
TIM1_TRG_COM_IRQHandler
TIM1_CC_IRQHandler
TIM2_IRQHandler
TIM3_IRQHandler
TIM4_IRQHandler
TIM5_IRQHandler
TIM6_IRQHandler
TIM7_IRQHandler
I2C1_EV_IRQHandler
I2C1_ER_IRQHandler
I2C2_EV_IRQHandler
I2C2_ER_IRQHandler
SPI1_IRQHandler
SPI2_IRQHandler
SPI3_IRQHandler
USART1_IRQHandler
USART2_IRQHandler
USART3_IRQHandler
UART4_IRQHandler
UART5_IRQHandler
LPUART1_IRQHandler
LPTIM1_IRQHandler
TIM8_BRK_IRQHandler
TIM8_UP_IRQHandler
TIM8_TRG_COM_IRQHandler
TIM8_CC_IRQHandler
ADC2_IRQHandler
LPTIM2_IRQHandler
TIM15_IRQHandler
USB_DRD_FS_IRQHandler
CRS_IRQHandler
UCPD1_IRQHandler
FMC_IRQHandler
OCTOSPI1_IRQHandler
SDMMC1_IRQHandler
I2C3_EV_IRQHandler
I2C3_ER_IRQHandler
SPI4_IRQHandler
USART6_IRQHandler
GPDMA2_Channel0_IRQHandler
GPDMA2_Channel1_IRQHandler
GPDMA2_Channel2_IRQHandler
GPDMA2_Channel3_IRQHandler
GPDMA2_Channel4_IRQHandler
GPDMA2_Channel5_IRQHandler
GPDMA2_Channel6_IRQHandler
GPDMA2_Channel7_IRQHandler
FPU_IRQHandler
ICACHE_IRQHandler
DCACHE1_IRQHandler
DCMI_PSSI_IRQHandler
FDCAN2_IT0_IRQHandler
FDCAN2_IT1_IRQHandler
DTS_IRQHandler
RNG_IRQHandler
HASH_IRQHandler
CEC_IRQHandler
TIM12_IRQHandler
I3C1_EV_IRQHandler
I3C1_ER_IRQHandler
I3C2_EV_IRQHandler
I3C2_ER_IRQHandler

                B       .

                ENDP

                ALIGN

;*******************************************************************************
; User Stack and Heap initialization
;*******************************************************************************
                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap

__user_initial_stackheap PROC
                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR
                ENDP

                ALIGN

                ENDIF

                END

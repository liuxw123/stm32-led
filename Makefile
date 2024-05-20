##########################################################################################################################
# File automatically-generated by tool: [projectgenerator] version: [4.3.0-B58] date: [Sat May 11 22:32:14 CST 2024]
##########################################################################################################################

# ------------------------------------------------
# Generic Makefile (based on gcc)
#
# ChangeLog :
#	2017-02-10 - Several enhancements + project update mode
#   2015-07-22 - first version
# ------------------------------------------------

######################################
# target
######################################
# TARGET = stm32f103zet6


######################################
# building variables
######################################
# debug build?
DEBUG = 1
# optimization
OPT = -Og

WRITE_SYS_FONTS = false

#######################################
# paths
#######################################
# Build path
BUILD_DIR = build
# Driver path
# DIRIVER_DIR := Drivers
# bsp library path
TARGET_LIB_DIR = stm32-lib/$(TARGET)
BSP_DIR = $(TARGET_LIB_DIR)/bsp
BASE_DIR = $(TARGET_LIB_DIR)/base
UTILS_DIR = $(TARGET_LIB_DIR)/utils
USER_DIR = $(TARGET_LIB_DIR)/user

ifeq ($(WRITE_SYS_FONTS), true)
FONTS_DIR = $(TARGET_LIB_DIR)/fonts
endif

# Third Party Path
THIRD_PARTY_DIR = stm32-lib/third_party

######################################
# source
######################################
# C sources
C_SOURCES =  \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio_ex.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_tim_ex.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_rcc_ex.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_gpio.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_uart.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_dma.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_cortex.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_pwr.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_flash_ex.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_exti.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_sd.c \
$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Src/stm32f1xx_ll_sdmmc.c \
Core/Src/main.c \
Core/Src/stm32f1xx_it.c \
Core/Src/stm32f1xx_hal_msp.c \
Core/Src/system_stm32f1xx.c \
Core/Src/sysmem.c \
Core/Src/syscalls.c \
$(BASE_DIR)/hal.c \
$(UTILS_DIR)/bsp_utils.c \
$(BSP_DIR)/bsp_led.c \
$(BSP_DIR)/bsp_uart.c \
$(BSP_DIR)/bsp_sd.c \
$(USER_DIR)/logcat.c \
$(USER_DIR)/ffile.c \
$(THIRD_PARTY_DIR)/ff15/source/ff.c \
$(THIRD_PARTY_DIR)/ff15/source/diskio.c \
$(THIRD_PARTY_DIR)/ff15/source/ffsystem.c \
$(THIRD_PARTY_DIR)/ff15/source/ffunicode.c

ifeq ($(WRITE_SYS_FONTS), true)
C_SOURCES += \
$(FONTS_DIR)/font8.c \
$(FONTS_DIR)/font12.c \
$(FONTS_DIR)/font16.c \
$(FONTS_DIR)/font20.c \
$(FONTS_DIR)/font24.c
endif

# ASM sources
ASM_SOURCES =  \
startup_stm32f103xe.s

# ASM sources
ASMM_SOURCES = 


#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S
 
#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m3

# fpu
# NONE for Cortex-M0/M0+/M3

# float-abi


# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc
# AS defines
AS_DEFS = 

# C defines
C_DEFS =  \
-DUSE_HAL_DRIVER \
-DSTM32F103xE

ifeq ($(WRITE_SYS_FONTS), true)
C_DEFS += \
-DWRITE_SYS_FONTS
endif

# AS includes
AS_INCLUDES = 

# C includes
C_INCLUDES =  \
-ICore/Inc \
-I$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Inc \
-I$(DIRIVER_DIR)/STM32F1xx_HAL_Driver/Inc/Legacy \
-I$(DIRIVER_DIR)/CMSIS/Device/ST/STM32F1xx/Include \
-I$(DIRIVER_DIR)/CMSIS/Include \
-I$(TARGET_LIB_DIR)/include \
-I$(THIRD_PARTY_DIR)


# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS += $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif


# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################
# link script
LDSCRIPT = STM32F103ZETx_FLASH.ld

# libraries
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASMM_SOURCES:.S=.o)))
vpath %.S $(sort $(dir $(ASMM_SOURCES)))

$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@
$(BUILD_DIR)/%.o: %.S Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

#######################################
# clean up
#######################################
clean:
	-rm -fR $(BUILD_DIR)
  
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***
# ==========================================
#   Unity Project - A Test Framework for C
#   Copyright (c) 2007 Mike Karlesky, Mark VanderVoord, Greg Williams
#   [Released under MIT License. Please refer to license.txt for details]
# ==========================================

UNITY_ROOT=../Unity
C_COMPILER=gcc
TARGET_BASE1=test1
TARGET_EXTENSION=.out
TARGET1 = $(TARGET_BASE1)$(TARGET_EXTENSION)
SRC_FILES1=$(UNITY_ROOT)/src/unity.c src/ProductionCode.c  test/TestProductionCode.c  test/test_runners/TestProductionCode_Runner.c
INC_DIRS=-Isrc -I$(UNITY_ROOT)/src
SYMBOLS=-DTEST

CLEANUP = rm -f build/*.o ; rm -f $(TARGET1)

all: clean default

default:
#	ruby auto/generate_test_runner.rb test/TestProductionCode.c  test/test_runners/TestProductionCode_Runner.c
	$(C_COMPILER) $(INC_DIRS) $(SYMBOLS) $(SRC_FILES1) -o $(TARGET1)
	./$(TARGET1)

clean:
	$(CLEANUP)


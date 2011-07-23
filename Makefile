
include $(ROOT_PATH)/function.mk

all: help

help:
	@echo OK
	$(call shell_exec,a,b)

include $(ROOT_PATH)/php/Makefile


include $(ROOT_PATH)/function.mk
include $(ROOT_PATH)/url.mk

PHP_ROOT_PATH:=$(ROOT_PATH)/php

a:
	$(call unzip,$(TMP_PATH)/php_sources,$(TMP_PATH)/php-fpm)
b:
	$(call unzip,$(TMP_PATH)/a,$(TMP_PATH)/bb)
c:
	$(call unzip,$(TMP_PATH)/b,$(TMP_PATH)/cc)

build-php-fpm: unzip-php-fpm
unzip-php-fpm:
	$(call unzip,$(TMP_PATH)/php_sources,$(TMP_PATH)/php-fpm)
unzip-php-fpm: $(TMP_PATH)/php_sources


$(TMP_PATH)/php_sources:
	$(call download,$(url_php),$@)
	

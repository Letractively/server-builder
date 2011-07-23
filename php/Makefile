include $(ROOT_PATH)/function.mk
include $(ROOT_PATH)/url.mk

PHP_ROOT_PATH:=$(ROOT_PATH)/php

PHP_FPM_DIR:=$(GLOBAL_PREFIX)/php-fpm

CFLAGS_PHP_FPM:="$(GLOBAL_CFLAGS)"

OPTION_PHP_FPM:=
OPTION_PHP_FPM:=$(OPTION_PHP_FPM) --prefix=$(PHP_FPM_DIR)
OPTION_PHP_FPM:=$(OPTION_PHP_FPM) --sysconfdir=$(PHP_FPM_DIR)/etc
OPTION_PHP_FPM:=$(OPTION_PHP_FPM) --with-config-file-path=$(PHP_FPM_DIR)/etc
OPTION_PHP_FPM:=$(OPTION_PHP_FPM) --with-config-file-scan-dir=$(PHP_FPM_DIR)/etc/php.d
OPTION_PHP_FPM:=$(OPTION_PHP_FPM) --enable-fpm
OPTION_PHP_FPM:=$(OPTION_PHP_FPM) --enable-shared
OPTION_PHP_FPM:=$(OPTION_PHP_FPM) --without-pear

build-php-fpm: config-php-fpm
	make -C $(TMP_PATH)/php-fpm
	touch $@
config-php-fpm: unzip-php-fpm
	cd $(TMP_PATH)/php-fpm && CFLAGS=$(CFLAGS_PHP_FPM) ./configure $(OPTION_PHP_FPM)
	touch $@
unzip-php-fpm: $(TMP_PATH)/php_sources
	$(call unzip,$(TMP_PATH)/php_sources,$(TMP_PATH)/php-fpm)
	touch $@


$(TMP_PATH)/php_sources:
	$(call download,$(url_php),$@)
	
clean-download:
	rm -fr $(TMP_PATH)/php_sources
clean:
	rm -fr $(PHP_FPM_DIR)

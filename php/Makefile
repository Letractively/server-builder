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
OPTION_PHP_FPM:=$(OPTION_PHP_FPM) --disable-all


install-php-fpm: $(PHP_ROOT_PATH)/install-php-fpm
$(PHP_ROOT_PATH)/install-php-fpm: $(PHP_ROOT_PATH)/build-php-fpm
	make -C $(TMP_PATH)/php-fpm install
	cp -f $(TMP_PATH)/php-fpm/sapi/fpm/init.d.php-fpm $(PHP_FPM_DIR)/bin/php-fpm
	chmod +x $(PHP_FPM_DIR)/bin/php-fpm
	cp -f $(TMP_PATH)/php-fpm/php.ini-production $(PHP_FPM_DIR)/etc/php.ini
	mkdir -p $(PHP_FPM_DIR)/etc/php.d
	cp -f $(PHP_FPM_DIR)/etc/php-fpm.conf.default $(PHP_FPM_DIR)/etc/php-fpm.conf
	sed -i -e 's/;pid/pid/g' -e 's/;pm.start_servers/pm.start_servers/g' -e 's/;pm.min_spare_servers/pm.min_spare_servers/g' -e 's/;pm.max_spare_servers/pm.max_spare_servers/g' -e 's/;pm.max_requests/pm.max_requests/g' $(PHP_FPM_DIR)/etc/php-fpm.conf
	touch $@
build-php-fpm: $(PHP_ROOT_PATH)/build-php-fpm
$(PHP_ROOT_PATH)/build-php-fpm: $(PHP_ROOT_PATH)/config-php-fpm
	make -C $(TMP_PATH)/php-fpm
	touch $@
$(PHP_ROOT_PATH)/config-php-fpm: $(PHP_ROOT_PATH)/unzip-php-fpm
	cd $(TMP_PATH)/php-fpm && CFLAGS=$(CFLAGS_PHP_FPM) ./configure $(OPTION_PHP_FPM)
	touch $@
$(PHP_ROOT_PATH)/unzip-php-fpm: $(TMP_PATH)/php_sources
	$(call unzip,$(TMP_PATH)/php_sources,$(TMP_PATH)/php-fpm)
	touch $@


$(TMP_PATH)/php_sources:
	$(call download,$(url_php),$@)
	
clean-download: clean-download-php-fpm
clean-download-php-fpm:
	rm -fr $(TMP_PATH)/php_sources
clean:clean-php-fpm
clean-php-fpm:
	rm -fr $(TMP_PATH)/php-fpm $(PHP_ROOT_PATH)/build-php-fpm $(PHP_ROOT_PATH)/config-php-fpm $(PHP_ROOT_PATH)/unzip-php-fpm $(PHP_ROOT_PATH)/install-php-fpm
uninstall: uninstall-php-fpm
uninstall-php-fpm:
	rm -fr $(PHP_FPM_DIR)

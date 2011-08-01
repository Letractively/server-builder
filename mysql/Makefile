include $(ROOT_PATH)/function.mk
include $(ROOT_PATH)/url.mk

MYSQL_ROOT_PATH:=$(ROOT_PATH)/mysql

MYSQL_DIR:=$(GLOBAL_PREFIX)/mysql

CFLAGS_MYSQL:="$(GLOBAL_CFLAGS)"

OPTION_MYSQL:=
OPTION_MYSQL:=$(OPTION_MYSQL) -DCPACK_MONOLITHIC_INSTALL=ON
OPTION_MYSQL:=$(OPTION_MYSQL) -DCMAKE_INSTALL_PREFIX=$(MYSQL_DIR)
OPTION_MYSQL:=$(OPTION_MYSQL) -DSYSCONFDIR=$(MYSQL_DIR)/etc
OPTION_MYSQL:=$(OPTION_MYSQL) -DMYSQL_DATADIR=$(MYSQL_DIR)/data
OPTION_MYSQL:=$(OPTION_MYSQL) -DINSTALL_DOCDIR=$(MYSQL_DIR)/docs
OPTION_MYSQL:=$(OPTION_MYSQL) -DMYSQL_UNIX_ADDR=$(MYSQL_DIR)/data/mysql.sock
OPTION_MYSQL:=$(OPTION_MYSQL) -DDEFAULT_CHARSET=utf8
OPTION_MYSQL:=$(OPTION_MYSQL) -DDEFAULT_COLLATION=utf8_general_ci
OPTION_MYSQL:=$(OPTION_MYSQL) -DWITH_SSL=system
OPTION_MYSQL:=$(OPTION_MYSQL) -DWITH_ZLIB=system
OPTION_MYSQL:=$(OPTION_MYSQL) -DENABLE_DEBUG_SYNC=OFF
OPTION_MYSQL:=$(OPTION_MYSQL) -DWITH_EXTRA_CHARSETS=all

install-mysql: $(MYSQL_ROOT_PATH)/install-mysql
$(MYSQL_ROOT_PATH)/install-mysql: $(MYSQL_ROOT_PATH)/build-mysql
	make -C $(TMP_PATH)/mysql install
	mkdir -p $(MYSQL_DIR)/etc
	cp -f $(MYSQL_DIR)/support-files/my-small.cnf $(MYSQL_DIR)/etc/my.cnf
	touch $@
build-mysql: $(MYSQL_ROOT_PATH)/build-mysql
$(MYSQL_ROOT_PATH)/build-mysql: $(MYSQL_ROOT_PATH)/config-mysql
	make -C $(TMP_PATH)/mysql
	touch $@
config-mysql: $(MYSQL_ROOT_PATH)/config-mysql
$(MYSQL_ROOT_PATH)/config-mysql: $(MYSQL_ROOT_PATH)/unzip-mysql
	cd $(TMP_PATH)/mysql && CFLAGS=$(CFLAGS_MYSQL) CPPFLAGS=$(CFLAGS_MYSQL) cmake . $(OPTION_MYSQL)
	touch $@
unzip-mysql: $(MYSQL_ROOT_PATH)/unzip-mysql
$(MYSQL_ROOT_PATH)/unzip-mysql: $(TMP_PATH)/mysql_sources
	$(call unzip,$(TMP_PATH)/mysql_sources,$(TMP_PATH)/mysql)
	touch $@

download-mysql: $(TMP_PATH)/mysql_sources
$(TMP_PATH)/mysql_sources:
	$(call download,$(url_mysql),$@)
	
clean-download: clean-download-mysql
clean-download-mysql:
	rm -fr $(TMP_PATH)/mysql_sources
clean:clean-mysql
clean-mysql:
	rm -fr $(TMP_PATH)/mysql $(MYSQL_ROOT_PATH)/build-mysql $(MYSQL_ROOT_PATH)/config-mysql $(MYSQL_ROOT_PATH)/unzip-mysql $(MYSQL_ROOT_PATH)/install-mysql
uninstall: uninstall-mysql
uninstall-mysql:
	rm -fr $(MYSQL_DIR) $(MYSQL_ROOT_PATH)/install-mysql

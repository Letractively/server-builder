include $(ROOT_PATH)/function.mk
include $(ROOT_PATH)/url.mk

NGINX_ROOT_PATH:=$(ROOT_PATH)/nginx

NGINX_DIR:=$(GLOBAL_PREFIX)/nginx

CFLAGS_NGINX:="$(GLOBAL_CFLAGS)"

OPTION_NGINX:=
OPTION_NGINX:=$(OPTION_NGINX) --prefix=$(NGINX_DIR)
OPTION_NGINX:=$(OPTION_NGINX) --conf-path=$(NGINX_DIR)/etc/nginx.conf
OPTION_NGINX:=$(OPTION_NGINX) --sbin-path=$(NGINX_DIR)/bin/nginx

install-nginx: $(NGINX_ROOT_PATH)/install-nginx
$(NGINX_ROOT_PATH)/install-nginx: $(NGINX_ROOT_PATH)/build-nginx
	make -C $(TMP_PATH)/nginx install
	cp $(NGINX_ROOT_PATH)/script/nginxd $(NGINX_DIR)/bin/
	touch $@
build-nginx: $(NGINX_ROOT_PATH)/build-nginx
$(NGINX_ROOT_PATH)/build-nginx: $(NGINX_ROOT_PATH)/config-nginx
	make -C $(TMP_PATH)/nginx
	touch $@
config-nginx: $(NGINX_ROOT_PATH)/config-nginx
$(NGINX_ROOT_PATH)/config-nginx: $(NGINX_ROOT_PATH)/unzip-nginx
	cd $(TMP_PATH)/nginx && CFLAGS=$(CFLAGS_NGINX) ./configure $(OPTION_NGINX)
	touch $@
unzip-nginx: $(NGINX_ROOT_PATH)/unzip-nginx
$(NGINX_ROOT_PATH)/unzip-nginx: $(TMP_PATH)/nginx_sources
	$(call unzip,$(TMP_PATH)/nginx_sources,$(TMP_PATH)/nginx)
	touch $@


download-nginx: $(TMP_PATH)/nginx_sources
$(TMP_PATH)/nginx_sources:
	$(call download,$(url_nginx),$@)
	
clean-download: clean-download-nginx
clean-download-nginx:
	rm -fr $(TMP_PATH)/nginx_sources
clean:clean-nginx
clean-nginx:
	rm -fr $(TMP_PATH)/nginx $(NGINX_ROOT_PATH)/build-nginx $(NGINX_ROOT_PATH)/config-nginx $(NGINX_ROOT_PATH)/unzip-nginx $(NGINX_ROOT_PATH)/install-nginx
uninstall: uninstall-nginx
uninstall-nginx:
	rm -fr $(NGINX_DIR) $(NGINX_ROOT_PATH)/install-nginx

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
#	cp -f $(TMP_PATH)/nginx/sapi/fpm/init.d.nginx $(NGINX_DIR)/bin/nginx
#	chmod +x $(NGINX_DIR)/bin/nginx
#	cp -f $(TMP_PATH)/nginx/nginx.ini-production $(NGINX_DIR)/etc/nginx.ini
#	mkdir -p $(NGINX_DIR)/etc/nginx.d
#	cp -f $(NGINX_DIR)/etc/nginx.conf.default $(NGINX_DIR)/etc/nginx.conf
#	sed -i -e 's/;pid/pid/g' -e 's/;pm.start_servers/pm.start_servers/g' -e 's/;pm.min_spare_servers/pm.min_spare_servers/g' -e 's/;pm.max_spare_servers/pm.max_spare_servers/g' -e 's/;pm.max_requests/pm.max_requests/g' $(NGINX_DIR)/etc/nginx.conf
	touch $@
build-nginx: $(NGINX_ROOT_PATH)/build-nginx
$(NGINX_ROOT_PATH)/build-nginx: $(NGINX_ROOT_PATH)/config-nginx
	make -C $(TMP_PATH)/nginx
	touch $@
$(NGINX_ROOT_PATH)/config-nginx: $(NGINX_ROOT_PATH)/unzip-nginx
	cd $(TMP_PATH)/nginx && CFLAGS=$(CFLAGS_NGINX) ./configure $(OPTION_NGINX)
	touch $@
$(NGINX_ROOT_PATH)/unzip-nginx: $(TMP_PATH)/nginx_sources
	$(call unzip,$(TMP_PATH)/nginx_sources,$(TMP_PATH)/nginx)
	touch $@


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
	rm -fr $(NGINX_DIR)

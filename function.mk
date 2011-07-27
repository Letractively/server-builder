define shell_exec
$1 $2 $3 $4
endef

define download
mkdir -p $(dir $2)
wget -c -N -O $2 $1
endef


define unzip
mkdir -p $(dir $(dir $2))
@if [ `file $1|grep -oe '\<bzip2\>' || echo error` = 'bzip2' ]; \
then \
   echo file type: bzip2; \
   rm -fr $(dir $2)/`tar jtf $1 2>/dev/null |head -n 1` $2; \
   tar -j -x -C $(dir $2) -f $1 && mv $(dir $2)/`tar jtf $1 2>/dev/null|head -n 1` $2; \
elif [ `file $1|grep -oe '\<gzip\>' || echo error` = 'gzip' ]; \
then \
   echo file type: gzip; \
   rm -fr $(dir $2)/`tar ztf $1 2>/dev/null|head -n 1` $2 ;\
   tar -z -x -C $(dir $2) -f $1 && mv $(dir $2)/`tar ztf $1 2>/dev/null|head -n 1` $2 ;\
elif [ `file $1|tr [:upper:] [:lower:]|grep -oe '\<zip\>' || echo error` = 'zip' ]; \
then \
   echo file type: zip; \
   rm -fr $(dir $2)/`unzip -l $1 2>/dev/null|head -n 4|tail -n 1|awk '{print $$4}'` $2 ; \
   unzip -q -d $(dir $2) $1 && mv $(dir $2)/`unzip -l $1 |head -n 4|tail -n 1|awk '{print $$4}'` $2 ; \
fi
endef


define unzip2
echo 1
endef

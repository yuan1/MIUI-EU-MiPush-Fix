#模块内容全部进magisk系统=0
#更多自定义=1
SKIPUNZIP=0

ui_print "- Start Fix... "

echo "cn" > /data/miui/cust_variant

for u in `ls /data/user/` ;do
    echo -n "CN" > /data/user/$u/com.xiaomi.xmsf/files/mipush_country_code  
    echo -n "China" > /data/user/$u/com.xiaomi.xmsf/files/mipush_region
done

sed -i "s/Europe/China/g" /data/user/*/*/shared_prefs/mipush.xml
rm -rf /data/user/*/com.xiaomi.xmsf/files/com.xiaomi.xmsf
ps -ef  | grep "com.xiaomi.xmsf" | grep -v grep |awk '{print $2}' | xargs kill -9


ui_print "- Fix Success... "
# 这个脚本会在删除模块的时候执行
echo "gb" > /data/miui/cust_variant

for u in `ls /data/user/` ;do
    echo -n "GB" > /data/user/$u/com.xiaomi.xmsf/files/mipush_country_code  
    echo -n "Europe" > /data/user/$u/com.xiaomi.xmsf/files/mipush_region
done
sed -i "s/China/Europe/g" /data/user/*/*/shared_prefs/mipush.xml
rm -rf /data/user/*/com.xiaomi.xmsf/files/com.xiaomi.xmsf
ps -ef  | grep "com.xiaomi.xmsf" | grep -v grep |awk '{print $2}' | xargs kill -9

#!/system/bin/sh

rmmod bt8xxx
rmmod sd8xxx
rmmod mlan

echo 0 > /sys/class/rfkill/rfkill0/state
echo 1 > /sys/class/rfkill/rfkill0/state

insmod /lib/modules/mlan.ko
insmod /lib/modules/sd8787.ko "mfg_mode=1 drv_mode=1 fw_name=mrvl/sd8787_Ax.bin" 

insmod /lib/modules/bt8787.ko "multi_fn=4"
hciconfig hci0 up

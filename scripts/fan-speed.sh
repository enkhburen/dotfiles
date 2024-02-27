#!/bin/sh

echo -n Current fan mode:  


##cat /sys/devices/platform/asus-nb-wmi/hwmon/hwmon[[:print:]]*/pwm1_enable
cat /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy

##echo '/sys/devices/platform/asus-nb-wmi/hwmon/hwmon[[:print:]]*/pwm1_enable'

sensors | grep 'fan'

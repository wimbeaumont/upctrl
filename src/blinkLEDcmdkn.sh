#!/bin/bash

IO=gpio18


echo "18" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio18/direction

echo "1" > /sys/class/gpio/$IO/value
echo -n " the LED is now "
cat   /sys/class/gpio/$IO//value
sleep 1
echo "0" > /sys/class/gpio/$IO/value
echo -n " the LED is now "
cat   /sys/class/gpio/$IO/value
sleep 1
echo "1" > /sys/class/gpio/$IO/value
echo -n " the LED is now "
cat   /sys/class/gpio//$IO/value
sleep 1
echo "0" > /sys/class/gpio/$IO/value
echo -n " the LED is now "
cat   /sys/class/gpio//$IO/value
sleep 1
echo "1" > /sys/class/gpio/$IO/value
echo -n " the LED is now "
cat   /sys/class/gpio//$IO/value
sleep 1
echo "0" > /sys/class/gpio/$IO/value
echo -n " the LED is now "
cat   /sys/class/gpio/$IO/value

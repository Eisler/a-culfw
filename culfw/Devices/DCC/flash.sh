#!/bin/bash
# 
# This Script flash the DCC device
#
# To init call ./flash.sh
#

# The file for flashing the device
FLASH_FILE=DCC.hex

# The MCU
MCU=atmega1284p

# working dir
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Default Port
PORT=/dev/ttyAMA0
# Programming baudrate
BAUD=38400
# The programmer
PROGRAMMER=avrdude

if [ ! -e "$FLASH_FILE" ] ; then
  echo "Program file missing building first source code"
  make
fi 


echo "-------------------------------------------------------------"
echo "This program flash the cul device with new firmware."
echo "Please change the device into the bootloader"
echo "-------------------------------------------------------------"
read -p "Please insert the port for your device [default $PORT]: " port
if [ "X$port" == "X" ] ; then
   port="$PORT"
fi
if [ ! -e "$port" ] ; then
  echo "ERROR: Port $port does not exists!"
  exit 1
fi

echo ""
echo "The device will now be flashed"
if test ! -d /sys/class/gpio/gpio2; then echo 2 > /sys/class/gpio/export; fi
echo out > /sys/class/gpio/gpio2/direction
echo 0 > /sys/class/gpio/gpio2/value

#if test ! -d /sys/class/gpio/gpio3; then echo 3 > /sys/class/gpio/export; fi
#echo out > /sys/class/gpio/gpio3/direction
#echo 0 > /sys/class/gpio/gpio3/value



read -p "Continue (y/n)?" flashdevice

if [ "$flashdevice" == "y" -o "$flashdevice" == "Y" -o "$flashdevice" == "j" -o "$flashdevice" == "J" ] ; then
  echo
        echo calling radio frontends bootloader ...
        echo
        if test ! -d /sys/class/gpio/gpio17; then echo 17 > /sys/class/gpio/export; fi
        echo out > /sys/class/gpio/gpio17/direction
        echo 0 > /sys/class/gpio/gpio17/value

        if test ! -d /sys/class/gpio/gpio3; then echo 3 > /sys/class/gpio/export; fi
        echo out > /sys/class/gpio/gpio3/direction
        echo 0 > /sys/class/gpio/gpio3/value

        echo 1 > /sys/class/gpio/gpio17/value
        sleep 1
        echo 1 > /sys/class/gpio/gpio3/value
        echo in > /sys/class/gpio/gpio3/direction
        echo 3 > /sys/class/gpio/unexport
   
  echo "Call now ${PROGRAMMER} -p${MCU} -cavr109 -P${port} -b${BAUD} -Uflash:w:./${FLASH_FILE}:i"
  ${PROGRAMMER} -p${MCU} -cavr109 -P${port} -b${BAUD} -Uflash:w:./${FLASH_FILE}:i

        echo 0 > /sys/class/gpio/gpio17/value
        sleep 1
        echo 1 > /sys/class/gpio/gpio17/value

else
  echo "Abort flash"
fi




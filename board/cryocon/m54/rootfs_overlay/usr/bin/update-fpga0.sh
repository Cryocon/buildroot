#!/bin/sh

diff /boot/fpga0.bit /boot/fpga0.bit.installed ||
( /usr/bin/image-fpga.sh && cp /boot/fpga0.bit /boot/fpga0.bit.installed )

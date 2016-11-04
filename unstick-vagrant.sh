#!/bin/sh -x
vboxmanage controlvm $(vboxmanage list runningvms | cut -f1 -d" " | tr -d '"') keyboardputscancode 1c

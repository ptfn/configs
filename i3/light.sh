#!/bin/bash

a=$(brightnessctl i | grep Curren)
a=${a#*(}
a=${a%'%'*}
brightnessctl set $(expr $a $1 10)%
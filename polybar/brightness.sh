#!/bin/bash

a=$(brightnessctl i | grep Curren)
a=${a#*(}
a=${a%'%'*}
echo -e " $a%"
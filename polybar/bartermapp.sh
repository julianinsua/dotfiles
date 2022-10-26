#!/bin/bash


# Usage:
#   bartermapp [arg1] [arg2] [arg3]
#      arg1: terminal program to run
#      arg2: number of times do apply additional 
#            x offset defined by xinterval
#      arg3: side of the screen to show

# Dependencies:
#   tdrop


xoffset=24
xinterval=0
yoffset=32
width=700
height=800
terminal=konsole
right=right
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


if [ $3 == "right" ];then
  rightx=$(expr $xoffset \* $2 + $width)  
  echo $rightx
  tdrop -a -w $width -h $height -x -$rightx -y $yoffset -n $2 konsole -e $1 &2>/dev/null
else
  leftx=$(expr $xoffset + $xinterval \* $2 - $xinterval)
  echo $leftx
  tdrop -a -w $width -h $height -x $leftx -y $yoffset -n $2 konsole -e $1 &2>/dev/null
fi


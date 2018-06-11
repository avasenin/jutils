#!/bin/sh
top -H -b -n 1 | grep java > /tmp/top.log
jstack -l $1 > /tmp/jstack.log
perl jtop.pl /tmp/top.log /tmp/jstack.log
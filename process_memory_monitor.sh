#!/bin/bash

# timestamp
timestamp=`date "+%Y-%m-%d %T"`

# Setting the uniq process name 
# ex) Get the forked squid PID
process="squid-1"

# Get the PID
pid=`ps -ef| grep -v grep | grep $process | awk '{print $2}'`

# Get the various values of memory
vmpeak=`cat /proc/$pid/task/$pid/status | grep VmPeak | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`
vmsize=`cat /proc/$pid/task/$pid/status | grep VmSize | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`
vmlck=`cat /proc/$pid/task/$pid/status  | grep VmLck  | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`
vmhwm=`cat /proc/$pid/task/$pid/status  | grep VmHWM  | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`
vmrss=`cat /proc/$pid/task/$pid/status  | grep VmRSS  | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`
vmdata=`cat /proc/$pid/task/$pid/status | grep VmData | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`
vmstk=`cat /proc/$pid/task/$pid/status  | grep VmStk  | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`
vmexe=`cat /proc/$pid/task/$pid/status  | grep VmExe  | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`
vmlib=`cat /proc/$pid/task/$pid/status  | grep VmLib  | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`
vmpte=`cat /proc/$pid/task/$pid/status  | grep VmPTE  | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`
vmswap=`cat /proc/$pid/task/$pid/status | grep VmSwap | awk -F: '{print $2}' | awk '{print $1}' | sed -e 's/ //g'`

# Note: Debugging information
# echo $timestamp # $1
# echo $pid       # $2
# echo $vmpeak    # $3
# echo $vmsize    # $4
# echo $vmlck     # $5
# echo $vmhwm     # $6
# echo $vmrss     # $7
# echo $vmdata    # $8
# echo $vmstk     # $9
# echo $vmexe     # $10
# echo $vmlib     # $11
# echo $vmpte     # $12
# echo $vmswap    # $13

# Output by one line to the file
echo "$timestamp,$pid,$vmpeak,$vmsize,$vmlck,$vmhwm,$vmrss,$vmdata,$vmstk,$vmexe,$vmlib,$vmpte,$vmswap"

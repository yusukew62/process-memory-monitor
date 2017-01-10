#!/bin/bash

# timestamp
timestamp=`date "+%Y-%m-%d %T"`

# hostname
hostname=`hostname`

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
# echo $hostname  # $2
# echo $pid       # $3
# echo $vmpeak    # $4
# echo $vmsize    # $5
# echo $vmlck     # $6
# echo $vmhwm     # $7
# echo $vmrss     # $8
# echo $vmdata    # $9
# echo $vmstk     # $10
# echo $vmexe     # $11
# echo $vmlib     # $12
# echo $vmpte     # $13
# echo $vmswap    # $14

# Output by one line to the file
echo "$timestamp,$hostname,$pid,$vmpeak,$vmsize,$vmlck,$vmhwm,$vmrss,$vmdata,$vmstk,$vmexe,$vmlib,$vmpte,$vmswap"

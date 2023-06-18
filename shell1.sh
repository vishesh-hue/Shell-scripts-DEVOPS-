#date: 17/6/23
#script: output node-perf Virtual machine & ERR in logfiles & on-going processes
# versin: v1
######################

set -x
#exit script
set -e
#pipe error
set -o
df -h

free -g

nproc

# retrieve ongoing processes @ amazon
echo "provider"
ps -ef | grep amazon | awk -F " " '{print $1}'
echo "process name @amazon"
ps -ef | grep amazon | awk -F " " '{print $2}'
#error module
# curl {use your logfile}
curl http://demo/demo |grep ERROR

#? install the logfile
wget http://demo/demo | grep ERROR
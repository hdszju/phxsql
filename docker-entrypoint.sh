#!/bin/bash

set -x
cd /phxsql/tools
python2.7 install.py -i "$(hostname -I)" -p 54321 -g 6000 -y 11111 -P 17000 -a 8001 -f /data "$@"

sleep 100

./phxbinlogsvr_tools_phxrpc -f InitBinlogSvrMaster -h"$,$IP2,$IP3" -p 17000

exec tail -f /dev/null

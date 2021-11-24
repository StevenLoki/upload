#! /bin/sh

echo "Stop..."

pid=$(ps aux | grep "./Vibranium-backend" | grep -v "grep" | awk '{print $2}')

kill -9 $pid

sleep 2

pid=$(ps aux | grep "./Vibranium-backend" | grep -v "grep" | awk '{print $2}')

if [ "$pid" != "" ]; then
     echo "Err: Stop Failed!"
     exit 1
fi

echo "Stop Success!"


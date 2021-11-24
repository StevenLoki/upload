#! /bin/sh

if [ ! -x "./Vibranium-backend" ]; then
    echo "Err: Can not found executable file(Vibranium-backend)"
    exit 1
fi

pid=$(ps aux | grep "./Vibranium-backend" | grep -v "grep" | awk '{print $2}')

if [ "$pid" != "" ]; then
     echo "Err: Vibranium-backend is running, please stop it before rebooting"
     exit 1
fi


if [ ! -d "./log" ]; then
    mkdir log
fi

nohup ./Vibranium-backend -cfg ./etc/server.toml >> ./log/start.log 2>&1 &

echo "Booting..."

sleep 5


pid=$(ps aux | grep "./Vibranium-backend" | grep -v "grep" | awk '{print $2}')

if [ "$pid" = "" ]; then 
     echo "Err: Boot Failed!"
     exit 1
fi


echo "Boot Success!"


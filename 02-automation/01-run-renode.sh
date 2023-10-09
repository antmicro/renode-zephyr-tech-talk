#!/bin/bash

echo "Running Renode on :5555. Connect using 'telnet localhost 5555'"
if command -v renode &> /dev/null
then
    renode --disable-xwt -P 5555
elif command -v renode-run &> /dev/null
then
    renode-run -- --disable-xwt -P 5555
else
    echo "Renode not found!"
fi


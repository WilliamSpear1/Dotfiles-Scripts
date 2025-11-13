#!/bin/bash
FILE_PATH="$2"
PARENT_DIRECTORY="$3"

sendTest() {
curl -X POST http://127.0.0.1:5000/upload \
    -F "file=@$FILE_PATH" \
    -F "parent_directory=$PARENT_DIRECTORY"
}
sendProd() {
curl -X POST http://dockge.spearmanwm.dev:5000/upload \
    -F "file=@$FILE_PATH" \
    -F "parent_directory=$PARENT_DIRECTORY"
}

case $1 in
    TEST)
        sendTest
        ;;
    PROD)
        sendProd
        ;;
    *)
        echo "First Argument needs to be TEST or PROD"
        echo "Thank you!"
        ;;
esac

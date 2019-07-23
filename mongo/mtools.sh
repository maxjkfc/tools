#!/bin/bash



. ./mongo.env

setconfig(){
    echo "Set Config"

    if [  -z "$DIR_PATH" ]; then 
        DIR_PATH=$(pwd)
    fi

    if [ ! -d "$DIR_PATH/$DIR" ] ; then
        echo "mkdir $DIR_PATH/$DIR"
        mkdir -p "$DIR_PATH/$DIR"
    fi

    if [ "$DIR_PATH" = "." ]; then 
        DIR_PATH=$(pwd)
    fi
}

backup() {

    CMD="mongodump"

    if [ -z "$HOST" ]; then
        HOST="localhost:27017"
    fi
    CMD=$CMD" -h $HOST"

    if [ ! -z "$USER" ]; then
        CMD=$CMD" -u $USER -p $PASSWORD"
    fi

    if [ ! -z "$DATABASE" ] ; then 
        CMD=$CMD" -d $DATABASE"
    fi

    CMD=$CMD" -o /backup"


    echo $CMD

    docker run -it --rm --name mongo-backup  -v $DIR_PATH/$DIR:/backup mongo:$MONGO_VERSION $CMD
}


restore() {

    CMD="mongorestore"

    if [ -z "$HOST" ]; then
        HOST="localhost:27017"
    fi
    CMD=$CMD" -h $HOST"

    if [ ! -z "$USER" ]; then
        CMD=$CMD" -u $USER -p $PASSWORD"
    fi

    if [ ! -z "$DATABASE" ] ; then 
        CMD=$CMD" -d $DATABASE"
    fi

    CMD=$CMD" --drop /backup"

    echo $CMD

    docker run -it --rm --name mongo-backup  -v $DIR_PATH/$DIR:/backup mongo:$MONGO_VERSION $CMD
}



case $1  in
    "backup")
        setconfig 
        backup
        ;;
    "restore")
        setconfig
        restore
        ;;
    *)
        echo "Please Input Action( backup / restore )"
        ;;
esac



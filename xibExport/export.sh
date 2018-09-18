#!/bin/bash

# attribute $1 : resources target direction
# attribute $2 : xib export target direction

if [ -z "$1" ]; then
    XIB_IMORT_TARGET=.
else
    XIB_IMPORT_TARGET=$1
fi

if [ -z "$2" ]; then
    EXPORT_DIRECTORY=.
else
    EXPORT_DIRECTORY=$2
fi

LISTFILE=$EXPORT_DIRECTORY/list.txt


ready_txtfile() {
    if [ ! -f $LISTFILE ]; then
        touch $LISTFILE
    fi
    return 0
}


if [ -d $XIB_IMPORT_TARGET ]; then
    echo "Open target directory."

    if ready_txtfile; then

        num=0
        for file in `\find $XIB_IMPORT_TARGET -d -name '*.xib'`; do
            echo "Deal with $file."

            name=${file##*/}
            echo $name >> $LISTFILE

            dir=$EXPORT_DIRECTORY/xibs
            if [ ! -d $dir ]; then
                echo "Create directory. ${dir}"
                mkdir -p $dir
            fi

            cp $file $dir

            num = $((num++))

        done

        echo -e "\nDone.\n${num}files copied.\n" >> $LISTFILE
    fi

else
    echo "Can't open target directory."
fi


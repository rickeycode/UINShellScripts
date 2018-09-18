#!/bin/bash

######
# create image list html.
# provide h2 title in html, if image directory has name prefixed "NUM_".
######

# attribute $1 : image resources directory
# attribute $2 : html file name

if [ -z "$1" ]; then
    IMAGE_DIRECTORY=./captures
else
    IMAGE_DIRECTORY=$1
fi

if [ -z "$2" ]; then
    FILE_NAME=captures.html
else
    FILE_NAME=$2
fi

ready_htmlFile() {
    if [ -f $FILE_NAME ]; then
        rm $FILE_NAME
    fi
    touch $FILE_NAME
    return 0
}

if [ -d $IMAGE_DIRECTORY ]; then
    echo "Open image directory."

    if ready_htmlFile; then

        echo '<html>' >> $FILE_NAME
        echo '<head>' >>  $FILE_NAME

        echo '<style type="text/css">' >>  $FILE_NAME
        echo '<!--
        div { display: inline-block; }
        h2 { background-color: #d1e7f1; padding: 20; }
        img { height: auto; max-width: 320; float: left; }
        .image_wrapp { padding: 6px; background-color: #f7f7f7; border-radius: 10px; margin: 6px; }
        .image_wrapp h3 { font-size: 1em; font-weight: normal; text-align: center; -webkit-margin-before: 0.2em; -webkit-margin-after: 0.2em; }
        -->' >>  $FILE_NAME
        echo '</style>' >>  $FILE_NAME

        echo '</head>' >> $FILE_NAME
        echo '<body>' >> $FILE_NAME

        for directory in `\find $IMAGE_DIRECTORY -d -type d -name '*_*'`; do
            echo "Directory $directory."

            echo '<div>' >> $FILE_NAME
            echo '<h2>'${directory#*\_}'</h2>' >> $FILE_NAME

            if [ -d $directory ]; then
                for image in `\find $directory -d -name '*.png'`; do
                    echo "Deal with $image."

                    echo '<div class="image_wrapp">' >> $FILE_NAME
                    echo '<h3>'${image##*/}'</h3>' >> $FILE_NAME
                    #echo '<li>' >> $FILE_NAME
                    echo '<img src="'${image}'" alt="'${image}'">' >> $FILE_NAME
                    #echo '</li>' >> $FILE_NAME
                    echo '</div>' >> $FILE_NAME
                done
            fi

            echo '</div>' >> $FILE_NAME

        done

        echo '</body>' >> $FILE_NAME
        echo '</html>' >> $FILE_NAME

        echo "\nDone.\nhtml was created.\n"
    fi

else
    echo "Can't open capture directory."
fi


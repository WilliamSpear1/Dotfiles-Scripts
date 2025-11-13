#!/bin/sh
# A Script for a slideshows using the feh background tool ######################

##########################
#       functions        #
##########################
echo1(){
    echo Here1
}

echo2(){
    echo Here2
}

echo3(){
    echo Here3
}

##########################
#       main             #
##########################

echo Start of script...
case $1 in
    ECHO)
        echo1
        echo ending script....
        ;;
    ECHO2)
        echo2
        echo ending script....
        ;;
    ECHO3)
        echo3
        echo ending script....
        ;;
    *)
        echo default case
        echo ending script....
        ;;
esac

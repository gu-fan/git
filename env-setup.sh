#!/bin/bash
function check_sanity {
    # Do some sanity checking.
    if [ $(/usr/bin/id -u) != "0" ]
    then
        die 'Must be run by root user'
    fi

    if [ ! -f /etc/debian_version ]
    then
        die "Distribution is not supported"
    fi
}

function die {
    echo "ERROR: $1" > /dev/null 1>&2
    exit 1
}

function update_upgrade {
    # Run through the apt-get update/upgrade first. This should be done before
    # we try to install any package
    apt-get -q -y update
    apt-get -q -y upgrade
}

function install_basic_soft {
   
    # openssh git
    apt-get install -q -y openssh-server git git-core.
    # vim byobo
    apt-get install -q -y bash-completion vim ctags vim-doc vim-scripts screen byobu
    # zip
    apt-get install -q -y bzip2 unzip unrar p7zip
     # the basic
    apt-get -q -y install ubuntu-minimal
   
}

function install_dev_soft {
    # program and dev
    apt-get install -q -y perl python python-dev ruby ruby-dev sqlite sqlite3 openssl   
    # compile and dev 
    apt-get install -q -y gcc g++ make autoconf automake patch gdb libtool cpp build-essential libc6-dev libncurses-dev expat
}

function install_desktop_soft {
    apt-get install gvim
    apt-get install grep curl ctags cscope 
    apt-get install conky

    add-apt-repository ppa:do-core/ppa 
    apt-get update
    apt-get install docky gnome-do 
}
########################################################################
# START OF PROGRAM
########################################################################
export PATH=/bin:/usr/bin:/sbin:/usr/sbin

check_sanity
case "$1" in
update)
    update_upgrade
    ;;
basic)
    install_basic_soft
    ;;
dev)
    install_dev_soft
    ;;
desk)
    install_desktop_soft
    ;;
*)
    echo 'Usage:' `basename $0` '[option]'
    echo 'Available option:'
    for option in update basic dev desktop
    do
        echo '  -' $option
    done
    ;;
esac

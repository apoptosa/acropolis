#!/bin/bash

#Now we build relative structures:
export scripts=$env_mnt/env_scripts
export backups_logs=$msm_mnt/_BackupsLogs
export emacs_backups=$backups_logs/_emacs_backups
export motd=$env_mnt/env_motd
export wallpapers=$env_mnt/wallpapers

export installed_1=$msm_mnt/_Applications/_Installed
export Personal=$msm_mnt/_Personal
export Research=$msm_mnt/_Research
export rcode=$Research/_Code
export rpcode=$Research/_Code/_Python
export repos=$msm_mnt/_Repositories
export conflink=$env_mnt/dot_files
export Notes=$Research/_Notes
export Writing=$msm_mnt/_Writing
export server=$Research/_Server
export doku=$server/dokuwiki/data/pages

#Include Miniconda3 to get the 'right' python
export PATH="$installed_1/miniconda3/bin:$PATH"

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

#The following will be printed
export _print_paths=("scripts" "Research" "Notes" "Writing"
                     "rcode" "rpcode" "repos" "Personal" "doku")

#Make symlinks if target does not exist / fix if broken
function ens_sym_link {
    local src=$1
    local tar=$2

    if [ -L ${tar} ] ; then
        if [ -e ${tar} ] ; then
            #Good link
            :
        else
            #Broken link - recreate
            ln -sf ${src} ${tar}
        fi
    elif [ -e ${tar} ] ; then
        #Not a link - presumably extant data
        :
    else
        #Missing, make a link
        ln -s ${src} ${tar}
    fi
}

#Make symlinks for all files in folder
function ens_sym_link_files {
    local src=$1
    local tar=$2

    mkdir -pv ${tar}
    local o_pwd=$PWD

    cd ${src}
    local files=(*)

    for ix in ${!files[*]}
    do
        local v=${files[$ix]}
        local f=$v
        local s="${src}/${f}"
        local t="${tar}/${f}"
        ens_sym_link ${s} ${t}
    done

    unset files

    cd ${o_pwd}
}

#Create symbolic links
rm -rf $HOME/.gitconfig
ens_sym_link ${env_mnt}/.gitconfig ${HOME}/.gitconfig

ens_sym_link_files ${conflink}/.emacs.d ${HOME}/.emacs.d
ens_sym_link_files ${conflink}/.config/devilspie2 ${HOME}/.config/devilspie2
#dynamically construct symlinks from _print_paths
for ix in ${!_print_paths[*]}
do
    v=${_print_paths[$ix]}
    src=${!v}
    tar=$v
    ens_sym_link ${src} ${HOME}/_${tar}
done

# ens_sym_link ${emacs_backups} ${HOME}/.emacs.d/emacs-backups


#This is probably a bad idea..
{
    rm -rf ${HOME}/.ssh/config
    cp ${Personal}/.ssh/config ${HOME}/.ssh/config
    chown ${USER} ${HOME}/.ssh/config
    chmod 644 ${HOME}/.ssh/config
} &> /dev/null

#!/usr/bin/env bash

function ProxyOn() {
	local PROXY="proxy.noc.titech.ac.jp"
	local PORT=3128
    gsettings set org.gnome.system.proxy mode 'manual'
    gsettings set org.gnome.system.proxy.http host $PROXY
    gsettings set org.gnome.system.proxy.http port $PORT
    gsettings set org.gnome.system.proxy.https host $PROXY
    gsettings set org.gnome.system.proxy.https port $PORT
    gsettings set org.gnome.system.proxy.ftp host $PROXY
    gsettings set org.gnome.system.proxy.ftp port $PORT
    gsettings set org.gnome.system.proxy.socks host $PROXY
    gsettings set org.gnome.system.proxy.socks port $PORT
    gsettings set org.gnome.system.proxy ignore-hosts '["localhost", "127.0.0.0/8", "wlanauth.noc.titech.ac.jp"]'
    export http_proxy=$PROXY:$PORT
    export https_proxy=$PROXY:$PORT
    export ftp_proxy=$PROXY:$PORT
    export socks_proxy=$PROXY:$PORT
    export HTTP_PROXY=$PROXY:$PORT
    export HTTPS_PROXY=$PROXY:$PORT
    export FTP_PROXY=$PROXY:$PORT
    export SOCKS_PROXY=$PROXY:$PORT
	RestartCloud
}

function KillProxy() {
    gsettings reset-recursively org.gnome.system.proxy
    unset HTTP_PROXY
    unset http_proxy
    unset HTTPS_PROXY
    unset https_proxy
    unset FTP_proxy
    unset ftp_proxy
    unset SOCKS_proxy
    unset socks_proxy
	RestartCloud
}

function RestartCloud() {
	killall dropbox
	dropbox start
	killall megasync
	megasync &
	git config --global http.proxy $http.proxy
}

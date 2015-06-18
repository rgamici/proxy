#!/usr/bin/env bash

function ProxyOn() {
    gsettings set org.gnome.system.proxy mode 'manual'
    gsettings set org.gnome.system.proxy.http host 'proxy.noc.titech.ac.jp'
    gsettings set org.gnome.system.proxy.http port 3128
    gsettings set org.gnome.system.proxy.https host 'proxy.noc.titech.ac.jp'
    gsettings set org.gnome.system.proxy.https port 3128
    gsettings set org.gnome.system.proxy.ftp host 'proxy.noc.titech.ac.jp'
    gsettings set org.gnome.system.proxy.ftp port 3128
    gsettings set org.gnome.system.proxy.socks host 'proxy.noc.titech.ac.jp'
    gsettings set org.gnome.system.proxy.socks port 3128
    gsettings set org.gnome.system.proxy ignore-hosts "['localhost', '127.0.0.0/8', 'wlanauth.noc.titech.ac.jp']"
    export http_proxy='proxy.noc.titech.ac.jp:3128'
    export https_proxy="proxy.noc.titech.ac.jp:3128"
    export ftp_proxy="proxy.noc.titech.ac.jp:3128"
    export socks_proxy="proxy.noc.titech.ac.jp:3128"
    export HTTP_PROXY='proxy.noc.titech.ac.jp:3128'
    export HTTPS_PROXY="proxy.noc.titech.ac.jp:3128"
    export FTP_PROXY="proxy.noc.titech.ac.jp:3128"
    export SOCKS_PROXY="proxy.noc.titech.ac.jp:3128"
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
}

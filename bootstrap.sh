#!/bin/bash

GO_DOWNLOAD_ROOT=https://download.go.cd/binaries/16.8.0-3929/deb
GO_SERVER_PKG_NAME=go-server_16.8.0-3929_all.deb
GO_AGENT_PKG_NAME=go-agent_16.8.0-3929_all.deb


# prepare go packages
mkdir tmp
wget \
    $GO_DOWNLOAD_ROOT/$GO_SERVER_PKG_NAME \
    -O ./tmp/$GO_SERVER_PKG_NAME

wget \
    $GO_DOWNLOAD_ROOT/$GO_AGENT_PKG_NAME \
    -O ./tmp/$GO_AGENT_PKG_NAME


# create vagrant instance
vagrant up


# provision gocd
ansible-playbook \
    -i ./ansible/inventory \
    -e pkg_go_server=../tmp/$GO_SERVER_PKG_NAME \
    -e pkg_go_agent=../tmp/$GO_AGENT_PKG_NAME \
    ./ansible/setup.yml

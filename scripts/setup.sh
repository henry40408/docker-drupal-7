#!/usr/bin/env bash

set -eo pipefail

CHECKSUM=78b1814e55fdaf40e753fd523d059f8d
PERMANENT_PKGS="rsync"
INTERMEDIATE_PKGS="wget"

setup() {
    apt-get update
    apt-get install -qy ${PERMANENT_PKGS}
    apt-get install -qy ${INTERMEDIATE_PKGS}
}

teardown() {
    apt-get purge -qy ${INTERMEDIATE_PKGS}
    apt-get --purge autoremove -qy
    rm -rf /var/lib/apt/lists/*
}

main() {
    wget https://ftp.drupal.org/files/projects/drupal-7.67.tar.gz
    echo "${CHECKSUM}  drupal-7.67.tar.gz" > checksum
    md5sum -c checksum
    tar zxf drupal-7.67.tar.gz
}

pushd /tmp
setup
main
teardown
popd

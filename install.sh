#!/bin/bash

function atualiza() {
  echo "Atualizando sistema"
  apt-get update
}

function install_docker() {
  atualiza
  apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
  curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -
  apt-key fingerprint 0EBFCD88
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable"
  atualiza
  apt-get install docker-ce -y
  apt-get install python-pip -y
  pip install docker-compose
}

function help() {
  echo "Help"
}

function versao() {
  echo "Versão"
}

function manual() {
  echo "Manual"
}

function download_docker_images() {
  # Server
  docker pull nginx

  # DB
  docker pull mysql:5.5
  docker pull postgres

  # S.O
  docker pull ubuntu:16.04
  docker pull debian
  docker pull debian:9-slim
  docker pull debian:stretch
  docker pull debian:jessie
  docker pull alpine

  # Admin
  docker pull portainer/portainer

  # Program
  docker pull python:3
  docker pull python:2
  docker pull gcc
  docker pull ruby:2.5
  docker pull node:10-slim
}

case $1 in
  -id | --install-docker )
    install_docker
    ;;
  -h )
    help
    ;;
  -V )
    versao
    ;;
  -m )
    manual
    ;;
esac

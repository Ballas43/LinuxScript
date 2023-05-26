#!/bin/bash

TORRENT_INFO=`webtorrent info "$1"`

echo $TORRENT_INFO

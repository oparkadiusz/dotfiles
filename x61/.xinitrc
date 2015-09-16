#!/bin/sh

nitrogen --restore &
gpg-agent --daemon --enable-ssh-support &
aa-notify -p &
exec i3

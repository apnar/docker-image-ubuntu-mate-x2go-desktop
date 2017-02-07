#!/bin/bash

set -e

dbus-daemon --system --fork

/usr/sbin/sshd

exec "$@"

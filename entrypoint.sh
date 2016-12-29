#!/bin/bash
set -e

# Grant permissions to /dev/stdout for spawned squid process
chown squid:squid /dev/stdout

# Run application
exec "$@"
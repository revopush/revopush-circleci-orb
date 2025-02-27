#!/bin/bash
set -ex

if ! which revopush > /dev/null; then
  echo "Installing Revopush CLI..."
  npm install --prefix=$HOME/.local --global @revopush/code-push-cli@$CLI_VERSION> /dev/null 2>&1
fi

echo "Logging in to Revopush..."
revopush logout > /dev/null 2>&1 || true


# we use variable indirection to get the value of the ACCESS_KEY variable.
# ACCESS_KEY value points to a name of variable to retrieve.
if [ -z ${!ACCESS_KEY}]; then
    echo "Revopush Access Key not provided. Set the REVOPUSH_ACCESS_KEY environment variable."
    exit 1
else
    revopush login --accessKey ${!ACCESS_KEY}
    exit 0
fi


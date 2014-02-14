#!/bin/bash
DEST=$1
# Copy all files
cp -rL ~/cryocond/root/* $DEST &&
# Copy cryocond executable
cp -L ~/cryocond/M54/ARM-EK/cryocond $DEST/var &&
# Install web pages
# Install updater
cp -rL ~/cryocond/new_web/* $DEST/var &&
# Copy splash screen executable
(cp -L ~/cryocond/splash/ARM/splash $DEST/opt || true) &&
# Install user's public key
cat ~/.ssh/id_rsa.pub | tee -a $DEST/root/.ssh/authorized_keys

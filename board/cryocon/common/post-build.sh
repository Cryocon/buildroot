#!/bin/bash
DEST=$1
# Update Python path
(echo "#!/usr/bin/python" && tail -n +2 $DEST/usr/bin/gunicorn) > $DEST/usr/bin/gunicorn.new &&
chmod --reference=$DEST/usr/bin/gunicorn $DEST/usr/bin/gunicorn.new &&
mv $DEST/usr/bin/gunicorn.new $DEST/usr/bin/gunicorn &&
(rm -f $DEST/var/spool $DEST/var/cache || true) &&
mkdir -p $DEST/var/spool $DEST/var/cache &&
# Copy all files
(cp -rvL ../cryocond/root/* $DEST || true) &&
# Install web pages
# Install updater
cp -rL ../cryocond/new_web/www $DEST/var &&
# Copy splash screen executable
(cp -L ../cryocond/splash/ARM/splash $DEST/opt || true) &&
# Install user's public key
cat ~/.ssh/id_rsa.pub | tee -a $DEST/root/.ssh/authorized_keys

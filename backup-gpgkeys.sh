#!/usr/bin/env bash

DATE=$(date +%Y%m%d%H%M)
GPG_FILE=gnupg-$DATE.tar.gz

cd $HOME/.gnupg

# Export Private Key to backups
gpg --export-secret-keys --export-options backup --output backups/private.gpg vamem9z@gmail.com

# Export Public Key to backups
gpg --armor --export vamem9z@gmail.com >backups/public-key.asc

# Export the Trust Database
gpg --export-ownertrust >ownertrust.txt

# Create a backup and copy it to apoc
cd $HOME
tar -cvf $GPG_FILE .gnupg
scp $GPG_FILE mmiles@apoc:/data/Moses/gpg-backups
rm $GPG_FILE

echo " "
echo " "
echo "NOTE - UPDATE Copies in 1Password"
echo " "
echo " "
echo "Because these keys expire every 12 months be sure to upload new versions of the backups into 1password after extending the expiration date."

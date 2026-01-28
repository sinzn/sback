#!/bin/bash
set -e

BUCKET="sinznbackupbucket"
HOST=$(hostname)
FILE="/tmp/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

tar -I 'gzip -9' -cf "$FILE" .
aws s3 cp "$FILE" "s3://$BUCKET/$HOST/"
rm -f "$FILE"

echo "Backup completed"


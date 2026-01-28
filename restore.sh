#!/bin/bash
set -e

select BUCKET in $(aws s3 ls | awk '{print $3}'); do break; done
select HOST in $(aws s3 ls "s3://$BUCKET/" | awk '{print $2}' | tr -d '/'); do break; done
select FILE in $(aws s3 ls "s3://$BUCKET/$HOST/" | awk '{print $4}'); do break; done

DIR="restore_data"
mkdir -p "$DIR"

aws s3 cp "s3://$BUCKET/$HOST/$FILE" /tmp/backup.tar.gz
tar -xzf /tmp/backup.tar.gz -C "$DIR"
rm -f /tmp/backup.tar.gz

echo "Restore completed"


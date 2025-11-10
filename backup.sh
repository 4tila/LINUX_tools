LOCATION=$(lsblk -o NAME,VENDOR | grep "SanDisk" | awk '{print $1}')
MOUNTPOINT=$(lsblk -o NAME,MOUNTPOINT | grep "└─" | grep "$LOCATION" | awk '{print $2}')
if [ -z "$MOUNTPOINT" ] || [ -z "$LOCATION" ]; then
	echo "Did not find sandisk to backup"
	exit 1
fi
#rsync -avh --progress ~/Desktop $MOUNTPOINT/rsync/
rsync -av --partial --append --progress --log-file=$HOME/rsync.log ~/Desktop $MOUNTPOINT/rsync/ # avn for dry-run

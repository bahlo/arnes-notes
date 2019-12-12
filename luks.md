# LUKS

LUKS (Linux Unified Key Setup) is a full disk encryption specification. It allows you to easily create an encrypted volume.

## Install

On Ubuntu/Debian, run: `apt-get install cryptsetup`.

## Set up

Run the following to create an encrypted volume on `/dev/sdb`:

```sh
$ cryptsetup luksFormat /dev/sdb
```

Please note that this delete the contents of /dev/sdb.

After that, open the volume and create a file system:

```sh
$ cryptsetup open /dev/sdb encrypted
$ mkfs.ext4 /dev/mapper/encrypted
```

## Open and mount

Open the volume and then mount it (in this case to `/mnt/data`: 

```sh
$ cryptsetup --type luks open /dev/sdb encrypted
$ mount -t ext4 /dev/mapper/encrypted /mmt/data
```

## Unmount and close

```sh
$ umount /mnt/data
$ cryptsetup close encrypted
```

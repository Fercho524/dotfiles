#!/bin/bash

echo "sudo ntfs-3g -o remove_hiberfile /dev/sda2 Público"
sudo ntfs-3g -o remove_hiberfile /dev/sda2 Público
echo "sudo umount Público"
sudo umount Público


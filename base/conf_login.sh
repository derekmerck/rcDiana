#!/bin/bash

echo "Resetting root login password to $ROOT_PASSWORD"
echo "root:$ROOT_PASSWORD" | chpasswd
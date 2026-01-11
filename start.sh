#!/bin/bash

DOWNLOADER="./hytale-downloader-linux-amd64"

# Check if the downloader exists
if [ ! -f "$DOWNLOADER" ]; then
    echo "Error: Hytale downloader not found!"
    echo "Please run the installation script first."
    exit 1
fi

# Check if the downloader is executable
if [ ! -x "$DOWNLOADER" ]; then
    echo "Setting executable permissions..."
    chmod +x "$DOWNLOADER"
fi

echo "Starting Hytale downloader..."
$DOWNLOADER -check-update
$DOWNLOADER

echo "Starting Hytale server..."
java -jar HytaleServer.jar \
    --assets {{ASSET_PACK}} \
    --accept-early-plugins {{ACCEPT_EARLY_PLUGINS}} \
    --allow-op {{ALLOW_OP}} \
    --auth-mode {{AUTH_MODE}} \
    --backup {{ENABLE_BACKUPS}} \
    --backup-dir {{BACKUP_DIRECTORY}} \
    --backup-frequency {{BACKUP_FREQUENCY}} \
    --bind {{SERVER_IP}}:{{SERVER_PORT}}

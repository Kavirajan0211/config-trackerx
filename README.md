# ConfigTrackerX

ConfigTrackerX is a Linux Configuration Version Control System.

## Project Overview

This project automatically backs up important Linux server configuration files into a GitHub repository.

## Tools Used

- Git
- Linux
- Shell Scripting
- Cron Jobs
- GitHub
- Jenkins optional

## Features

- Automatic backup of Linux configuration files
- Git-based version control
- Daily backup using cron job
- Tracks server configuration changes
- Helps identify unauthorized modifications

## Files Tracked

- sshd_config
- nginx.conf
- docker-compose.yml

## Workflow

1. Shell script collects configuration files
2. Files are copied into backup folder
3. Git commits the changes automatically
4. Files are pushed to GitHub
5. Cron job runs the script daily

## Run Command

./scripts/backup_config.sh

## Cron Job

0 9 * * * /home/ubuntu/ConfigTrackerX/scripts/backup_config.sh

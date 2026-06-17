#!/usr/bin/env bash
set -euo pipefail
mkdir -p reports
newman run postman/collections/FIT4110_lab03_notification.postman_collection.json -e postman/environments/FIT4110_lab03_mock.postman_environment.json -r cli,junit,htmlextra

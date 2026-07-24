#!/bin/bash
set -e

sudo chmod 666 /dev/ttyUSB* /dev/ttyACM* 2>/dev/null || true

docker run --rm -it \
  --privileged \
  -v /dev:/dev \
  -v "$(pwd)":/project \
  -w /project \
  espressif/idf-rust:all_latest \
  bash -c "cargo espflash flash --monitor"
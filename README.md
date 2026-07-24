# ESP32-S3 Octal PSRAM Rust Reference Project (`rs-psram`)

Reference project for **ESP32-S3 (8MB Octal PSRAM + 16MB Flash)** using Rust (`esp-idf-sys` / `esp-idf-hal`).

This repository serves as the Rust counterpart to the C reference project [`es-psram`](https://github.com/i-3/es-psram).

## Target Hardware
* **Chip:** ESP32-S3 (revision v0.2)
* **Flash:** 16MB (QIO mode, 80MHz)
* **PSRAM:** 8MB Octal PSRAM (AP Memory, 40MHz)

## Verification Status
* **Status:** PASS (100% Working)
* **ESP-IDF Version:** v5.2.2 (via `espressif/idf-rust:all_latest`)

## How to Run (Docker)

Make the runner script executable and launch the build, flash, and serial monitor:

```bash
chmod +x run.sh
./run.sh
```

To exit the serial monitor, press `Ctrl + ]`.

## Serial Output Log
```text
I (238) octal_psram: vendor id    : 0x0d (AP)
I (238) octal_psram: dev id       : 0x02 (generation 3)
I (239) octal_psram: density      : 0x03 (64 Mbit)
I (279) esp_psram: Found 8MB PSRAM device
I (283) esp_psram: Speed: 40MHz
I (1025) esp_psram: SPI SRAM memory test OK
I (1226) esp_psram: Adding pool of 8192K of PSRAM memory to heap allocator
I (1709) main_task: Calling app_main()
I (1709) rs_psram: ====================================
I (1719) rs_psram:   SUCCESS: App reached main()!     
I (1719) rs_psram: ====================================
```
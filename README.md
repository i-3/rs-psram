# ESP32-S3 Octal PSRAM Crash (Rust MRE)

Minimal reproducible example showing an immediate `RTCWDT_RTC_RST` bootloop / crash on **ESP32-S3 (8MB Octal PSRAM + 16MB Flash)** when building with Rust and `esp-idf-sys` / `esp-idf-hal`.

## Target Hardware
* **Chip:** ESP32-S3 (revision v0.2)
* **Flash:** 16MB (DIO mode, 40MHz)
* **PSRAM:** 8MB Octal PSRAM (AP Memory, 40MHz)

## Issue Summary
Immediately after `cpu_start: Starting app cpu`, the chip crashes during PSRAM initialization:

1. **Instant Crash & Garbage:** Log output cuts off mid-line (`d mmu entry)`), immediately followed by a burst of corrupted/garbage characters on UART as memory access drops.
2. **2–3s Silence:** The system completely freezes for 2–3 seconds (panic handler cannot run).
3. **RTC Watchdog Reset:** The hardware RTC Watchdog Timer times out and forces a hard reset (`rst:0x10 (RTCWDT_RTC_RST)`).

```text
D (322) cpu_start: Starting app cpu, entry point is 0x4037606c
D (0) cpu_st...configuration...d mmu entry)...

[ 2–3 seconds silence ]

ESP-ROM:esp32s3-20210327
Build:Mar 27 2021
rst:0x10 (RTCWDT_RTC_RST),boot:0x2b (SPI_FAST_FLASH_BOOT)

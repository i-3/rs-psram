## Issue Summary
Immediately after `cpu_start: Starting app cpu`, the chip experiences an instant memory/MMU fault during PSRAM MMU table configuration:

1. **MMU Fault & Burst of Garbage:** Access to Flash/Cache is lost mid-line (`d mmu entry)`), causing the CPU to instantly crash and spew corrupted characters into UART.
2. **2–3s Silence:** The CPU stays dead-frozen because the panic handler cannot execute from unreadable Flash.
3. **RTC Watchdog Reset:** The hardware RTC Watchdog Timer times out and forces a hard reset (`rst:0x10 (RTCWDT_RTC_RST)`).

```text
D (322) cpu_start: Starting app cpu, entry point is 0x4037606c
D (0) cpu_st...configuration...d mmu entry)...

[ 2–3 seconds silence ]

ESP-ROM:esp32s3-20210327
Build:Mar 27 2021
rst:0x10 (RTCWDT_RTC_RST),boot:0x2b (SPI_FAST_FLASH_BOOT)

# Lab 2 – Serial Transmitter

Implemented a UART transmitter in SystemVerilog as part of MIT 6.111 Digital Systems Laboratory (Fall 2019).

### Features
- 8-bit UART transmission.
- Configurable baud-rate timing.
- LSB-first data transmission.
- Start and stop bit generation.
- Input data captured before transmission.
- Idle-high serial output.

### Verification
- Developed a SystemVerilog testbench.
- Simulated using Questa FPGA Starter Edition.
- Verified UART frame sequencing and transmission timing.

### Interface
- `clk`: System clock
- `rst`: Synchronous reset
- `trigger`: Starts transmission
- `data[7:0]`: Input byte
- `out_data`: Serial TX output

### Configuration
- Default clock frequency: 100 MHz
- Baud rate: Approximately 115,200 baud
- UART format: 8N1
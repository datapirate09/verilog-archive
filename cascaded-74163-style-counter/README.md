# Cascaded 74163-Style Counter

A SystemVerilog implementation of a cascaded 74163-style synchronous binary counter.

### Project Structure
- `rtl/` – RTL source files implementing the counter modules.
- `tb/` – Testbench for functional simulation.

### Features
- Cascaded counter architecture using smaller counter modules.
- Synchronous counting with clock control.
- Parallel data loading.
- Count enable and clear functionality.
- Rollover and carry-out behaviour.

### Simulation
The design was functionally simulated using **Questa-Altera FPGA Starter Edition** with a Verilog testbench.


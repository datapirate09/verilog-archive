# 32-bit Register File

A 32-bit register file implementation using modular register instantiation and Verilog generate constructs.

### Features
- 32 registers, each 32 bits wide.
- Two independent read ports.
- Synchronous write operation.
- Hardwired-zero register (R31).
- Parameterized/reusable register module.

### Simulation
Functionally verified using a SystemVerilog testbench in Questa-Altera.
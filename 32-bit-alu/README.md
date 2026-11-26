# 32-bit ALU

A modular 32-bit Arithmetic Logic Unit (ALU) implemented in Verilog, based on the MIT Computation Structures ALU architecture.

## Architecture

The ALU consists of four independently implemented functional units:

- **Arithmetic Unit:** Performs 32-bit addition and subtraction using a shared adder. Generates Zero, Negative, and Overflow flags.
- **Logic Unit:** Implements programmable Boolean operations using multiplexers.
- **Comparison Unit:** Performs equality, signed less-than, and signed less-than-or-equal comparisons using arithmetic flags.
- **Shift Unit:** Supports logical left shift, logical right shift, and arithmetic right shift.

The top-level ALU selects the appropriate functional unit output based on a 6-bit function code (`fn`).

## Features

- 32-bit datapath.
- Shared adder/subtractor architecture.
- Programmable Boolean operations.
- Signed comparison using Zero, Negative, and Overflow flags.
- Logical and arithmetic shift operations.
- Modular RTL design with separate functional units.


## Simulation

Functionally simulated using a Verilog testbench in Questa-Altera Starter Edition.

The initial smoke test covers:
- Addition
- Subtraction
- Boolean OR
- Equality comparison
- Logical left shift

## Implementation

Designed using Verilog with a modular approach, allowing each functional unit to be developed and tested independently before integration into the top-level ALU.
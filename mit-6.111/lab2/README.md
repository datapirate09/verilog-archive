# Multiple-Digit Seven-Segment Display Controller

## Overview
A modular SystemVerilog design that displays and selects between multiple 16-bit data sources using an 8-digit seven-segment display. The project combines button debouncing, edge detection, event counting, clock division, multiplexing, and seven-segment display control.

## Architecture

The design has three selectable data sources:

1. **Switch Input:** Displays the 16-bit value provided through the switches.
2. **Button Counter:** Increments on each detected rising edge of a debounced button press.
3. **Slow Counter:** Increments on the rising edge of a divided clock generated from the main clock.

Two selection buttons control a multiplexer that routes the chosen 16-bit value to the seven-segment display controller.

## Modules

| Module | Description |
|---|---|
| `debounce` | Filters mechanical button bouncing by requiring a stable input over a specified number of clock cycles. |
| `edge_detector` | Generates a one-clock-cycle pulse on a rising edge of the debounced button signal. |
| `simple_counter` | Increments its count when an event pulse is detected. |
| `clock_divider` | Divides the input clock to generate a slower clock signal. |
| `non_event_counter` | Increments on every rising edge of the divided clock. |
| `mux_3_1` | Selects between the switch input and the two counter outputs. |
| `bin_to_hex` | Converts a 4-bit binary value into its corresponding seven-segment representation. |
| `seven_seg_controller` | Multiplexes the eight display digits to display a 32-bit hexadecimal value. |
| `multiple_digits_top` | Integrates all modules into the complete design. |

## Display Source Selection

| `btnc` | `btn1` | Selected Source |
|---|---|---|
| 0 | 0 | Switch Input |
| 0 | 1 | Button Counter |
| 1 | 0 | Slow Counter |
| 1 | 1 | Button Counter |

## Key Concepts
- Synchronous sequential logic and combinational logic
- Mechanical button debouncing
- Rising-edge detection and pulse generation
- Clock division and generated clocks
- Event-driven and clock-driven counters
- Multiplexer-based data selection
- Seven-segment display decoding and time-division multiplexing
- Modular RTL design and top-level integration

## Tools
- SystemVerilog
- Questa FPGA Starter Edition

## Simulation
Individual modules and the integrated top-level design can be simulated using Questa. Test reset behavior, button presses, counter operation, source selection, and seven-segment digit multiplexing.
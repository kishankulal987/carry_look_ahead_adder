Overview

This project implements a 4-bit Carry Look-Ahead Adder (CLA) in Verilog using structural modeling. The CLA efficiently computes the sum of two 4-bit numbers (a and b) and an input carry (cin), producing a 4-bit sum (sum) and an output carry (cout). A testbench is included to verify functionality through simulation in Vivado.

Module: carry_look_ahead_adder





Description: A 4-bit Carry Look-Ahead Adder designed structurally.



Inputs:





a[3:0]: First 4-bit input number.



b[3:0]: Second 4-bit input number.



cin: Single-bit carry-in input.



Outputs:





sum[3:0]: 4-bit sum of a, b, and cin.



cout: Single-bit carry-out output.



Functionality:





Propagate (P) and Generate (G) Signals:





Propagate: p[i] = a[i] XOR b[i] (computed using XOR gates).



Generate: g[i] = a[i] AND b[i] (computed using AND gates).



Carry Calculation: Uses carry look-ahead logic to compute carries (c[0] to c[3]) efficiently:





c[0] = g[0] | (p[0] & cin)



c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin)



c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin)



c[3] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin)



Sum Calculation: sum[i] = p[i] XOR c[i-1] (with sum[0] = p[0] XOR cin).



Carry-Out: cout = c[3] (buffered output).



Style: Structural modeling using XOR, AND, and buffer gates, with continuous assignments for carry logic.

Testbench: testbench





Description: A testbench to simulate and verify the 4-bit CLA.



Functionality:





Inputs: 4-bit vectors a and b, and single-bit cin.



Sets cin = 1 and iterates through all combinations of a and b (0 to 15 each) using nested loops.



Applies a 10ns delay between test cases.



Monitors and displays inputs (a, b, cin), outputs (sum, cout) using $monitor (not explicitly shown in code but implied for verification).



Time Scale: Defined as 1ns / 1ps for simulation precision.



Purpose: Verifies the CLA correctly computes the sum and carry-out for all input combinations.

Files





carry_look_ahead_adder.v: Verilog module for the 4-bit CLA.



testbench.v: Testbench for simulation.

Circuit Diagram

Below is the circuit diagram for the 4-bit Carry Look-Ahead Adder.
![sddefault](https://github.com/user-attachments/assets/a13a2e40-0c1a-406d-a36b-0392c7d17108)


Simulation in Vivado





Setup:





Open Xilinx Vivado (e.g., 2023.2 or later).



Create a new RTL project and specify a project name/location.



Add Files:





Add carry_look_ahead_adder.v and testbench.v via "Add Sources."



Set testbench as the top module for simulation.



Run Simulation:





Go to "Flow" > "Run Simulation" > "Run Behavioral Simulation."



Vivado’s XSim simulator executes the testbench.




Simulation Waveform

Below is the simulation waveform from Vivado, showing inputs a[3:0], b[3:0], cin, and outputs sum[3:0], cout over time.
![Screenshot 2025-06-04 211335](https://github.com/user-attachments/assets/75bca1d2-5687-49fd-85d8-d901cf31e538)

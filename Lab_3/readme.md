# Lab 3: VHDL Code for Decoders and Encoders

**Course:** Computer Architecture (CMP 262)
**Program:** Bachelor of Computer Engineering
**Semester:** Fourth Semester
**College:** Cosmos College of Management and Technology
**Department:** Department of Information and Communication Technology

---

## Objective

- To write VHDL code for a 2-to-4 Decoder and a 4-to-2 Encoder.
- To understand the operation of combinatorial circuits for code conversion.
- To simulate and verify the functionality using testbenches and GTKWave.

---

## Theory

### Decoder

A **decoder** is a combinatorial logic circuit that converts coded inputs into a single active output. A 2-to-4 decoder has:
- **Inputs:** 2-bit binary code (A[1:0]) and Enable signal (EN)
- **Outputs:** 4 outputs (Y[3:0]), exactly one of which is active when EN = '1'

**Logic:**
- When EN = '1': Only the output corresponding to the binary input value is '1'
  - A = 00 → Y = 0001
  - A = 01 → Y = 0010
  - A = 10 → Y = 0100
  - A = 11 → Y = 1000
- When EN = '0': All outputs are '0'

**Application:** Address decoding in memory systems, multiplexing control, etc.

### Encoder

An **encoder** is the inverse of a decoder. It converts one active input into a binary code. A 4-to-2 encoder has:
- **Inputs:** 4 input lines (I[3:0])
- **Outputs:** 2-bit binary output (Y[1:0]) and Valid signal (V)

**Logic:**
- Encoder checks inputs in priority order (I3 > I2 > I1 > I0)
- When any input is '1': Y outputs the binary representation of the highest priority active input
  - I[0] = 1 → Y = 00, V = 1
  - I[1] = 1 → Y = 01, V = 1
  - I[2] = 1 → Y = 10, V = 1
  - I[3] = 1 → Y = 11, V = 1
- When no input is '1': V = '0' (invalid condition)

**Application:** Keyboard scanning, interrupt priority handling, data bus arbitration.

### Truth Tables

#### 2-to-4 Decoder (with EN = '1')

| A[1] | A[0] | Y[3] | Y[2] | Y[1] | Y[0] |
|------|------|------|------|------|------|
|  0   |  0   |  0   |  0   |  0   |  1   |
|  0   |  1   |  0   |  0   |  1   |  0   |
|  1   |  0   |  0   |  1   |  0   |  0   |
|  1   |  1   |  1   |  0   |  0   |  0   |

#### 4-to-2 Encoder (Priority: I3 > I2 > I1 > I0)

| I[3] | I[2] | I[1] | I[0] | Y[1] | Y[0] | V |
|------|------|------|------|------|------|---|
|  0   |  0   |  0   |  1   |  0   |  0   | 1 |
|  0   |  0   |  1   |  0   |  0   |  1   | 1 |
|  0   |  1   |  0   |  0   |  1   |  0   | 1 |
|  1   |  0   |  0   |  0   |  1   |  1   | 1 |
|  0   |  0   |  0   |  0   |  X   |  X   | 0 |

---

## Files

### Design Files

- **`decoder_2to4.vhd`** – 2-to-4 Decoder implementation
- **`encoder_4to2.vhd`** – 4-to-2 Encoder implementation

### Testbench Files

- **`decoder_tb.vhd`** – Testbench for the decoder
- **`encoder_tb.vhd`** – Testbench for the encoder

### Simulation Files

- **`decoder_tb.vcd`** – VCD waveform data for decoder simulation
- **`encoder_tb.vcd`** – VCD waveform data for encoder simulation
- **`decoder_tb.gtkw`** – GTKWave configuration file for decoder waveforms
- **`encoder_tb.gtkw`** – GTKWave configuration file for encoder waveforms

---

## Implementation Details

### Decoder Implementation

The 2-to-4 decoder is implemented using a **Case Statement** inside a process:

```vhdl
architecture Behavioral of DECODER_2TO4 is
begin
    process(A, EN)
    begin
        if EN = '1' then
            case A is
                when "00"   => Y <= "0001";
                when "01"   => Y <= "0010";
                when "10"   => Y <= "0100";
                when "11"   => Y <= "1000";
                when others => Y <= "0000";
            end case;
        else Y <= "0000";
        end if;
    end process;
end architecture Behavioral;
```

### Encoder Implementation

The 4-to-2 encoder uses **Priority Logic** with `if-elsif` statements:

```vhdl
architecture Behavioral of ENCODER_4TO2 is
begin
    process(I)
    begin
        V <= '1';
        if I(3) = '1' then 
            Y <= "11";
        elsif I(2) = '1' then 
            Y <= "10";
        elsif I(1) = '1' then 
            Y <= "01";
        elsif I(0) = '1' then 
            Y <= "00";
        else 
            Y <= "00"; 
            V <= '0';
        end if;
    end process;
end architecture Behavioral;
```

---

## Simulation and Testing

### Running the Simulation

1. **Compile the files** in your VHDL simulator (GHDL, ModelSim, etc.)
2. **Run the testbench** (`decoder_tb` and `encoder_tb`)
3. **View the waveforms** in GTKWave using the provided `.gtkw` configuration files

### Test Vectors

#### Decoder Testbench Sequence
- EN = '1', A = "00" → Y = "0001" (10 ns)
- EN = '1', A = "01" → Y = "0010" (10 ns)
- EN = '0', A = "10" → Y = "0000" (10 ns)
- EN = '0', A = "11" → Y = "0000" (10 ns)

#### Encoder Testbench Sequence
- I = "0001" → Y = "00", V = '1' (10 ns)
- I = "0010" → Y = "01", V = '1' (10 ns)
- I = "0100" → Y = "10", V = '1' (10 ns)
- I = "1000" → Y = "11", V = '1' (10 ns)
- I = "1010" → Y = "11", V = '1' (priority: I3 wins over I1) (10 ns)
- I = "0000" → Y = "00", V = '0' (no valid input) (10 ns)

---

## Key Concepts

- **Combinatorial Logic:** The output depends only on the current inputs; no memory or feedback.
- **Case Statement:** Used to implement the decoder's one-hot output selection.
- **Priority Encoding:** The encoder prioritizes higher-order inputs when multiple inputs are active.
- **Enable Signal:** The decoder's EN signal allows multiple decoders to be controlled with a common input bus.
- **Valid Signal:** The encoder's V output indicates whether the input data is valid.

---

## Expected Outcomes

After completing this lab, you should understand:
1. How decoders convert binary codes into one-hot outputs.
2. How encoders convert one-hot inputs into binary codes.
3. The relationship between decoders and encoders (inverse operations).
4. How to use case statements and conditional logic for combinatorial designs.
5. How to verify circuit behavior through simulation waveforms.

---

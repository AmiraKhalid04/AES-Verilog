# Verilog Coding Style Guide
This guide provides recommendations for writing clear, consistent, and maintainable Verilog code.

## Naming Conventions
- **Module Declarations:** Use snake_case (e.g.,  module_name).
## `begin` and `end` placement

- `begin` should be placed on the same line as statement 
- `end` should be placed on a separate line
- for else statements place `end`  on the same line as else 

**✔️ Do:** 

```verilog
always @(posedge clk) begin
  q <= d;
end
```

```verilog
// "end else begin" are on the same line.
if (condition) begin
  // statement
end else begin
  // statement
end
```

**❌ Don't:**

```verilog
// Incorrect because "else" must be on the same line as "end".
if (condition) begin
  // statement
end
else begin
  // statement
end
```


**Single-Statement Blocks**
- If an `if` or `always` block has only one statement, you can omit `begin` and `end`, but keep the expression on one line.

**✔️ Do:**

```verilog
always @(posedge clk) q <= d;
```

**❌ Don't:**

```verilog
always @(posedge clk)
  q <= d;
```


## Module Declaration

- The opening parenthesis should be on the same line as the module declaration, and the first port should be declared on the following line.
- The closing parenthesis should be on its own line, in column zero.
- The clock port(s) must be declared first in the port list, followed by any and all reset inputs.
- **Avoid implicit declarations**

**✔️ Do:**

```verilog 
module foo(
	input clk, 
	input enable, 
	input reset, 
	input load, 
	input [3:0] data, 
	input direction, 
	output reg [3:0] out
);
```

## Spaces 

```verilog
// Include a space after always, but not before posedge.
always @(posedge clk) begin
	// statements
end
```


## General

**✔️ Preferred** 
```verilog
always @(posedge clk or negedge reset) 
```


**❌ Not preferred**
```verilog
always @(posedge clk, negedge rst_n) begin
```






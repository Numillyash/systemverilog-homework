//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux
  (
    input  d0, d1,
    input  sel,
    output y
  );

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module xor_gate_using_mux
  (
    input  a,
    input  b,
    output o
  );

  // Task:
  // Implement xor gate using instance(s) of mux,
  // constants 0 and 1, and wire connections
  wire nb;  // ~b, получаем тоже через mux

  // Инвертор на mux: ~b = mux(1, 0, b)
  mux m_notb (
        .d0 (1'b1),
        .d1 (1'b0),
        .sel(b),
        .y  (nb)
      );

  // XOR: если a=0 -> выдать b, если a=1 -> выдать ~b
  // o = mux(b, ~b, a)
  mux m_xor (
        .d0 (b),
        .d1 (nb),
        .sel(a),
        .y  (o)
      );
endmodule

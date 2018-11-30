GLOBAL formula

SECTION .text 

formula:

  ; xmm0: a
  ; xmm1: b
  ; xmm2: c
  ; xmm3: d
  ; xmm4: e
  ; xmm5: f
  ; xmm6: g
  ; xmm7: h

  ADDSD xmm0, xmm1 ; a + b = t1
  SUBSD xmm2, xmm3 ; c - d = t2

  MULSD xmm0, xmm2 ; t1 * t2 = x

  MULSD xmm4, [v1] ; e * v1 = t3
  MULSD xmm5, [v2] ; f * v2 = t4

  DIVSD xmm6, [v3] ; g / v3 = t5
  DIVSD xmm7, [v2] ; h / v2 = t6

  ADDSD xmm4, xmm5 ; t3 + t4 = t7
  SUBSD xmm4, xmm6 ; t7 - t5 = t8
  ADDSD xmm4, xmm7 ; t8 + t6 = y

  MULSD xmm0, xmm4 ; x * y = z

  DIVSD xmm0, [v4]

  RET

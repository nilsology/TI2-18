GLOBAL formula

SECTION .text

formula: 
  add rdi, rsi ; (a+b)
  sub rdx, rcx
  mov rax, rdi
  mul rdx ; mulitply rdi = (a+b)*(c-d)

  mov rdi, [rsp + 8]    ; 7th param
  mov rcx, [rsp + 16]   ; 8th param

  shl r8, 3
  shl r9, 2
  add r8, r9

  shr rdi, 1
  sub r8, rdi

  shr rcx, 2
  add r8, rcx

  mul r8

  xor rdx, rdx

;  cdq
  mov r14, 3
  idiv r14

  ret

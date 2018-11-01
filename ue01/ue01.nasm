global gauss

section .text

gauss:
  MOV rax, rdi    ; a = n
  INC rax         ; a = a + 1
  MUL rdi         ; a = a * n
  MOV rbx, 2      ; b = 2
  DIV rbx         ; a / b

ret

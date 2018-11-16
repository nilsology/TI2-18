GLOBAL asm_fib_rek

section .text

asm_fib_rek:

  MOV rax, rdi
  CMP rax, 3
  JBE exit
  DEC rax
  PUSH rax
  CALL asm_fib_rek
  MOV rax, 0
  DEC  rax
  CALL asm_fib_rek
  POP  rdi
  ADD  rax, rbx
  exit:
  RET

GLOBAL asm_fib_it

asm_fib_it:

  MOV rcx, 0
  MOV rdx, 1
  MOV rax, 0

  loop:
    CMP rdi, 0
    JE end

    MOV rcx, rdx
    MOV rdx, rax
    MOV rax, rcx
    ADD rax, rdx
    DEC rdi
    JMP loop

  end:
    ret


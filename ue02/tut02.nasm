global my_func

section .code

my_func:
  mov rax, 1          ; set rax to 1 initially
  
  .while:             ; jump-anchor
    cmp rdi, 0        ; rdi == 0
    jle .end          ; jump to .end if 'cmp rdi, 0' less or equal
                      ; // condition checking: while (n > 0)

    mul rdi           ; a *= n // mul rdi ^= rdx:rax = rax * rdi
    inc rax           ; a++

    dec rdi           ; n--

    jmp .while        ; next loop-iteration

  .end
    ret               ; as default return register rax is used as a
                      ; nothing more has to be done and we can exit

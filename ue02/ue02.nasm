GLOBAL collatz
section .text

; k = 0
; while (n > 1) {
;   if (isEven(n)) {
;     n /= 2;
;   } else {
;     n *= 3;
;     n++;
;   }
;   k++;
; }
; return k;

collatz:
  mov r8, 0   ; r8 = k = 0
  jmp condition

condition:
  cmp rdi, 1  ; rdi = n > 1
  ja while    ; n > 1: iterate
  jmp end     ; otherwise end

while:
  inc r8      ; k++
  mov r9, rdi ; r9 = rdi = n
  and r9, 1   ; check if even or odd
  cmp r9, 0   ; compare with 0
  je isEven   ; jump if equal -> isEven
  jmp notEven ; else jump -> notEven

isEven:
  mov rax, rdi
  mov rdx, 0    ; overflow protection
  mov rbx, 2
  div rbx       ; n /= 2
  mov rdi, rax 
  jmp condition ; next iteration
  
notEven:
  mov rax, rdi
  mov rbx, 3
  mul rbx       ; n *= 3
  mov rdi, rax
  inc rdi       ; n++
  jmp condition ; next iteration

end:
  mov rax, r8   ; return k
  ret

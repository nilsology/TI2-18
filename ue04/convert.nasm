global strToInt
global intToStr
  
section .text

strToInt:
  mov rax, 0              ; set initial total to 0

  cmp rsi, 1
  jle .done
  
  cmp rsi, 36
  jg .done
     
  .convert:
    movzx r10, byte [rdi]   ; get the current character
    test r10, r10           ; check for \0
    je .done
    
    cmp r10, 48             ; anything less than 0 is invalid
    jl .error
    
    cmp r10, 57             ; anything greater than 9 is invalid
    jg .error
      
    sub r10, 48             ; convert from ASCII to decimal 
    imul rax, rsi           ; multiply total by 10
    add rax, r10            ; add current digit to total
    
    inc rdi                 ; get the address of the next character
    jmp .convert

  .error:
    mov rax, -1             ; return -1 on error

  .done:
    ret                     ; return total or error code

intToStr:
  mov rax, rdi              ; use rdi for division
  xor r12, r12              ; initialize index
  xor rdx, rdx              ; set rdx to 0 for division

  .convert:
    push rdx
    xor rdx, rdx
    div rsi                 ; divide rax by base

    mov r10, rdx            ; store rest in r10
    add r10, 48             ; convert to ASCII

    pop rdx
    ;mov byte [rdx+r12], r10  ; store r10 in rdx array 
    inc r12

    cmp rax, 0
    je .done
    jg .convert
    
  .error:
    mov rax, -1
    ret

  .done:
    mov rdx, r8
    mov rax, r12
    ret

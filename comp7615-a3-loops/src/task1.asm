
section .data
    
    db 0x55
    db 0x55, 0x56, 0x57
    db 'a', 0x55
    db 'hello', 13, 10, '$'
    dw 0x1234
    dw 'a'
    dw 'ab'
    dw 'abc'
    dd 0x12345678
    dd 1.234567e20
    dq 0x123456789abcdef0
    dq 1.234567e20
    dt 1.234567e20

section .text
global main
main:
    
    
    
    
    ret
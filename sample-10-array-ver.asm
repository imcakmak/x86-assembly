org 0100h
.data
    numbers DW 0056h, 0042h, 0073h, 0089h, 0025h, 0016h, 0097h, 0038h, 0085h, 0022h
    length DW 10

.code
start:   
    mov ax, @data
    mov ds, ax
    mov cx, length
    
outer_loop:
    sub cx, 1
    jz exit
       
    mov bx, cx
    mov si, 0
    
inner_loop:
    sub bx, 1
    jz outer_loop    
    mov dx, [numbers + si]
    mov bp, [numbers + si + 2]
    cmp dx, bp
    jg swapper
    add si, 2
    jmp inner_loop
        
swapper:
    
    mov [numbers + si], bp
    mov [numbers + si + 2], dx
    add si, 2
    jmp inner_loop
    
exit:
    mov ax, 4c00h
    int 21h

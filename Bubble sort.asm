.data  
    Array DB  4,5,6,2,0,4,3,3,9,7,1,2
.code
     MAIN PROC near
     MOV AX, @DATA                 ; initialize DS
     MOV DS, AX                    
     mov cx,10
     mov si,offset Array
LBL0:
    dec cx
    cmp cx,00
    je  RES0
    mov bp,65535    ;FFFF 
LBL1:
    inc bp  
    cmp cx,bp
    jbe LBL0
    mov bl,[si+bp+1]
    cmp [si+bp ],bl
    ja  LBL1 
    mov bl,[si+bp+1]
    mov bh,[si+bp]
    mov [si+bp+1],bh 
    mov [si+bp ],bl                   
    jmp LBL1
RES0:      
    mov cx,10
RES1:  
    mov bl,[si] 
    add bl,48  
    mov dl, bl
    mov ah, 2
    int 21h
    inc si
    loop RES1
    MAIN ENDP
END MAIN    
ret






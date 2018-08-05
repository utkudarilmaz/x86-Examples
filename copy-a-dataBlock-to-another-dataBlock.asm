; multi-segment executable file template.

data segment
    veri DW "COMPUTER"
    hedef DW 8 DUP(?)
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:                    
    MOV AX,data             ; data segment tanimlamasi
    MOV DS,AX
    
    CLD                     ; yon soldan saga belirlendi
    
    MOV CX,07H              ; sayac
    MOV SI,OFFSET veri      ; veri tablosu source indise
    MOV DI,OFFSET hedef     ; hedef tablosu destination indise
                            ; atandi
    
    ; veri tablosunun hedef tablosuna kopyalandigi dongu
    copy:   mov ax,[si]
            mov [di],ax
            inc si
            inc di
            LOOPNZ copy
    
    
    int 21h    
ends

end start ; set entry point and stop the assembler.

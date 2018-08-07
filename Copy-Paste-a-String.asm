; Bir veri setinin başka bir adrese kopyalanmasini yapan program.

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
    MOV SI,OFFSET veri      ; Source = adress(veri)
    MOV DI,OFFSET hedef     ; Dest = address(hedef)

    ; Kaynak stringin hedef adrese kopyalandigi dongu
    copy:   mov ax,[si]
            mov [di],ax
            inc si
            inc di
            LOOPNZ copy


    int 21h
ends

end start ; set entry point and stop the assembler.

; Verilen Stringin terslenerek baska bir adrese kopylanmasi

data segment
    katar db "ELEKTRONIK"
    bos dd 10 dup (" ")
    hedef db 10 dup ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    lea si,katar
    lea di,hedef+9
    mov cx,10           ; Sayac = 10
    cld

    don: lodsb          ; mov al,[si], si = si + 1
         mov [di],al    ; al kaydedicisindeki verinin hedef adrese kopyalanmasi
         dec  di
         loop don       ; cx = cx -1, cx == 0 ? : don


    mov ax, 4c00h ; exit to operating system.
    int 21h
ends

end start ; set entry point and stop the assembler.

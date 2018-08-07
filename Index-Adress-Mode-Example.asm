; Verilen veri setindeki 2. indisteki sayiyi hedef adrese kopyalanmasi

data segment
    tablo DB 10,20,30,40,50
    veri DB ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax

    mov si,2

    mov bl,tablo[si]        ; tablo veri setinin 2. indisindeki verinin bl
                            ; kaydedicisine aktarilmasi
    lea di,veri             ; Hedef adres ayarlanmasi
    mov [di],bl             

    mov ax, 4c00h           ; exit to operating system.
    int 21h
ends

end start ; set entry point and stop the assembler.

; Verilen veri 10 adet veride kaç adet 1 biti oldugunu bulan program

data segment
    veri db 5,10,15,20,25,30,35,40,45,50
    hedef db ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax

    mov si,offset veri
    mov di,offset hedef        ; 1 bit sayisinin tutuldugu adres
    mov bl,10                  ; Genel sayac
    mov ax,0

; Program section
don: clc
     mov al,[si]
     mov cl,8       ; 8 bit sayaci

say: rol al,1       ; 1 bit sola kaydir
     jnc gec        ; Eğer elde yoksa -gec- kismina dal

     inc [di]

gec: dec cl
     jnz say        ; 8 bit tamamlanmadı ise -say- kismina dal

     inc si
     dec bl
     jnz don        ; 10 adet veri kontrol edilmedi ise devam et

    mov ax, 4c00h ; exit to operating system.
    int 21h
ends

end start ; set entry point and stop the assembler.

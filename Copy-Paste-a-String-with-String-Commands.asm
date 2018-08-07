; Copy-Paste isleminin string komutları ile gerçekleştirilmesi

data segment
    veri db "BILGISAYAR"
    alan db 10 dup(?)
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

    lea si,veri
    lea di,alan
    mov cx,10
    cld

    rep movsb           ; [si] --> Al , Al --> [di] , cx = cx-1 , si = si+1
                        ; di = di + 1

    mov ax, 4c00h ; exit to operating system.
    int 21h
ends

end start ; set entry point and stop the assembler.

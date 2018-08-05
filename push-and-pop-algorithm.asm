
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AX,010H  ;AX 0010H
PUSH AX      
MOV AX,01H   ;AX 0001H
POP AX       ;AX 0010H


ret





;Push and Pop komutlarının kullanım örnekleri

org 100h

MOV AX,010H  ;AX 0010H
PUSH AX
MOV AX,01H   ;AX 0001H
POP AX       ;AX 0010H


ret

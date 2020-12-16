; OPERACIONES BASICAS: SUMA, RESTA, MULTIPLICACION Y DIVISION
; PROGRAMA QUE REALIZA LAS OPERACIONES DE DOS NUMEROS ENTEROS

.model small
.stack 64
.data
  
; VARIABLES
numero1 db 0
numero2 db 0

opSuma db 0
opResta db 0
opMultiplicacion db 0
opDivision db 0

; ENTRADA DEL NUMERO 1
lecturaNumero1 db 10,13, "Ingresa el numero 1: ",'$'  

; ENTRADA DEL NUMERO 2
lecturaNumero2 db 10,13, "Ingresa el numero 2: ",'$'

; MENU DE OPCIONES
resultadoSuma db 10,13, "Suma: ",'$'
resultadoResta db 10,13, "Resta: ",'$'
resultadoMulti db 10,13, "Multiplicacion: ",'$'
resultadoDivis db 10,13, "Division: ",'$'  

.code
begin proc far
    
    mov ax, @data
    mov ds,ax

    
    ; SE SOLICITA EL PRIMER NUMERO ENTERO
    mov ah, 09
    lea dx, lecturaNumero1
    int 21h
    mov ah, 01
    int 21h
    sub al, 30h
    mov numero1,al
    
    ; SE SOLICITA EL SEGUNDO NUMERO ENTERO
    
    mov ah, 09
    lea dx, lecturaNumero2
    int 21h
    mov ah, 01
    int 21h
    sub al, 30h
    mov numero2,al
    
    ; OPERACIONES ARITMETICAS
                  
    ; SUMA             
    mov al,numero1
    add al,numero2
    mov opSuma,al  
    
    ; RESTA
    mov al,numero1
    sub al,numero2
    mov opResta,al
    
    ; MULTIPLICACION
    mov al,numero1
    mul numero2
    mov opMultiplicacion,al
    
    ; DIVISION
    mov al,numero1
    div numero2
    mov opDivision,al
     
       
    ; RESULTADOS DE LAS OPERACIONES
    
    ; SUMA
    mov ah,09
    lea dx,resultadoSuma
    int 21h
    mov dl,opSuma
    add dl,30h 
    mov ah,02
    int 21h  
    
    ;mostrando la resta
    mov ah,09
    lea dx,resultadoResta
    int 21h
    mov dl,opResta
    add dl,30h 
    mov ah,02
    int 21h
    
    ;mostrando la multiplicacion
    mov ah,09
    lea dx,resultadoMulti
    int 21h
    mov dl,opMultiplicacion
    add dl,30h 
    mov ah,02
    int 21h
    
    ;mostrando la division
    mov ah,09
    lea dx,resultadoDivis
    int 21h
    mov dl,opSuma
    add dl,30h 
    mov ah,02
    int 21h
              
    mov ah,4ch
    int 21h
    
    begin endp
end
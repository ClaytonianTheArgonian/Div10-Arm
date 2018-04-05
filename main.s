        .arch armv6
        .fpu  vfp

        .data
number: .word 0
fmt1:   .asciz "The number is %d\n"
        .align 2
fmt2:   .asciz "div10 yeilds quotient %d and remainder %d\n"
        .align 2

        .text
        .align 2
        .global main
        .type   main, %function

/***************************************************************
* main
*     This funcion tests div10 by dividing the 32-bit MaxInt by
*     10 repetedly until the quotient is 0. It will print the 
*     quotient and remainder for every division.
***************************************************************/

main:
    stmfd sp!, {fp, lr}
    mov   r0, #-1
    mov   r1, #1
    add   r0, r0, r1,LSL #31 @ create the 32-bit MaxInt
    ldr   r3, =number
    str   r0, [r3]      @store the number

while:
    ldr   r1, =number
    ldr   r1, [r1]      @retrieve the number for comparison
    cmp   r1, #0
    beq   endWhile      @if number== 0 exit loop
    ldr   r0, =fmt1
    bl    printf        @printf("The number is %d\n", number)

    ldr   r0, =number
    ldr   r0, [r0]
    bl    Div10         @Call Div10 on the number
    ldr   r3, =number
    str   r0, [r3]      @store quotient as the new number
    
    mov   r2, r1
    mov   r1, r0
    ldr   r0, =fmt2
    bl    printf     @printf("div10 yields quotient %d and remainder %d\n",
                     @       quotient, remainder)
    b     while
endWhile:

return:
    mov   r0, #0
    ldmfd sp!, {fp, pc}
    .end

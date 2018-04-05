            .arch       armv6
            .fpu        vfp
            .text
            .align      2
            .global     Div10
            .type       Div10, %function

Div10:
        push    {lr}            @ Preserve the return point 
        mov     r1,r0,lsr#1     @ Copy given parameter into r1
        mov     r2,r0           @ Copy given parameter into r2
        add     r0,r1,r0,lsr#2  @ Add sum of the two shifted nums into r0
        add     r0,r0,r0,lsr#4
        add     r0,r0,r0,lsr#8
        add     r0,r0,r0,lsr#16
        lsr     r0,#3           @ Calculate quotient
        mov     r1,r0,lsl#2
        add     r1,r1,r0
        sub     r1,r2,r1,lsl#1  @ Calculate remainder
        cmp     r1,#9
        bgt     math
        b       exit

math:   
        add     r0,r0,#1
        sub     r1,r1,#10
        b       exit

exit:
        pop     {lr}
        mov    pc,lr


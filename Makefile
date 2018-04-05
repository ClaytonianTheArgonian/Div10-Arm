lab08 :	main.o Div10.o
	gcc -gstabs+ -o lab08 main.o Div10.o

main.o:	main.s
	gcc -gstabs+ -c main.s

Div10.o : Div10.s
	gcc -gstabs+ -c Div10.s

listings : listing-main listing-Div10

listing-main :  main.s
	    gcc -c -gstabs+ -Wa,-alms,-L main.s > main.lst

listing-Div10 :  Div10.s
	    gcc -c -gstabs+ -Wa,-alms,-L Div10.s > Div10.lst

clean:
	rm -vf *.o *.lst lab08 .*swp



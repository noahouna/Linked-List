# Linked-List

A program that sorts a linked list of student's exam scores.

The LC-3 is an educational assembly language.

LC-3 ISA: Address space of 2^16, 8 general purpose registers, [15 instructions](http://users.ece.utexas.edu/~patt/19f.306/Handouts/LC3_Instruction_Set.pdf), 2's complement integer data type, 5 addressing modes.



Instructions to download the LC3 simulator can be found on [Professor Yale Patt's website](http://users.ece.utexas.edu/~patt/19f.306/software.html).

With LC3tools, convert all files to .obj by assembling to run

sortll.asm is an assembly implementation of the bubble sorting algorithm. The program sorts a linked list of exam scores with the first node at x3200 in memory and terminated by a null value (x0000). The program works on any linked list starting at x3200 with the exam scores being greater than or equal to 0.

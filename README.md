# Linked-List

A program that sorts a linked list of student's exam scores.

The LC-3 is an educational assembly language.

LC-3 ISA: Address space of 2^16, 8 general purpose registers, [15 instructions](http://users.ece.utexas.edu/~patt/19f.306/Handouts/LC3_Instruction_Set.pdf), 2's complement integer data type, 5 addressing modes.



Instructions to download the LC3 simulator can be found on [Professor Yale Patt's website](http://users.ece.utexas.edu/~patt/19f.306/software.html).

With LC3tools, convert all files to .obj by assembling to run

sortll.asm is an assembly implementation of the bubble sorting algorithm. The program sorts a linked list of student IDs by exam scores with the first node at x3200 in memory and terminated by a null value (x0000). The program works on any linked list starting at x3200 with the exam scores being greater than or equal to 0.

delete.asm takes an input student ID at x4000 and an input exam score at x4001 and searches the linked list for the student ID and matching exam score and deletes it from the linked list by pointing the previous node to the next node skipping the current node.

insertion.asm takes a new student ID at x4002 and an input exam score at x4003 and inserts the node into the linked list keeping the resulting linked list still sorted.

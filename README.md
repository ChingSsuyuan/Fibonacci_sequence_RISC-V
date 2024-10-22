# Fibonacci-sequence-RISC-V
## First Part:

Implement a Seq_array task to store an array starting at memory address 0x80. 

The listThe array should be initialized to contain the first 32 elements of the Fibonacci sequence:

Seq[0] = 0; Seq[1] = 1; Seq[i] = Seq[i-2] + Seq[i-1] for i > 1.

## Second Part:

Implement an Array_copy_encrypt task, such that elements of a new array beginning at memory address 0x00 are the encrypted values of the array in reverse order.

seq_encrypted[0] = FibSeq[31] ^ （key ） ; seq_encrypted[1] = FibSeq[30] ^ （key） ; etc.

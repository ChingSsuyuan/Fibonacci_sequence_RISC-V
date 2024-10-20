addi x1, x0, 0      #x1=Seq[0]=0
addi x2, x0, 1      #x2=Seq[1]=1
addi x3, x0, 0x80   #x3=0x80
sw   x1, 0(x3)      #store Seq[0] into address 0x80
addi x3, x3, 4      #0x80+8=0x84
sw   x2, 0(x3)      #store Seq[1] into address 0x84
addi x4, x0, 2      #Start x4=5
addi x5, x0, 32     #End x5=32
LOOP1:   
        beq x4,x5, END1  #if x4==x5, go to end
        add x6,x1,x2    #x6=Seq[i]=Seq[i-2]+Seq[i-1]
        addi x3, x3, 4  #move to the next memory location
        sw x6, 0(x3)    #store Seq[i] into the next address
        add x1, x0, x2  #update Seq[i-2]=Seq[i-1]
        add x2, x0, x6  #update Seq[i-1]=Seq[i]
        addi x4 ,x4, 1  #increase x4=x4+1
        jal x0, LOOP1   #go back to LOOP1

END1:
addi x4, x0, 0
addi x5, x0, 32
addi x3, x0, 0xfc # Address of the last element of the Fibonacci sequence
addi x2, x0, 0x00 # Starting address of the seq_encrypted array (0x00)
LOOP2:
                beq x5, x4, END2  #If all elements are processed, jump to END2
                lw x7, 0(x3)      #load seq[31] from the the address 0xfc
                xori x7, x7, 2002 #XOR the value with the encryption key (2002)
                sw x7,0(x2)       #store encrypted_seq[31] into address 0x00
                addi x5, x5, -1   #decrease x5 until x5=x4
                addi x3, x3, -4   #decrease load address
                addi x2, x2, 4    #increase store address
                beq x0, x0, LOOP2 #gp back to loop2
END2:
        nop
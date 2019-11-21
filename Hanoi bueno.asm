#Raúl Méndez 
#Hanoi Towers recursively

#Final IC: 5414 (5409 shortest)
#R: 1790
#I: 3368
#J: 256
#$sp bytes used: 32


.data
    #Prompt message for user input and finish message
    promptM: .asciiz "Enter the number of disks (n): " #asciiz implies a string; adds \n at the end
    doneM: .asciiz "\nDone!" 
  
.text
  addi $sp,$zero,268505084
    #Addresses shwon on the Data Segment visualizer in MARS
	addi $a1, $zero, 0x10010000	#Origin or A tower
	addi $a2, $zero, 0x10010020	#Auxiliar or B tower
    addi $a3, $zero, 0x10010040	#Destiny or C tower
	
    

    addi $s0, $zero, 3    #Stores input in s0: s0 = n 
	add $t0, $s0, $zero  	#Stores s0 in t0 in order for the functs to work with it (as temp var 0)
	add $t1, $zero, $zero	#Temporal value	1
	add $t2, $zero, $zero 	#Temporal value 2
    #(side note/comment: addi with 0 vs add with $zero seemed to have no impact on the final IC)

loadDisks: #Loads the n-1 disks onto aux tower

	sw $t0, 0($a1)			#Adds curent disk onto origin tower	
	addi $t0, $t0, -1		#Disks are now n-1
	
	addi $a1, $a1, 4		#Increments a1´s "pointer" to the next address (next space in origin tower)
	bne $t0, 0, loadDisks	#Loop: loads remaining disks until t0 = 0

	jal HanoiTower			#Copies current address to $ra and jumps to HanoiTower
	j done					#End of progam funct

HanoiTower:	#excecute	
	addi $sp, $sp, -4		#Takes 32 bits from sp = reserves 32 bits for $ra (for recursion) 
	sw $ra, 0($sp)			#Store $ra 

    #If equivalent: case case requirement if equivalent:
	beq $s0, 1, baseCase	#n = 1: goes to base case, else: continues with the code
	#-------------------------------------------------------------------------------------------------------------------				

#Step 1: origin-aux swap
    #Preparing data before next HanoiTower call
	addi $s0, $s0, -1		#n-1 (for s0 as a loop var)
	add $t1, $a2, $zero 	#Saves aux in a temp var
	add $a2, $a3, $zero  	#Swaps origin and aux disks
	add $a3, $t1, $zero  
    #Swaps values in order to take n-1 disks from origin to aux tower; 
    #a hanoiTower call for each n-1 disk

	jal HanoiTower			#Recursive call
    
#Step 2: auxiliar-destiny swap 
    #moving disks
	add $t0, $a3, $zero		#Saves destiny in temp var
	add $a3, $a2, $zero		#Swaps auxiliar and destiny
	add $a2, $t0, $zero
	
    #Moving origin to destiny
	addi $a1, $a1, -4	#Takes the disk from destiny
	lw $t3, 0($a1)		#Loads origin to temp var
	    sw $zero, 0($a1)	#Writes a 0 in disk´s past place, before moving it to destiny
	    sw $t3, 0($a3)  	#Saves address from origin to destiny
	    addi $a3, $a3, 4 	#Adds disk to next place in destiny tower
	
#Step 3: origin-destiny swap
	add $t1, $a1, $zero		#Save origin to a temporary variable
	add $a1, $a2, $zero		#Swap origin and destiny
	add $a2, $t1, $zero		
	
	addi $s0, $s0, -1		#n-1
	jal HanoiTower		#Recursive call
	
    #Recovering swaps to initial tower values
	add $t1, $a1, $zero
	add $a1, $a2, $zero
	add $a2, $t1, $zero

	lw $ra, 0($sp)			#Loads $ra back
	addi $sp, $sp, 4		#Gets the 32 bits back to sp
	
	addi $s0, $s0, 1		#We add the disk to n that was substracted before: n+1
	jr $ra				#Goes back to last HanoiTower call: "rewinding" process begins 		

baseCase:#BaseCase: Moves origin to destiny
    #Moving origin to destiny
	addi $a1, $a1, -4		#Takes disk from destiny
	lw $t3, 0($a1)			#Loads origin to temp var
	    sw $zero, 0($a1)		#Writes a 0 in disk´s past place, before moving it to destiny
	    sw $t3, 0($a3)  		#Saves address from origin to destiny
	    addi $a3, $a3, 4 		#Adds disk to next place in destiny tower
	
	addi $s0, $s0, 1		#Adds the disk back to n
	
    lw $ra, 0($sp)			#Loads $ra back
	addi $sp, $sp, 4		#Gets the 32 bits back to sp
	jr $ra					#Go back to last HanoiTower Call
	
done:
    #Displays finish message
    li $v0, 4 #Will print
    la $a0, doneM #Finish message
    syscall

    #End of Program equivalent
    li $v0, 10 #Signals success return
    syscall


    

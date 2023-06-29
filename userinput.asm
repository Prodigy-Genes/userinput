section .data
	prompt db "Input a message: ", 0ah ; Define a variable 'prompt' as a string containing the prompt message followed by a newline character (0ah).
	prompt_len equ $ - prompt ; Calculate the length of the 'prompt' string by subtracting its starting address from the current address.

section .bss
	user_input resb 64 ; Reserve 64 bytes of uninitialized memory for 'user_input'.

section .text
	global _start
_start:
	; Print the prompt
	mov rax, 1 ; Move the value 1 into the rax register, which represents the system call number for 'write'.
	mov rdi, 1 ; Move the value 1 into the rdi register, which represents the file descriptor for 'stdout'.
	mov rsi, prompt ; Move the memory address of the 'prompt' variable into the rsi register, which represents the buffer to be printed.
	mov rdx, prompt_len ; Move the length of the 'prompt' string into the rdx register, which represents the number of bytes to be printed.
	syscall ; Invoke the system call to print the 'prompt' message.

	; Read the input
	mov rax, 0 ; Move the value 0 into the rax register, which represents the system call number for 'read'.
	mov rdi, 0 ; Move the value 0 into the rdi register, which represents the file descriptor for 'stdin'.
	mov rsi, user_input ; Move the memory address of the 'user_input' buffer into the rsi register, which represents the destination of the input.
	mov rdx, 64 ; Move the maximum number of bytes to read into the rdx register.
	syscall ; Invoke the system call to read user input.

	; Print the output
	mov rax, 1 ; Move the value 1 into the rax register, which represents the system call number for 'write'.
	mov rdi, 1 ; Move the value 1 into the rdi register, which represents the file descriptor for 'stdout'.
	mov rsi, user_input ; Move the memory address of the 'user_input' buffer into the rsi register, which represents the buffer to be printed.
	mov rdx, 64 ; Move the number of bytes to be printed from 'user_input' into the rdx register.
	syscall ; Invoke the system call to print the user's input.

exit:
	mov rax, 60 ; Move the value 60 into the rax register, which represents the system call number for 'exit'.
	mov rdi, 0 ; Move the value 0 into the rdi register, which represents the exit status.
	syscall ; Invoke the system call to exit the program.


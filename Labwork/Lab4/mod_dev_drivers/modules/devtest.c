#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdbool.h>

int main() {
    unsigned int result;
	unsigned int read_i, read_j;
    int fd;     // File descriptor 
    int i, j;   // Loop variables
    
    char input = 0;
    
    // Open device file for reading and writing 
    // Use 'open' to open '/dev/multiplier'

	fd = open("/dev/multiplier", O_RDWR);
    
    // Handle error opening file 
    if(fd == -1) {
        printf("Failed to open device file!\n");
        return -1;
    }

	unsigned int *multiply = (unsigned int*)malloc(2 * sizeof(int)); // hold both multiplied values
	int* i_Buff = 0;						 // used to print the read values
	char* c_Buff = (char*)malloc(3 * sizeof(int));			 // read and store from /dev/multiplier
	bool quit = 0;							 // used to quit the program

printf("Type 'q' to quit\n\n\n");
	
while(!quit) {	
    for(i = 0; i <= 16; i++) {
        for(j = 0; j <= 16; j++) {
            // Write value to registers using char dev 
            // Use write to write i and j to peripheral 
            // Read i, j, and result using char dev
            // Use read to read from peripheral 
            // print unsigned ints to screen 

		multiply[0] = i; // place i into multiply 0
		multiply[1] = j; // place j into multiply 1
				
		write(fd, (char*)multiply, 2 * sizeof(int)); // write to /dev/mulitplier the values in multiply
		read(fd, c_Buff, 3 * sizeof(int));	     // read from what was just written
				
		i_Buff = (int*)c_Buff;
		read_i = i_Buff[0]; // i in mulitplication
		read_j = i_Buff[1]; // j in multiplication
		result = i_Buff[2]; // i * j = result

            printf("%u * %u = %u\n\r", read_i, read_j, result); // print the read values
                
            // Validate result 
            if(result == (i*j))
                printf("Result Correct!\n\n");
            else
                printf("Result Incorrect!\n\n");
                
            // Read from terminal 
            input = getchar();
            // Continue unless user entered 'q' 
            if(input == 'q') {
                close(fd);
                return 0;
            }
        }
    }
	if(getchar() == 'q') {quit = 1;} // used for better code reading
}
	free(multiply); // deallocate memory
	free(c_Buff);   // deallocate memory
	
    close(fd); // close dev/multiplier
    return 0;
}


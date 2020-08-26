#include <linux/module.h>   // Needed by all modules
#include <linux/kernel.h>   // Needed for KERN_* and printk
#include <linux/init.h>     // Needed for __init and __exit macros
#include <asm/io.h>         // Needed for IO reads and writes
#include "xparameters.h"    // Needed for IO reads and writes
#include <linux/ioport.h>   // Used for io memory allocation
#include <linux/moduleparam.h>	// Needed for module parameters
#include <linux/fs.h>		// Provides file ops structure
#include <asm/uaccess.h>	// Provides utilities to user space
#include <linux/sched.h>   /* Provides access to the "current" process task structure */
#include <linux/slab.h> //needed for kmalloc() and kfree()

#include "xparameters.h"
#include "xparameters_ps.h"



#define DEVICE_NAME "multiplier"
#define BUF_LEN 80

int init_module(void);
void cleanup_module(void);
static int device_open(struct inode *, struct file *);
static int device_release(struct inode *, struct file *);
static ssize_t device_read(struct file *, char *, size_t, loff_t *);
static ssize_t device_write(struct file *, const char *, size_t, loff_t *);

// Major number assigned to the device driver
static int Major;
// virtual address pointing to multiplier
void* virt_addr;

/* This structure defines the function pointers to our functions for
   opening, closing, reading and writing the device file.  There are
   lots of other pointers in this structure which we are not using,
   see the whole definition in linux/fs.h */
static struct file_operations fops = {
  .read = device_read,
  .write = device_write,
  .open = device_open,
  .release = device_release
};

// From xparameters.h, physical address of multiplier
#define PHY_ADDR XPAR_MULTIPLY_0_S00_AXI_BASEADDR 
// Size of physical address range for multiply
#define MEMSIZE XPAR_MULTIPLY_0_S00_AXI_HIGHADDR - XPAR_MULTIPLY_0_S00_AXI_BASEADDR + 1




int my_init(void)
{
	printk(KERN_INFO "Mapping virtual address...\n");
	// ioremap to map physical address to virtual address
	virt_addr = ioremap(PHY_ADDR, MEMSIZE);

	printk(KERN_INFO "Physical Address = %x\n", PHY_ADDR); //Print physical address
	printk(KERN_INFO "Virtual Address = %x\n", virt_addr); //Print virtual address

	/* This function call registers a device and returns a major number
	associated with it.  Be wary, the device file could be accessed
	as soon as you register it, make sure anything you need (ie
	buffers ect) are setup _BEFORE_ you register the device.*/
	Major = register_chrdev(0, DEVICE_NAME, &fops);

	/* Negative values indicate a problem */
	if (Major < 0) {
		printk(KERN_ALERT "Registration of Device has failed, Major: %d\n", Major);
		return Major;
	}

	printk(KERN_INFO "Registered a device with dynamic Major number of %d\n", Major);
	printk(KERN_INFO "Create a device file for this device with this command:\n'mknod /dev/%s c %d 0'.\n", DEVICE_NAME, Major);

	return 0;		/* success */
  }

/*
 * This function is called when the module is unloaded, it releases
 * the device file.
 */
void my_cleanup(void)
{
  /* 
   * Unregister the device 
   */
  unregister_chrdev(Major, DEVICE_NAME);
  printk(KERN_ALERT "unmapping virtual address space...\n");
  iounmap((void*)virt_addr);		/* free our memory (note the ordering here) */
}

/* 
 * Called when a process tries to open the device file, like "cat
 * /dev/my_chardev_mem".  Link to this function placed in file operations
 * structure for our device file.
 */
static int device_open(struct inode *inode, struct file *file)
{
	printk(KERN_ALERT "Device opened...\n");
	return 0;
}

/* 
 * Called when a process closes the device file.
 */
static int device_release(struct inode *inode, struct file *file)
{	
	printk(KERN_ALERT "Device closed...\n");
	return 0;
}

/*
* Called when a process, which already opened the dev file, attempts
* to read from it.
*/
/* 
 * Called when a process, which already opened the dev file, attempts to
 * read from it.
 */
static ssize_t device_read(struct file *filp,	/* see include/linux/fs.h   */
			   char *buffer,	/* buffer to fill with data */
			   size_t length,	/* length of the buffer     */
			   loff_t * offset)
{
	/*
	* Number of bytes actually written to the buffer
	*/
	int bytes_read = 0;
	int i;
	//allocating kernel buffer (not all may be written to user space though)
	int* tempKBuffer = (int*)kmalloc(length * sizeof(int), GFP_KERNEL);

	// Error checking
	if (tempKBuffer == NULL)
	{
		printk(KERN_ALERT "Unable to allocate memory for Buffer...\n");
	}

	printk("Read (%d) from register (0)\n", ioread32(virt_addr + 0)); /* Read from registers */
 	printk("Read (%d) from register (1)\n", ioread32(virt_addr + 4));
  	printk("Read (%d) from register (2)\n", ioread32(virt_addr + 8));	

	tempKBuffer[0] = ioread32(virt_addr);
	tempKBuffer[1] = ioread32(virt_addr + 4);
	tempKBuffer[2] = ioread32(virt_addr + 8);
	char* tempBuff = (char*)tempKBuffer; //bytes will be written one at a time
	/*
	* Actually put the data into the buffer
	*/
	for (i = 0; i < length; i++) { //a while loop messes everything up
		/*
		* The buffer is in the user data segment, not the kernel segment
		* so "*" assignment won't work.  We have to use put_user which
		* copies data from the kernel data segment to the user data
		* segment.
		*/
		put_user(*(tempBuff++), buffer++); /* one char at a time... */

		bytes_read++;
	}
	kfree(tempKBuffer);
	/*
	* Most read functions return the number of bytes put into the
	* buffer
	*/
	return bytes_read;
}

/* 
 * This function is called when somebody tries to write into our
 * device file.
 */
static ssize_t device_write(struct file *file, const char __user * buffer, size_t length, loff_t * offset)
{
	char* tempKBuffer = (char*)kmalloc(length * sizeof(char), GFP_KERNEL);
	int i;

  
	  /* printk(KERN_INFO "device_write(%p,%s,%d)", file, buffer, (int)length); */
  
	  /* get_user pulls message from userspace into kernel space */
	for (i = 0; i < length; i++)
	{
		get_user(tempKBuffer[i], buffer++);
	}

	tempKBuffer[length] = '\0';
	int* tempBuff = (int*)tempKBuffer;

	printk(KERN_INFO "Writing a (%d) to register (0)\n", tempBuff[0]);
	iowrite32(tempBuff[0], virt_addr + 0);

	printk(KERN_INFO "Writing a (%d) to register (1)\n", tempBuff[0]);
	iowrite32(tempBuff[1], virt_addr + 4);

	kfree(tempBuff);

  /* 
   * Again, return the number of input characters used 
   */
  return i;
}


/* These define info that can be displayed by modinfo */
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Dilanka Weerasinghe w/ Paul Gratz and others");
MODULE_DESCRIPTION("Module which creates a character device and allows user interaction with it");

/* Here we define which functions we want to use for initialization
and cleanup */
module_init(my_init);
module_exit(my_cleanup);

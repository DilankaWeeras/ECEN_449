#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

static int __init rickroll_init(void) {
    printk(KERN_LOG "Rickroll modul has been loaded\n");
    return 0;
}

static int __exit rickroll_exit(void) {
    printk(KERN_LOG "Rickroll modul has been loaded\n");


}

module_init(rickroll_init);
module_exit(rickroll_exit);

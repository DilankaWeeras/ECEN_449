#include <xparameters.h>
#include <xgpio.h>
#include <xstatus.h>
#include <xil_printf.h>

#define led XPAR_LED_DEVICE_ID
#define btns XPAR_BTN_SW_DEVICE_ID
#define WAIT_VAL 10000000

int delay(void);

int main()
{
	int count;
	int count_masked;

	int dips;
	int dips_masked;

	XGpio leds;
	XGpio btn_sw;
	int status;

	status = XGpio_Initialize(&leds ,led) && XGpio_Initialize(&btn_sw ,btns);
	XGpio_SetDataDirection(&leds ,1, 0);
	XGpio_SetDataDirection(&btn_sw , 1, 1);

	if(status != XST_SUCCESS)
	{
		xil_printf(" Initialization failed ");
	}
	count = 0;
	xil_printf("start\n\n");
	while(1)
	{
		if((0x1 & XGpio_DiscreteRead(&btn_sw,1)) == 0x1) // if button zero is pressed must have the bitwise and to only check the lowest bit of the case
		{
			count++; // increment count
			count_masked = count & 0xF; // assign count_masked to the lower 4 bits of count
			xil_printf("Value of count = 0x%x\n\r", count_masked); // print count in hex

			XGpio_DiscreteWrite(&leds, 1, count_masked); // write the lower 4 bits of count to the leds
		}
		else if((0x2 & XGpio_DiscreteRead(&btn_sw,1)) == 0x2) // if button 2 is pressed
		{
			count--; // decrement count
			count_masked = count & 0xF; // assign count_masked to the lower 4 bits of count
			xil_printf("Value of count = 0x%x\n\r", count_masked); // print count in hex

			XGpio_DiscreteWrite(&leds, 1, count_masked); // write to the leds
		}
		else if((0x4 & XGpio_DiscreteRead(&btn_sw,1)) == 0x8) // if button 4 is pressed
		{
			count_masked = count & 0xF; // reassign count_masked (really wont do anything)
			xil_printf("Value of count = 0x%x\n\r", count_masked); // print count_masked

			dips = XGpio_DiscreteRead(&btn_sw, 1) && 0x1E0; // read the higher 4 bits of the btn_sw and put into the dips
			dips_masked = dips & 0xF;

			xil_printf("Value of dips  = 0x%x\n\r", dips_masked);

			XGpio_DiscreteWrite(&leds, 1, dips_masked);
		}
		else // No buttons are pressed
		{
			count_masked = count & 0xF;
			xil_printf("Count no change = 0x%x\n\r", count_masked);
		}
		
		delay();
	}
	return(0);
}

int delay(void)
{
	volatile int delay_count = 0;
	while(delay_count < WAIT_VAL)
	{
		delay_count++;
	}
	return (0);
}
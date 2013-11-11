//|     PWM generator module for CSUS Senior Design
//|
//|     Author: David Larribas
//|
//|     This module generates a variable duty cycle PWM signal at about 370khz to
//|			control the bicycle's motor. It it parametized to include a variable offset
//|			that can adjust the floor of the modules response.
//|


//| Uncomment the `include "debug.sv" to enter debug mode on this module.
//| Uncomment the `include "timescale.sv" to run a simulation.
//`include "debug.sv"
//`include "timescale.sv"

module motorPWMGenerator(
	input 								CLOCK_50, 	//| Clock of 50mhz from the De0-Nano Board
	input 	wire 	[9:0] 	PWMinput,		//| 10 Bit input from the filter module. Depends on the accelerometer data.
	output 	reg 					PWMout			//| The PWM output the the Motor Controller.
);

	//| This is an offset for the PWM output. The motor requires around 60% duty cycle to
	//| start running smoothly. This will depend on the cycle time of the PWM.
	parameter 		Offset = 250;
	

	//| These deal with the timing of the PWM output. CLOCKslow slows down
	reg 		[3:0]		CLOCKslow =0;
	reg 		[15:0] 	COUNT = 0;

	//| Clock divider for output signal
	always @ (posedge CLOCK_50) CLOCKslow= CLOCKslow + 4'd1;
		

	//| Output signal generator
	always @(posedge CLOCKslow[3])
		begin
			//increment output generator
			COUNT = COUNT + 16'd1;

			//|If PWM input is a positive value, then send signal to motor.
			if(PWMinput > 0)
				if(COUNT < PWMinput + Offset)PWMout=1;
				else PWMout=0;
			else PWMout=0;	
			

			//| Reset counter at overflow
			if(COUNT>=530)COUNT=0;
		end
endmodule
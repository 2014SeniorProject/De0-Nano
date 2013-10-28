//|     Top Level module for CSUS Senior Design
//|
//|     Author: Ben Smith and Devin Moore
//|
//|     This is the top level module for Project Forward. It instantiates modules to
//|			control the motor, communicate with the cellphone application, and the various
//|			sensors required to perform it's tasks.
//|
`timescale 10 ns / 1 ns

module ProjectForward_TOP(
	input							CLOCK_50,		//This is the system clock that comes in at 50mhz

	output 		[7:0]		LED,				//This is a register that is used to show the data that was read from the EEPROM in binary.

	input 						KEY,				//This is an input from both of the buttons on board the De0-Nano

	inout			wire 		GPIO_10,		//IMU I2C Clock line
	inout			wire		GPIO_11,		//IMU I2C Data Line

	output						G_Sensor_CS_N,	//CS line for accelerometer held high for I2C mode
	output 		wire 		PWMout,
	output 		wire 		waveFormsPin

);

	//|
	//| Local reg/wire declarations
	//|--------------------------------------------

	//| Accelerometer
	wire 		[9:0]		AccelX;
	wire 		[9:0]		AccelY;
	wire 		[9:0]		AccelZ;

	//| Gyroscope
	wire 		[9:0]		GyroX;
	wire 		[9:0]		GyroY;
	wire 		[9:0]		GyroZ;

	//| Filtered Accelerometer
	wire 		[9:0]		FAccelX;
	wire 		[9:0]		FAccelY;
	wire 		[9:0]		FAccelZ;

	//| Filtered Gyroscope
	wire 		[9:0]		FGyroX;
	wire 		[9:0]		FGyroY;
	wire 		[9:0]		FGyroZ;
	
	//| IMU data trigger
	wire						IMUDataReady;

	//| Motor output
	wire 		[9:0]		PWMinput;

	wire						LowPassDataReady;
	wire						HighPassDataReady;
	
	//|
	//| IMU-I2C controller module
	//|--------------------------------------------
	IMUInterface IMU(
	.CLOCK_50(CLOCK_50),
	.I2C_SCL(GPIO_10),
	.I2C_SDA(GPIO_11),
	.G_Sensor_CS_N(G_Sensor_CS_N),
	.AccelX(AccelX),
	.AccelY(AccelY),
	.AccelZ(AccelZ),
	.GyroX(GyroX),
	.GyroY(GyroY),
	.GyroZ(GyroZ),
	.DataValid(IMUDataReady)
	);
	
	//|
	//| IMU Filtering modules
	//|--------------------------------------------
	LowPassFilter AccelerometerFilter(
		.ReadDone(IMUDataReady),
		
		.AccelX(AccelX),
		.AccelY(AccelY),
		.AccelZ(AccelZ),
	
		.AccelXOut(FAccelX),
		.AccelYOut(FAccelY),
		.AccelZOut(FAccelZ),
		
		.DataReady(LowPassDataReady)
	);
	
	HighPassFilter GyroscopeFilter(
		.ReadDone(IMUDataReady),
		
		.GyroX(GyroX),
		.GyroY(GyroY),
		.GyroZ(GyroZ),
	
		.GyroXOut(FGyroX),
		.GyroYOut(FGyroY),
		.GyroZOut(FGyroZ),
		
		.DataReady(HighPassDataReady)
	);

	SensorFusion InclanationCalculator(
		.DataReady(HighPassDataReady && LowPassDataReady),
		.Accel1(AccelY),
		.Accel2(AccelZ),
		.Gyro(FAccelY),

		.resolvedAngle(PWMinput)
  );
	
	//|
	//| IMU LED visualization
	//|--------------------------------------------
		PWMGenerator #(
		.Offset(0),
		.pNegEnable(1)
	)AccelAngleLED(
		.CLOCK_50(CLOCK_50),
		.PWMinput(PWMinput),
		.PWMout(LED[7])
		);
		
	PWMGenerator #(
		.Offset(0),
		.pNegEnable(1)
	)AccelXLED(
		.CLOCK_50(CLOCK_50),
		.PWMinput(AccelX),
		.PWMout(LED[0])
		);

		PWMGenerator #(
		.Offset(0),
		.pNegEnable(1)
	)AccelYLED(
		.CLOCK_50(CLOCK_50),
		.PWMinput(AccelY),
		.PWMout(LED[1])
		);

		PWMGenerator #(
		.Offset(0),
		.pNegEnable(1)
	)AccelZLED(
		.CLOCK_50(CLOCK_50),
		.PWMinput(AccelZ),
		.PWMout(LED[2])
		);

		PWMGenerator #(
		.Offset(0),
		.pNegEnable(1)
	)GyroXLED(
		.CLOCK_50(CLOCK_50),
		.PWMinput(GyroX),
		.PWMout(LED[3])
		);

		PWMGenerator #(
		.Offset(0),
		.pNegEnable(1)
	)GyroYLED(
		.CLOCK_50(CLOCK_50),
		.PWMinput(GyroY),
		.PWMout(LED[4])
		);

		PWMGenerator #(
		.Offset(0),
		.pNegEnable(1)
	)GyroZLED(
		.CLOCK_50(CLOCK_50),
		.PWMinput(GyroZ),
		.PWMout(LED[5])
		);
endmodule






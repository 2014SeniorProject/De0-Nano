parameter SampleTime = 1;//multiplied by 100

module SensorFusion(
  input wire        DataReady,
  input wire  [9:0] Accel1,
  input wire  [9:0] Accel2,
  input wire  [9:0] Gyro,

  output reg  [9:0] resolvedAngle
  );

  //|
  //| Local registers and wires
  //|--------------------------------------------
  reg   [9:0]   Angle = 0;
  reg   [9:0]   AccelerometerAngle =0;

  //|
  //| Main logic
  //|--------------------------------------------
  always@ (posedge DataReady)
    begin: AngleCalculation

      //| Divide magnitudes for inverse tangent function
      AccelerometerAngle = Accel1/Accel2;

      //| Taylor series expansion for inverse tangent
      AccelerometerAngle = AccelerometerAngle - (AccelerometerAngle^3)/3;

      Angle = ((98)*(Angle + (Gyro/195)*SampleTime))/100 + ((20)*(AccelerometerAngle))/1000;
    end

	SensorFusionProbe	SensorFusionProbe_inst (.probe(Angle));

endmodule
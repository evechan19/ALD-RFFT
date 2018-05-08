module rfft (
	Clk, Reset_n
	done

);

parameter WIDTH = 32;
parameter LIMIT = 66; //64 + say 2 need to count delay

input 				Clk;
input 				Reset_n;
output 		reg		done;

reg				fin;
reg 		[3 : 0]		stage;
reg 		[6 : 0]		counter;


wire		[5 : 0]		addr		[0 : 1];
reg		[WIDTH - 1 : 0]	ram_in		[0 : 3];
wire		[WIDTH - 1 : 0] ram_out		[0 : 3];
reg				we 		[0 : 3];

wire 		[5 : 0] 	tf_addr;
wire		[WIDTH - 1 : 0]	tf_out;

reg				bypass_n;
wire		[WIDTH - 1 : 0] in 		[0 : 3];
wire		[WIDTH - 1 : 0] out 		[0 : 3];


bram ram0(.Clk(Clk), .En(1'b1), .We(we[0]), .Addr_A(addr[0]), .DI_A(ram_in[0]), .DO_A(ram_out[0]));
bram ram1(.Clk(Clk), .En(1'b1), .We(we[1]), .Addr_A(addr[0]), .DI_A(ram_in[1]), .DO_A(ram_out[1]));
bram ram2(.Clk(Clk), .En(1'b1), .We(we[2]), .Addr_A(addr[1]), .DI_A(ram_in[2]), .DO_A(ram_out[2]));
bram ram3(.Clk(Clk), .En(1'b1), .We(we[3]), .Addr_A(addr[1]), .DI_A(ram_in[3]), .DO_A(ram_out[3]));

bram tfram(.Clk(Clk), .En(1'b1), .We(1'b0), .Addr_A(tf_addr), .DI_A(0), .DO_A(tf_out));

pe pe0 (
	.Clk(Clk), .Reset_n(Reset_n),
	.in0(in[0]), .in1(in[1]), .in2(in[2]), .in3(in[3]), 
	.in0(in[0]), .in1(in[1]), .in2(in[2]), .in3(in[3]), 
	.tf(tf_out), .bypass_n(bypass_n);
	);


always @ (posedge Clk)
	begin 
	if (Reset_n == 1'b0 || counter == LIMIT)
		counter <= 0;
	else	
		counter <= counter + 1'b1;
	end

always @ (posedge Clk)
	begin 
	if (Reset_n == 1'b0 )
		stage <= 0;
	else if (counter == LIMIT)	
		stage <= stage + 1'b1;
	else 
		stage <= stage;
	end

assign addr[0] = (stage == 3'd7) ? 0 : counter[5 : 0];
always @ (*)
	begin
	case (stage)
		3'd0:
			addr[1] = counter[5:0];
		3'd1:
			addr[1] = { ~counter[5] : couter[4:0]}; 
		3'd2:
			addr[1] = { ~counter[5:4] : couter[3:0]}; 
		3'd3:
			addr[1] = { ~counter[5:3] : couter[2:0]}; 
		3'd4:
			addr[1] = { ~counter[5:2] : couter[1:0]}; 
		3'd5:
			addr[1] = { ~counter[5:1] : couter[0]}; 
		3'd6:
			addr[1] = ~counter[5:0]; 
		3'd7:
			addr[1] = 0;

	end

always @ (*)
	begin
	case (stage)
		3'd0:
		begin
			in[0] = ram_out[0];
			in[1] = ram_out[2];
			in[2] = ram_out[1];
			in[3] = ram_out[3];
		end
		3'd1:
		begin
			in[0] = (couter[5]) ? ram_out[2] : ram_out[0];
			in[1] = (couter[5]) ? ram_out[0] : ram_out[1];
			in[2] = (couter[5]) ? ram_out[3] : ram_out[2];
			in[3] = (couter[5]) ? ram_out[1] : ram_out[3];
		end
		3'd2:
		begin
			in[0] = (couter[5:4] == 2'b0) ? ram_out[0] : (couter[4]) ? ram_out[2] : ram_out[0];
			in[1] = (couter[5:4] == 2'b0) ? ram_out[1] : (couter[4]) ? ram_out[0] : ram_out[2];
			in[2] = (couter[5:4] == 2'b0) ? ram_out[2] : (couter[4]) ? ram_out[3] : ram_out[1];
			in[3] = (couter[5:4] == 2'b0) ? ram_out[3] : (couter[4]) ? ram_out[1] : ram_out[3];
		end
		3'd3:
		begin
			in[0] = (couter[5:3] == 2'b0) ? ram_out[0] : (couter[3]) ? ram_out[2] : ram_out[0];
			in[1] = (couter[5:3] == 2'b0) ? ram_out[1] : (couter[3]) ? ram_out[0] : ram_out[2];
			in[2] = (couter[5:3] == 2'b0) ? ram_out[2] : (couter[3]) ? ram_out[3] : ram_out[1];
			in[3] = (couter[5:3] == 2'b0) ? ram_out[3] : (couter[3]) ? ram_out[1] : ram_out[3];
		end
		3'd4:
		begin
			in[0] = (couter[5:2] == 2'b0) ? ram_out[0] : (couter[2]) ? ram_out[2] : ram_out[0];
			in[1] = (couter[5:2] == 2'b0) ? ram_out[1] : (couter[2]) ? ram_out[0] : ram_out[2];
			in[2] = (couter[5:2] == 2'b0) ? ram_out[2] : (couter[2]) ? ram_out[3] : ram_out[1];
			in[3] = (couter[5:2] == 2'b0) ? ram_out[3] : (couter[2]) ? ram_out[1] : ram_out[3];
		end
		3'd5:
		begin
			in[0] = (couter[5:1] == 2'b0) ? ram_out[0] : (couter[1]) ? ram_out[2] : ram_out[0];
			in[1] = (couter[5:1] == 2'b0) ? ram_out[1] : (couter[1]) ? ram_out[0] : ram_out[2];
			in[2] = (couter[5:1] == 2'b0) ? ram_out[2] : (couter[1]) ? ram_out[3] : ram_out[1];
			in[3] = (couter[5:1] == 2'b0) ? ram_out[3] : (couter[1]) ? ram_out[1] : ram_out[3];
		end
		3'd6:
		begin
			in[0] = (couter[5:0] == 2'b0) ? ram_out[0] : (couter[0]) ? ram_out[2] : ram_out[0];
			in[1] = (couter[5:0] == 2'b0) ? ram_out[1] : (couter[0]) ? ram_out[0] : ram_out[2];
			in[2] = (couter[5:0] == 2'b0) ? ram_out[2] : (couter[0]) ? ram_out[3] : ram_out[1];
			in[3] = (couter[5:0] == 2'b0) ? ram_out[3] : (couter[0]) ? ram_out[1] : ram_out[3];
		end
		3'd7:
		begin
			in[0] = ram_out[0];
			in[1] = ram_out[1];
			in[2] = ram_out[2];
			in[3] = ram_out[3];
		end

always @ (*)
	begin
	case (stage)
		3'd0:
		begin
			ram_in[0] = (counter[5]) ? out[2] : out[0];
			ram_in[1] = (counter[5]) ? out[3] : out[1];
			ram_in[2] = (counter[5]) ? out[0] : out[2];
			ram_in[3] = (counter[5]) ? out[1] : out[3];
		end
		3'd1:
		begin
			ram_in[0] = (counter[4]) ? out[2] : out[0];
			ram_in[1] = (counter[4]) ? out[3] : out[1];
			ram_in[2] = (counter[4]) ? out[0] : out[2];
			ram_in[3] = (counter[4]) ? out[1] : out[3];
		end
		3'd2:
		begin
			ram_in[0] = (counter[3]) ? out[2] : out[0];
			ram_in[1] = (counter[3]) ? out[3] : out[1];
			ram_in[2] = (counter[3]) ? out[0] : out[2];
			ram_in[3] = (counter[3]) ? out[1] : out[3];
		end
		3'd3:
		begin
			ram_in[0] = (counter[2]) ? out[2] : out[0];
			ram_in[1] = (counter[2]) ? out[3] : out[1];
			ram_in[2] = (counter[2]) ? out[0] : out[2];
			ram_in[3] = (counter[2]) ? out[1] : out[3];
		end
		3'd4:
		begin
			ram_in[0] = (counter[1]) ? out[2] : out[0];
			ram_in[1] = (counter[1]) ? out[3] : out[1];
			ram_in[2] = (counter[1]) ? out[0] : out[2];
			ram_in[3] = (counter[1]) ? out[1] : out[3];
		end
		3'd5:
		begin
			ram_in[0] = (counter[0]) ? out[2] : out[0];
			ram_in[1] = (counter[0]) ? out[3] : out[1];
			ram_in[2] = (counter[0]) ? out[0] : out[2];
			ram_in[3] = (counter[0]) ? out[1] : out[3];
		end
		3'd6:
		begin
			ram_in[0] = out[0];
			ram_in[1] = out[1];
			ram_in[2] = out[2];
			ram_in[3] = out[3];
		end
		3'd7:
		begin
			ram_in[0] = out[0];
			ram_in[1] = out[1];
			ram_in[2] = out[2];
			ram_in[3] = out[3];
		end
	end


endmodule


`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:37:05 03/10/2017 
// Design Name: 
// Module Name:    bram_dual 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bram_duel_T(
	Clk, En, We_A, Addr_A,  DI_A,  DO_A, We_B, Addr_B,  DI_B,  DO_B
    );
parameter WIDTH = 16;

input 		Clk;
input 		En;
input 		We_A;
input		We_B;
input 		[7 : 0]		Addr_A;

input 		[2 * WIDTH - 1 : 0]	DI_A;
output 		[2 * WIDTH - 1 : 0]	DO_A;
reg	 	[2 * WIDTH - 1 : 0]	DO_A;

input 		[7 : 0]		Addr_B;

input 		[2 * WIDTH - 1 : 0]	DI_B;
output 		[2 * WIDTH - 1 : 0]	DO_B;
reg	 	[2 * WIDTH - 1 : 0]	DO_B;

reg 		[2 * WIDTH - 1 : 0]	ram 	 [0 : 255];

initial begin
ram[ 0 ]= 32'b 00000001000000000000000000000000;
ram[ 1 ]= 32'b 00000000111111110000000000000110;
ram[ 2 ]= 32'b 00000000111111110000000000001100;
ram[ 3 ]= 32'b 00000000111111110000000000010010;
ram[ 4 ]= 32'b 00000000111111100000000000011001;
ram[ 5 ]= 32'b 00000000111111100000000000011111;
ram[ 6 ]= 32'b 00000000111111010000000000100101;
ram[ 7 ]= 32'b 00000000111111000000000000101011;
ram[ 8 ]= 32'b 00000000111110110000000000110001;
ram[ 9 ]= 32'b 00000000111110010000000000111000;
ram[ 10 ]= 32'b 00000000111110000000000000111110;
ram[ 11 ]= 32'b 00000000111101100000000001000100;
ram[ 12 ]= 32'b 00000000111101000000000001001010;
ram[ 13 ]= 32'b 00000000111100110000000001010000;
ram[ 14 ]= 32'b 00000000111100010000000001010110;
ram[ 15 ]= 32'b 00000000111011100000000001011100;
ram[ 16 ]= 32'b 00000000111011000000000001100001;
ram[ 17 ]= 32'b 00000000111010100000000001100111;
ram[ 18 ]= 32'b 00000000111001110000000001101101;
ram[ 19 ]= 32'b 00000000111001000000000001110011;
ram[ 20 ]= 32'b 00000000111000010000000001111000;
ram[ 21 ]= 32'b 00000000110111100000000001111110;
ram[ 22 ]= 32'b 00000000110110110000000010000011;
ram[ 23 ]= 32'b 00000000110110000000000010001000;
ram[ 24 ]= 32'b 00000000110101000000000010001110;
ram[ 25 ]= 32'b 00000000110100010000000010010011;
ram[ 26 ]= 32'b 00000000110011010000000010011000;
ram[ 27 ]= 32'b 00000000110010010000000010011101;
ram[ 28 ]= 32'b 00000000110001010000000010100010;
ram[ 29 ]= 32'b 00000000110000010000000010100111;
ram[ 30 ]= 32'b 00000000101111010000000010101011;
ram[ 31 ]= 32'b 00000000101110010000000010110000;
ram[ 32 ]= 32'b 00000000101101010000000010110101;
ram[ 33 ]= 32'b 00000000101100000000000010111001;
ram[ 34 ]= 32'b 00000000101010110000000010111101;
ram[ 35 ]= 32'b 00000000101001110000000011000001;
ram[ 36 ]= 32'b 00000000101000100000000011000101;
ram[ 37 ]= 32'b 00000000100111010000000011001001;
ram[ 38 ]= 32'b 00000000100110000000000011001101;
ram[ 39 ]= 32'b 00000000100100110000000011010001;
ram[ 40 ]= 32'b 00000000100011100000000011010100;
ram[ 41 ]= 32'b 00000000100010000000000011011000;
ram[ 42 ]= 32'b 00000000100000110000000011011011;
ram[ 43 ]= 32'b 00000000011111100000000011011110;
ram[ 44 ]= 32'b 00000000011110000000000011100001;
ram[ 45 ]= 32'b 00000000011100110000000011100100;
ram[ 46 ]= 32'b 00000000011011010000000011100111;
ram[ 47 ]= 32'b 00000000011001110000000011101010;
ram[ 48 ]= 32'b 00000000011000010000000011101100;
ram[ 49 ]= 32'b 00000000010111000000000011101110;
ram[ 50 ]= 32'b 00000000010101100000000011110001;
ram[ 51 ]= 32'b 00000000010100000000000011110011;
ram[ 52 ]= 32'b 00000000010010100000000011110100;
ram[ 53 ]= 32'b 00000000010001000000000011110110;
ram[ 54 ]= 32'b 00000000001111100000000011111000;
ram[ 55 ]= 32'b 00000000001110000000000011111001;
ram[ 56 ]= 32'b 00000000001100010000000011111011;
ram[ 57 ]= 32'b 00000000001010110000000011111100;
ram[ 58 ]= 32'b 00000000001001010000000011111101;
ram[ 59 ]= 32'b 00000000000111110000000011111110;
ram[ 60 ]= 32'b 00000000000110010000000011111110;
ram[ 61 ]= 32'b 00000000000100100000000011111111;
ram[ 62 ]= 32'b 00000000000011000000000011111111;
ram[ 63 ]= 32'b 00000000000001100000000011111111;
ram[ 64 ]= 32'b 00000000000000000000000100000000;
ram[ 65 ]= 32'b 10000000111110010000000011111111;
ram[ 66 ]= 32'b 10000000111100110000000011111111;
ram[ 67 ]= 32'b 10000000111011010000000011111111;
ram[ 68 ]= 32'b 10000000111001100000000011111110;
ram[ 69 ]= 32'b 10000000111000000000000011111110;
ram[ 70 ]= 32'b 10000000110110100000000011111101;
ram[ 71 ]= 32'b 10000000110101000000000011111100;
ram[ 72 ]= 32'b 10000000110011100000000011111011;
ram[ 73 ]= 32'b 10000000110001110000000011111001;
ram[ 74 ]= 32'b 10000000110000010000000011111000;
ram[ 75 ]= 32'b 10000000101110110000000011110110;
ram[ 76 ]= 32'b 10000000101101010000000011110100;
ram[ 77 ]= 32'b 10000000101011110000000011110011;
ram[ 78 ]= 32'b 10000000101010010000000011110001;
ram[ 79 ]= 32'b 10000000101000110000000011101110;
ram[ 80 ]= 32'b 10000000100111100000000011101100;
ram[ 81 ]= 32'b 10000000100110000000000011101010;
ram[ 82 ]= 32'b 10000000100100100000000011100111;
ram[ 83 ]= 32'b 10000000100011000000000011100100;
ram[ 84 ]= 32'b 10000000100001110000000011100001;
ram[ 85 ]= 32'b 10000000100000010000000011011110;
ram[ 86 ]= 32'b 10000000011111000000000011011011;
ram[ 87 ]= 32'b 10000000011101110000000011011000;
ram[ 88 ]= 32'b 10000000011100010000000011010100;
ram[ 89 ]= 32'b 10000000011011000000000011010001;
ram[ 90 ]= 32'b 10000000011001110000000011001101;
ram[ 91 ]= 32'b 10000000011000100000000011001001;
ram[ 92 ]= 32'b 10000000010111010000000011000101;
ram[ 93 ]= 32'b 10000000010110000000000011000001;
ram[ 94 ]= 32'b 10000000010101000000000010111101;
ram[ 95 ]= 32'b 10000000010011110000000010111001;
ram[ 96 ]= 32'b 10000000010010100000000010110101;
ram[ 97 ]= 32'b 10000000010001100000000010110000;
ram[ 98 ]= 32'b 10000000010000100000000010101011;
ram[ 99 ]= 32'b 10000000001111100000000010100111;
ram[ 100 ]= 32'b 10000000001110100000000010100010;
ram[ 101 ]= 32'b 10000000001101100000000010011101;
ram[ 102 ]= 32'b 10000000001100100000000010011000;
ram[ 103 ]= 32'b 10000000001011100000000010010011;
ram[ 104 ]= 32'b 10000000001010110000000010001110;
ram[ 105 ]= 32'b 10000000001001110000000010001000;
ram[ 106 ]= 32'b 10000000001001000000000010000011;
ram[ 107 ]= 32'b 10000000001000010000000001111110;
ram[ 108 ]= 32'b 10000000000111100000000001111000;
ram[ 109 ]= 32'b 10000000000110110000000001110011;
ram[ 110 ]= 32'b 10000000000110000000000001101101;
ram[ 111 ]= 32'b 10000000000101010000000001100111;
ram[ 112 ]= 32'b 10000000000100110000000001100001;
ram[ 113 ]= 32'b 10000000000100010000000001011100;
ram[ 114 ]= 32'b 10000000000011100000000001010110;
ram[ 115 ]= 32'b 10000000000011000000000001010000;
ram[ 116 ]= 32'b 10000000000010110000000001001010;
ram[ 117 ]= 32'b 10000000000010010000000001000100;
ram[ 118 ]= 32'b 10000000000001110000000000111110;
ram[ 119 ]= 32'b 10000000000001100000000000111000;
ram[ 120 ]= 32'b 10000000000001000000000000110001;
ram[ 121 ]= 32'b 10000000000000110000000000101011;
ram[ 122 ]= 32'b 10000000000000100000000000100101;
ram[ 123 ]= 32'b 10000000000000010000000000011111;
ram[ 124 ]= 32'b 10000000000000010000000000011001;
ram[ 125 ]= 32'b 10000000000000000000000000010010;
ram[ 126 ]= 32'b 10000000000000000000000000001100;
ram[ 127 ]= 32'b 10000000000000000000000000000110;
ram[ 128 ]= 32'b 10000001000000000000000000000000;
ram[ 129 ]= 32'b 10000000000000001000000011111001;
ram[ 130 ]= 32'b 10000000000000001000000011110011;
ram[ 131 ]= 32'b 10000000000000001000000011101101;
ram[ 132 ]= 32'b 10000000000000011000000011100110;
ram[ 133 ]= 32'b 10000000000000011000000011100000;
ram[ 134 ]= 32'b 10000000000000101000000011011010;
ram[ 135 ]= 32'b 10000000000000111000000011010100;
ram[ 136 ]= 32'b 10000000000001001000000011001110;
ram[ 137 ]= 32'b 10000000000001101000000011000111;
ram[ 138 ]= 32'b 10000000000001111000000011000001;
ram[ 139 ]= 32'b 10000000000010011000000010111011;
ram[ 140 ]= 32'b 10000000000010111000000010110101;
ram[ 141 ]= 32'b 10000000000011001000000010101111;
ram[ 142 ]= 32'b 10000000000011101000000010101001;
ram[ 143 ]= 32'b 10000000000100011000000010100011;
ram[ 144 ]= 32'b 10000000000100111000000010011110;
ram[ 145 ]= 32'b 10000000000101011000000010011000;
ram[ 146 ]= 32'b 10000000000110001000000010010010;
ram[ 147 ]= 32'b 10000000000110111000000010001100;
ram[ 148 ]= 32'b 10000000000111101000000010000111;
ram[ 149 ]= 32'b 10000000001000011000000010000001;
ram[ 150 ]= 32'b 10000000001001001000000001111100;
ram[ 151 ]= 32'b 10000000001001111000000001110111;
ram[ 152 ]= 32'b 10000000001010111000000001110001;
ram[ 153 ]= 32'b 10000000001011101000000001101100;
ram[ 154 ]= 32'b 10000000001100101000000001100111;
ram[ 155 ]= 32'b 10000000001101101000000001100010;
ram[ 156 ]= 32'b 10000000001110101000000001011101;
ram[ 157 ]= 32'b 10000000001111101000000001011000;
ram[ 158 ]= 32'b 10000000010000101000000001010100;
ram[ 159 ]= 32'b 10000000010001101000000001001111;
ram[ 160 ]= 32'b 10000000010010101000000001001010;
ram[ 161 ]= 32'b 10000000010011111000000001000110;
ram[ 162 ]= 32'b 10000000010101001000000001000010;
ram[ 163 ]= 32'b 10000000010110001000000000111110;
ram[ 164 ]= 32'b 10000000010111011000000000111010;
ram[ 165 ]= 32'b 10000000011000101000000000110110;
ram[ 166 ]= 32'b 10000000011001111000000000110010;
ram[ 167 ]= 32'b 10000000011011001000000000101110;
ram[ 168 ]= 32'b 10000000011100011000000000101011;
ram[ 169 ]= 32'b 10000000011101111000000000100111;
ram[ 170 ]= 32'b 10000000011111001000000000100100;
ram[ 171 ]= 32'b 10000000100000011000000000100001;
ram[ 172 ]= 32'b 10000000100001111000000000011110;
ram[ 173 ]= 32'b 10000000100011001000000000011011;
ram[ 174 ]= 32'b 10000000100100101000000000011000;
ram[ 175 ]= 32'b 10000000100110001000000000010101;
ram[ 176 ]= 32'b 10000000100111101000000000010011;
ram[ 177 ]= 32'b 10000000101000111000000000010001;
ram[ 178 ]= 32'b 10000000101010011000000000001110;
ram[ 179 ]= 32'b 10000000101011111000000000001100;
ram[ 180 ]= 32'b 10000000101101011000000000001011;
ram[ 181 ]= 32'b 10000000101110111000000000001001;
ram[ 182 ]= 32'b 10000000110000011000000000000111;
ram[ 183 ]= 32'b 10000000110001111000000000000110;
ram[ 184 ]= 32'b 10000000110011101000000000000100;
ram[ 185 ]= 32'b 10000000110101001000000000000011;
ram[ 186 ]= 32'b 10000000110110101000000000000010;
ram[ 187 ]= 32'b 10000000111000001000000000000001;
ram[ 188 ]= 32'b 10000000111001101000000000000001;
ram[ 189 ]= 32'b 10000000111011011000000000000000;
ram[ 190 ]= 32'b 10000000111100111000000000000000;
ram[ 191 ]= 32'b 10000000111110011000000000000000;
ram[ 192 ]= 32'b 10000000111111111000000100000000;
ram[ 193 ]= 32'b 00000000000001101000000000000000;
ram[ 194 ]= 32'b 00000000000011001000000000000000;
ram[ 195 ]= 32'b 00000000000100101000000000000000;
ram[ 196 ]= 32'b 00000000000110011000000000000001;
ram[ 197 ]= 32'b 00000000000111111000000000000001;
ram[ 198 ]= 32'b 00000000001001011000000000000010;
ram[ 199 ]= 32'b 00000000001010111000000000000011;
ram[ 200 ]= 32'b 00000000001100011000000000000100;
ram[ 201 ]= 32'b 00000000001110001000000000000110;
ram[ 202 ]= 32'b 00000000001111101000000000000111;
ram[ 203 ]= 32'b 00000000010001001000000000001001;
ram[ 204 ]= 32'b 00000000010010101000000000001011;
ram[ 205 ]= 32'b 00000000010100001000000000001100;
ram[ 206 ]= 32'b 00000000010101101000000000001110;
ram[ 207 ]= 32'b 00000000010111001000000000010001;
ram[ 208 ]= 32'b 00000000011000011000000000010011;
ram[ 209 ]= 32'b 00000000011001111000000000010101;
ram[ 210 ]= 32'b 00000000011011011000000000011000;
ram[ 211 ]= 32'b 00000000011100111000000000011011;
ram[ 212 ]= 32'b 00000000011110001000000000011110;
ram[ 213 ]= 32'b 00000000011111101000000000100001;
ram[ 214 ]= 32'b 00000000100000111000000000100100;
ram[ 215 ]= 32'b 00000000100010001000000000100111;
ram[ 216 ]= 32'b 00000000100011101000000000101011;
ram[ 217 ]= 32'b 00000000100100111000000000101110;
ram[ 218 ]= 32'b 00000000100110001000000000110010;
ram[ 219 ]= 32'b 00000000100111011000000000110110;
ram[ 220 ]= 32'b 00000000101000101000000000111010;
ram[ 221 ]= 32'b 00000000101001111000000000111110;
ram[ 222 ]= 32'b 00000000101010111000000001000010;
ram[ 223 ]= 32'b 00000000101100001000000001000110;
ram[ 224 ]= 32'b 00000000101101011000000001001010;
ram[ 225 ]= 32'b 00000000101110011000000001001111;
ram[ 226 ]= 32'b 00000000101111011000000001010100;
ram[ 227 ]= 32'b 00000000110000011000000001011000;
ram[ 228 ]= 32'b 00000000110001011000000001011101;
ram[ 229 ]= 32'b 00000000110010011000000001100010;
ram[ 230 ]= 32'b 00000000110011011000000001100111;
ram[ 231 ]= 32'b 00000000110100011000000001101100;
ram[ 232 ]= 32'b 00000000110101001000000001110001;
ram[ 233 ]= 32'b 00000000110110001000000001110111;
ram[ 234 ]= 32'b 00000000110110111000000001111100;
ram[ 235 ]= 32'b 00000000110111101000000010000001;
ram[ 236 ]= 32'b 00000000111000011000000010000111;
ram[ 237 ]= 32'b 00000000111001001000000010001100;
ram[ 238 ]= 32'b 00000000111001111000000010010010;
ram[ 239 ]= 32'b 00000000111010101000000010011000;
ram[ 240 ]= 32'b 00000000111011001000000010011110;
ram[ 241 ]= 32'b 00000000111011101000000010100011;
ram[ 242 ]= 32'b 00000000111100011000000010101001;
ram[ 243 ]= 32'b 00000000111100111000000010101111;
ram[ 244 ]= 32'b 00000000111101001000000010110101;
ram[ 245 ]= 32'b 00000000111101101000000010111011;
ram[ 246 ]= 32'b 00000000111110001000000011000001;
ram[ 247 ]= 32'b 00000000111110011000000011000111;
ram[ 248 ]= 32'b 00000000111110111000000011001110;
ram[ 249 ]= 32'b 00000000111111001000000011010100;
ram[ 250 ]= 32'b 00000000111111011000000011011010;
ram[ 251 ]= 32'b 00000000111111101000000011100000;
ram[ 252 ]= 32'b 00000000111111101000000011100110;
ram[ 253 ]= 32'b 00000000111111111000000011101101;
ram[ 254 ]= 32'b 00000000111111111000000011110011;
ram[ 255 ]= 32'b 00000000111111111000000011111001;

end


always @(posedge Clk) 
	begin
	if (En)
		begin
		if (We_A)
			ram[Addr_A] <= DI_A;
		DO_A <= ram[Addr_A];
		end
	if (En)
		begin
		if (We_B)
			ram[Addr_B] <= DI_B;
		DO_B <= ram[Addr_B];
		end 
	end


endmodule



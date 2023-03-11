module SPISLAVEtb();

reg MOSI,SS_n,clk,rst_n;
reg [1:0]check;
wire MISO;
integer i,j,index=0;
bit [7:0]m=0,n=0; //m and n to use if you want to read or write addresses in a particular order

SPISLAVE test(MOSI,MISO,SS_n,clk,rst_n);

initial begin
	clk=0;
	forever begin
		#1;
		clk= ~clk;
	end
end
initial begin
	rst_n=0;
	SS_n=1;
	#2
	rst_n=1;
		for(i=0;i<256;i=i+1) begin
	//fill the whole memory
	write_addr();
	write_data();
	
end

		for(i=0;i<256;i=i+1) begin
			//read the whole memory
			 read_addr();
			 read_data();
		end

		for(i=0;i<10;i=i+1) begin
			//read memory randomly
			 read_addr_random();
			 read_data();
		end
		for(i=0;i<10;i=i+1) begin
			//overwrite random places in the memory
			 write_addr_random();
			 write_data();
		end

	$stop;

end



task write_addr();
	SS_n=0;
	#2
	MOSI=0;
	#2
	MOSI=0;
	#2
	MOSI=0;
	for(j=7;j>=1;j=j-1) begin
		#2
		MOSI=m[j];
	end
	#2
	MOSI=m[0];
	m++;
	#2
	SS_n=1;
	#4;
endtask
task write_addr_random();
	SS_n=0;
	#2
	MOSI=0;
	#2
	MOSI=0;
	#2
	MOSI=0;
	for(j=7;j>=1;j=j-1) begin
		#2
		MOSI=$random;
	end
	#2
	MOSI=$random;
	m++;
	#2
	SS_n=1;
	#4;
endtask
task write_data();
	SS_n=0;
	#2
	MOSI=0;
	#2
	MOSI=0;
	#2
	MOSI=1;
	for(j=0;j<7;j=j+1) begin
		#2
		MOSI=$random;
	end
	#2
	MOSI=$random;
	#2
	SS_n=1;
	#4;
endtask

task read_addr();
	SS_n=0;
	#2
	MOSI=1;
	#2
	MOSI=1;
	#2
	MOSI=0;
	for(j=7;j>=1;j=j-1) begin
		#2
		MOSI=n[j];
		//MOSI=$random;
	end
	#2
	MOSI=n[0];
	//MOSI=$random;
	n++;
	#2
	SS_n=1;
	#4;
endtask
task read_data();
	SS_n=0;
	#2
	MOSI=1;
	#2
	MOSI=1;
	#2
	MOSI=1;
	for(j=0;j<7;j=j+1) begin
		#2
		MOSI=$random;
	end
	#2
	MOSI=$random;
	#16
	SS_n=1;
	#4;
endtask


task read_addr_random();
	SS_n=0;
	#2
	MOSI=1;
	#2
	MOSI=1;
	#2
	MOSI=0;
	for(j=7;j>=1;j=j-1) begin
		#2
		//MOSI=n[j];
		MOSI=$random;
	end
	#2
	//MOSI=n[0];
	MOSI=$random;
	n++;
	#2
	SS_n=1;
	#4;
endtask

endmodule
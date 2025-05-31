module hazardunit(IFID_Enable,IDEX_WBControl, EXMEM_WBControl,MemRead, MemDest,IDEX_PC,RegDestMuxOut, ReadReg1, ReadReg2,PCWrite,HazardMuxSelect, HAZARDPC);

        output  reg  PCWrite, HazardMuxSelect, IFID_Enable;
        output reg [31:0]HAZARDPC;
        input MemRead, IDEX_WBControl, EXMEM_WBControl ;
        input [4:0]RegDestMuxOut,MemDest,ReadReg1, ReadReg2;
        input [31:0]IDEX_PC;

        always@(*) begin
        if(  (ReadReg1 != 0 && ReadReg2 != 0 & RegDestMuxOut != 0 ) &&
         ( (MemRead && (ReadReg1 == RegDestMuxOut) || (ReadReg2 == RegDestMuxOut) )
            || ( EXMEM_WBControl && ((ReadReg1 == MemDest) || (ReadReg2 == MemDest)) )  ||
            (IDEX_WBControl && ( ReadReg1 == RegDestMuxOut || ReadReg2 == RegDestMuxOut ))) ) begin
           PCWrite = 1;
           IFID_Enable = 1;
           HazardMuxSelect = 1;
           HAZARDPC = IDEX_PC - 31'd1 ;
        end
        else begin
           PCWrite = 1;
           IFID_Enable = 1;
           HazardMuxSelect = 0;
           HAZARDPC = 0;
        end
        end

endmodule




module mem_control(

input mem_read,
input mem_write,

input [2:0] funct3,

output reg [1:0] mem_size,

output reg load_sign_ext

);
  
  always @(*)
begin

    mem_size = `WORD;
    load_sign_ext = 1'b1;

    if(mem_read)
    begin

        case(funct3)

        3'b000:
        begin
            mem_size = `BYTE;
            load_sign_ext = 1;
        end

        3'b001:
        begin
            mem_size = `HALF;
            load_sign_ext = 1;
        end

        3'b010:
        begin
            mem_size = `WORD;
            load_sign_ext = 1;
        end

        3'b100:
        begin
            mem_size = `BYTE;
            load_sign_ext = 0;
        end

        3'b101:
        begin
            mem_size = `HALF;
            load_sign_ext = 0;
        end

        default: ;

        endcase

    end

    else if(mem_write)
    begin

        case(funct3)

        3'b000: mem_size = `BYTE;
        3'b001: mem_size = `HALF;
        3'b010: mem_size = `WORD;

        default: ;

        endcase

    end

end
  
endmodule
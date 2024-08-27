module multiplicacion #(parameter n = 4) (
 input logic [n-1:0] input1, input2, 
 output logic [2*n-1:0] result, 
 output logic CarryOut        
);

 logic [n-1:0] suma_array[n-1:0];
 logic [n-1:0] carry_array[n-1:0];
 
 logic [n-1:0] elem1[n-1:0];
 logic [n-1:0] elem2[n-1:0];
 logic [n-1:0] Carry_calc[n-1:0]; 
 logic [n-1:0] Carry_in[n-1:0]; 
 logic [n-1:0] SumaResult[n-1:0];
 logic [n-1:0] Carry_out[n-1:0];  
 integer i, j;
 
 generate 
 
 genvar x, y;
  for (x = 0; x < n; x = x+1) begin : gen_row
  
   for (y = 0; y < n; y = y+1) begin : gen_column
  
     Productos_Parciales PPX(
     elem1[x][y],
     elem2[x][y],
     Carry_calc[x][y],
     Carry_in[x][y],
     SumaResult[x][y],
     Carry_out[x][y]
    );
    
   end 
   
  end
  
 endgenerate
 
 always@* begin 
  for(i = 0; i < n; i = i + 1) begin
          for(j =  0; j < n; j = j + 1) begin
    
              elem1[i][j] = input1[i];
              elem2[i][j] = input2[j];
      
              Carry_calc[i][j] = (i == 0) ? 1'b0 :    
      
       (j == (n-1)) ? carry_array[i-1][j] : 
       
       suma_array[i-1][j+1];  
      
              Carry_in[i][j] = (j == 0) ? 1'b0 :   
      
       carry_array[i][j-1];
       
              suma_array[i][j] = SumaResult[i][j];
              carry_array[i][j] = Carry_out[i][j];
   
          end
      end
      
      for(i = 0; i < n; i = i + 1) begin
   result[i] = suma_array[i][0];
      end
  
      for(i = 1; i < n; i = i + 1) begin
   result[n+i-1] = suma_array[n-1][i];
  end
  
      result[2*n-1] = carry_array[n-1][n-1];
  if (result > 15) begin
   CarryOut = 1;
  end else begin
   CarryOut = 0;
  end
  
    end
 
endmodule


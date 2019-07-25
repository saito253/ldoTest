#! /usr/bin/ruby

addr = [
"1e0b","1e0c","1e10","1e13","1e14","1e17","1e18","1e23","1e24","1e25",
"1e2f","1e33","1e34","1e36","1e37","1e39","1e3a","1e3f","1e4f","1e50",
"1e56","1d39","1e6a","1e90","1e9f"
]

#out = open(ARGV[1],"w")
for i in 0..24 do
 count=0
 @final_line = nil
  File.open(ARGV[0],"r") do |file|
    file.each_line do |line|
      if line.match(addr[i]) then
         count=1+count
         @final_line = line
      end
    end
    if (@final_line != nil) then
#     out.print(i+1,") ",count," ",@final_line)
      print i+1,") ",count," ",@final_line
    end
  end
end

#out.close

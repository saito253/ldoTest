#!/usr/bin/ruby

require "serialport"

$sp = SerialPort.new('/dev/ttyUSB0',115200,8,1,0)

while 1 do
  p $sp.gets()
end

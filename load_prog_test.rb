#!/usr/bin/ruby

require "serialport"
#require './lib/Lazurite'

$test = Lazurite::Test.new
@@com_target = "/dev/ttyUSB0"

system("./load_prog.rb " + "Welcome_SubGHz.bin mini")<
#$test.prog_write("LAZURITE mini series","./Welcome_SubGHz.bin")
sleep(1)

#$sp = SerialPort.new('/dev/ttyUSB0',115200,8,1,0)
#
#while 1 do
#  p $sp.gets()
#end

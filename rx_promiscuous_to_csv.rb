#! /usr/bin/ruby
# -*- coding: utf-8; mode: ruby -*-
# Function:
#   Lazurite Sub-GHz/Lazurite Pi Gateway Sample program
#   SerialMonitor.rb
require 'LazGem'
require 'logger'
require 'date'
require 'csv'

laz = LazGem::Device.new

# Halt process when CTRL+C is pushed.
finish_flag=0
Signal.trap(:INT){
	finish_flag=1
}

if ARGV.size == 0
	printf("please input argument of ch at least\n")
	printf("command format is shown below...\n")
	printf("./sample_rx.rb ch panid baud pwr\n")
	exit 0
end

$csvfile = CSV.open('./log/ldo_debug.csv','w')
# open device deriver
laz.init()

dst_addr = 0xffff
ch = 36
panid = 0xabcd
baud = 100
pwr = 20

if ARGV.size > 0
	ch=Integer(ARGV[0])
end
if ARGV.size > 1
	panid = Integer(ARGV[1])
end
if ARGV.size > 2
	baud = Integer(ARGV[2])
end
if ARGV.size > 3
	pwr = Integer(ARGV[3])
end

print(sprintf("myAddress=0x%016x\n",laz.getMyAddr64()))
print(sprintf("myAddress=0x%04x\n",laz.getMyAddress()))
print(sprintf("ch=%d, panid = %04x, baud= %d, pwr=%d\n",ch,panid,baud,pwr))
laz.begin(ch,panid,baud,pwr)
laz.setPromiscuous(true)
laz.rxEnable()

# printing header of receiving log
print(sprintf("time\t\t\t\t\t[ns]\trxPanid\trxAddr\ttxAddr\trssi\tpayload\n"))
print(sprintf("------------------------------------------------------------------------------------------\n"))

# main routine
while finish_flag == 0 do
	if laz.available() <= 0
		next
	end
	rcv = laz.read()
    t = DateTime.now
	# printing data
	p rcv
    $csvfile.puts [rcv["src_addr"],t]
#   $csvfile.puts [rcv,t]
    p t
end
laz.rxDisable()
laz.setPromiscuous(false)
$csvfile.close

# finishing process
laz.remove()



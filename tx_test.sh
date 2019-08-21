#! /bin/bash


#I2CDEV=`sudo cat /etc/modules | grep i2c-dev | sed 's/i2c//g'`

#echo $I2CDEV

#if [ "$I2CDEV" = "i2c-dev" ]; then
#   echo $I2CDEV
#else
#   echo "non"
#fi

#./load_prog.rb bin/Welcome_SubGHz_wdt.bin mini
#./load_prog.rb bin/Welcome_SubGHz_2wait.bin mini
#./load_prog.rb bin/Welcome_SubGHz.bin mini
./load_prog.rb $1

./serialmoniter.rb


#!/usr/bin/env bash

install() {
	    cd tg
	  	sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
	  	sudo apt-get install g++-4.7 -y c++-4.7 -y
  		sudo apt-get update
  		sudo apt-get upgrade
	  	sudo apt-get install libreadline-dev -y libconfig-dev -y libssl-dev -y lua5.2 -y liblua5.2-dev -y lua-socket -y lua-sec -y lua-expat -y libevent-dev -y make unzip git redis-server autoconf g++ -y libjansson-dev -y libpython-dev -y expat libexpat1-dev -y
	  	sudo apt-get install screen -y
  		sudo apt-get install tmux -y
	  	sudo apt-get install libstdc++6 -y
	  	sudo apt-get install lua-lgi -y
	  	sudo apt-get install libnotify-dev -y
	  	sudo service redis-server restart
	  	wget https://valtman.name/files/telegram-cli-1222
  		chmod +x telegram-cli-1222
	  	cd ..
	  	chmod +x bot
	  	chmod +x tg
}

torinstall() {
      sudo apt-get install -y tor
      sudo service tor start
      sudo export http_proxy=socks5://127.0.0.1:9050 https_proxy=socks5://127.0.0.1:9050
}


if [ "$1" = "install" ]; then
  install
  echo -e "\033[01;31m Installation Completed! \033[0m"
elif [ "$1" = "torinstall" ]; then
  torinstall
  echo -e "\033[01;31m All Done! Tor Installed And Applied..., Enjoy Your Bots \033[0m"
else

if [ ! -f ./tg/telegram-cli-1222 ]; then
    echo "tg not found"
    echo "Run $0 install"
    exit
 fi

   ./tg/telegram-cli-1222 -s ./bot/bot.lua $@
fi

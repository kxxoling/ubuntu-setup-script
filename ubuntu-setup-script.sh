#!/bin/bash
echo "卸载无用软件"
echo "卸载 LibreOffice"
sudo apt-get remove -y --purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove -y
echo "卸载 Gwibber"
sudo apt-get remove -y --purge gwibber*
sudo apt-get clean
sudo apt-get autoremove -y

echo "下载并安装 Google Linux Repository 的密钥……"
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "下载并安装 Oracle VirtualBox 的密钥……"
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

echo "下载并安装必要的软件源……"
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo add-apt-repository ppa:lucid-bleed/ppa -y 					# VLC
sudo add-apt-repository ppa:webupd8team/sublime-text-2 -y 		# Sublime Text 2
sudo add-apt-repository ppa:chromium-daily/stable -y			# Chromium
sudo add-apt-repository ppa:webupd8team/themes -y 				# OS X主题
sudo add-apt-repository ppa:ypubuntu-com/gtk3				#主题
sudo add-apt-repository ppa:fcitx-team/nightly 				#fcitx+GooglePinyin

sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian precise contrib" >> /etc/apt/sources.list' 	#Ubuntu 12.04 VirtualBox


echo "更新软件源"
sudo apt-get update -y

echo "下载hosts文件并覆盖"
wget https://www.box.com/s/uhq9r5uqobhvcecwixvy
sudo chmod 777 /etc/hosts
sudo cat hosts > /etc/hosts

echo "安装常用工具"
sudo apt-get install -y meld 				# meld diff tool（可视化的文件及目录比较工具）
sudo apt-get install -y zsh 				# z shell
echo "正在安装Chromium浏览器……"
sudo apt-get install -y chromium-browser 	# 安装Chromium浏览器
echo "正在安装Chrome浏览器……"
sudo apt-get install google-chrome-stable
echo "正在安装fcitx以及Google拼音输入法……"
sudo apt-get install fcitx fcitx-googlepinyin fcitx-module-cloudpinyin -y

echo "开始配置开发环境……"
sudo apt-get install -y git-core 			# git
sudo apt-get install sublime-text 			# 安装sublime text 2
sudo apt-get install g++ 				#安装g++

echo "安装下载并Node.js……"
git clone git://github.com/joyent/node.git
cd node
./configure | make | sudo make install

echo "正在下载并安装Ruby环境……"
sudo apt-get install ruby-full rubygems

echo "正在下载并安装RHC……"
sudo gem install rhc

echo "正在下载并安装VirtualBox……"
sudo apt-get install virtualbox-4.2
sudo apt-get install dkms


# Finished!
sudo apt-get update -y

echo "系统配置完成！"
echo 'You might need to run "chsh -s `which zsh`"'

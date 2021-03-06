#! /bin/bash
#Clean
sudo echo "------------------------------------"
echo "Smart CPU version 2.3"
echo "Script written by saintno@hackintoshvn"
echo "Begin cleaning..."
TMP="$(sudo launchctl unload -w ~/Library/LaunchAgents/com.saintno.autovoltage.plist &>/dev/null)"
TMP="$(launchctl unload -w ~/Library/LaunchAgents/com.saintno.notifier.plist &>/dev/null)"
sudo rm -f ~/Library/LaunchAgents/com.saintno.autovoltage.plist
sudo rm -f ~/Library/LaunchAgents/com.saintno.notifier.plist
sudo rm -r -f /Library/Application\ Support/VoltageShift
sudo rm -r -f /Users/Shared/.smartcpu

#Warning
echo "<> This script may cause panic, dead cpu due to your config."
echo "<> In care your system is not stable, please run uninstall and reboot then find an better config."
echo "------------------------------------"
echo "<> Before installing."
echo "<> Please set your config in auto.sh and tested it by running 'bash auto.sh'."
echo "<> Testing it about 30min with hard work, if everthing stable then you should be fine to install it."
read -p "<> Press any key to continute, Ctrl + C to cancel..."

#Install
echo "<> Installing..."
mkdir -p /Users/Shared/.smartcpu
echo "" >/Users/Shared/.smartcpu/notifier
echo "" >/Users/Shared/.smartcpu/profile
echo "" >/Users/Shared/.smartcpu/config
echo "" >/Users/Shared/.smartcpu/profile_name
echo "" >/Users/Shared/.smartcpu/battery
echo "" >/Users/Shared/.smartcpu/setting
echo 1 >/Users/Shared/.smartcpu/notification
echo 1 >/Users/Shared/.smartcpu/auto_shut
chmod -R 777 /Users/Shared/.smartcpu/*
sudo cp ./src/com.saintno.autovoltage.plist /Library/LaunchDaemons/
sudo cp ./src/com.saintno.notifier.plist ~/Library/LaunchAgents/
sudo chown root:wheel /Library/LaunchDaemons/com.saintno.autovoltage.plist
sudo chown root:wheel ~/Library/LaunchAgents/com.saintno.notifier.plist
sudo mkdir -p /Library/Application\ Support/VoltageShift/
sudo cp -R ./src/VoltageShift.kext /Library/Application\ Support/VoltageShift/
sudo cp ./src/voltageshift /Library/Application\ Support/VoltageShift/
sudo cp ./src/auto.sh /Library/Application\ Support/VoltageShift/
sudo cp ./config.sh /Library/Application\ Support/VoltageShift/
sudo cp ./src/notifier.sh /Library/Application\ Support/VoltageShift/
sudo cp ./src/cprofile.sh /usr/local/bin/cprofile
sudo chown -R root:wheel /Library/Application\ Support/VoltageShift/VoltageShift.kext
sudo chown root:wheel /Library/Application\ Support/VoltageShift/voltageshift
sudo chown root:wheel /Library/Application\ Support/VoltageShift/auto.sh
sudo chown root:wheel /Library/Application\ Support/VoltageShift/config.sh
sudo chown root:wheel /Library/Application\ Support/VoltageShift/notifier.sh
sudo chown root:wheel /usr/local/bin/cprofile
sudo chmod 777 /Library/Application\ Support/VoltageShift/auto.sh
sudo chmod 777 /Library/Application\ Support/VoltageShift/config.sh
sudo chmod 777 /Library/Application\ Support/VoltageShift/voltageshift
sudo chmod 777 /Library/Application\ Support/VoltageShift/notifier.sh
sudo chmod 755 /usr/local/bin/cprofile
launchctl load -w ~/Library/LaunchAgents/com.saintno.notifier.plist
sudo launchctl load -w /Library/LaunchDaemons/com.saintno.autovoltage.plist
echo "<> To select profile, please install https://github.com/matryer/bitbar and select plugin folder as bitbar's plugin folder"
echo "<> In case you have installed bitbar, copy all file in plugin to bitbar's plugin folder"
echo "<> To uninstall, please use 'bash uninstall.sh'."
echo "<> Done."

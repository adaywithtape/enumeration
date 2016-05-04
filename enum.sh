#!/bin/bash
# enum.sh v0.1
# last edited 08-03-2016

# Modification (mostly cosmetic :d) by TAPE
# 
#						TEH COLORZ :D
########################################################################
STD=$(echo -e "\e[0;0;0m")		#Revert fonts to standard colour/format
RED=$(echo -e "\e[1;31m")		#Alter fonts to red bold
GRN=$(echo -e "\e[1;32m")		#Alter fonts to green bold
BLU=$(echo -e "\e[1;36m")		#Alter fonts to blue bold
#
#						CREDITS
########################################################################
# Original: Quick Linux Local Enumeration Script 
# 			v1.0
# 			by @Arr0way
# 			http://highon.coffee.com
echo $BLU"############################$STD"
echo $BLU"#$RED CREDITS TO:$BLU @Arr0way     #$STD"
echo $BLU"#$RED http://highon.coffee.com$BLU #$STD"
echo $BLU"############################$STD"
########################################################################
if [[ "$1" == "-h" || "$1" == "--h" ]] ; then 
	echo -e "To print output to screen run script as is;$GRN bash $0$STD\nhowever suggest to write to file;$GRN bash $0 > output.txt$STD"
	exit
fi
#
#						ENUMERATIONS
########################################################################
#
#						Linux Version
#-----------------------------------------------------------------------
echo $GRN"=============$STD"
echo $RED"Linux Version$STD"
echo $GRN"=============$STD"
/bin/cat /etc/issue && /bin/cat /etc/*-release
#
#						Kernel Info
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"=============$STD"
echo $RED"Kernel Info$STD"
echo $GRN"=============$STD"
/bin/uname -ar
#
#						Network Info
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"=============$STD"
echo $RED"Network Info$STD"
echo $GRN"=============$STD"
/bin/cat /etc/sysconfig/network
echo -e "\n"
/bin/cat /etc/resolv.conf
#
#						File System Info
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"================$STD"
echo $RED"File System Info$STD"
echo $GRN"================$STD"
/bin/df -h
#
#						Mounted File Systems
#-----------------------------------------------------------------------

echo -e "\n"
echo $GRN"====================$STD"
echo $RED"Mounted File Systems$STD"
echo $GRN"====================$STD"
/bin/df -h
mount | column -t
#
#						/etc/fstab File contents
#-----------------------------------------------------------------------

echo -e "\n"
echo $GRN"========================$STD"
echo $RED"/etc/fstab File Contents$STD"
echo $GRN"========================$STD"
/bin/cat /etc/fstab
#
#						/etc/passwd File contents
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"=========================$STD"
echo $RED"/etc/passwd File Contents$STD"
echo $GRN"=========================$STD"
/bin/cat /etc/passwd
#
#						/etc/shadow File contents
#-----------------------------------------------------------------------

echo -e "\n"
echo $GRN"==========================$STD"
echo $RED$"/etc/shadow File Contents$STD"
echo $GRN"==========================$STD"
/bin/cat /etc/shadow
#
#						/etc/group File contents
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"========================$STD"
echo $RED"/etc/group File Contents$STD"
echo $GRN"========================$STD"
/bin/cat /etc/group
#
#						/etc/sudoers File contents
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"==========================$STD"
echo $RED"/etc/sudoers File Contents$STD"
echo $GRN"==========================$STD"
/bin/cat /etc/sudoers
#
#						Sticky Bit Files
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"================$STD"
echo $RED"Sticky Bit Files$STD"
echo $GRN"================$STD"
/usr/bin/find / -perm -g=s -o -perm -4000 ! -type l -maxdepth 3 -exec ls -ld {} \; 2>/dev/null
#
#						World Writable Directories
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"==========================$STD"
echo $RED"World Writable Directories$STD"
echo $GRN"==========================$STD"
/usr/bin/find / -perm -222 -type d 2>/dev/null  
#
#						World Writable Files
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"=====================$STD"
echo $RED" World Writable Files$STD"
echo $GRN"=====================$STD"
/usr/bin/find / -type f -perm 0777 2>/dev/null
#
#						Files Owned by Current User
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"===========================$STD"
echo $RED"Files Owned by Current User$STD"
echo $GRN"===========================$STD"
/usr/bin/find / -user $(whoami) 2>/dev/null
#
#						/home and /root Permissions
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"===========================$STD"
echo $RED"/home and /root Permissions$STD"
echo $GRN"===========================$STD"
/bin/ls -ahlR /home/
/bin/ls -ahlR /root/ 
#
#						Logged on Users
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"===============$STD"
echo $RED"Logged on Users$STD"
echo $GRN"===============$STD"
/usr/bin/w
#
#						Last Logged on Users
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"=====================$STD"
echo $RED" Last Logged on Users$STD"
echo $GRN"=====================$STD"
/usr/bin/last
#
#						Processes Running as root
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"=========================$STD"
echo $RED"Processes Running as root$STD"
echo $GRN"=========================$STD"
/bin/ps -ef | /bin/grep root
#
#						Installed Packages for RHEL / Debian Bases Systems
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"==================================================$STD"
echo $RED"Installed Packages for RHEL / Debian Based Systems$STD"
echo $GRN"==================================================$STD"
#
#						Enumerate CentOS / Ubuntu Boxes
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"===============================$STD"
echo $RED"Enumerate CentOS / Ubuntu Boxes$STD"
echo $GRN"===============================$STD"
/usr/bin/dpkg -l
printf "\n"
/usr/bin/rpm -qa
#
#						CentOS / RHEL Services that start at Boot
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"=========================================$STD"
echo $RED"CentOS / RHEL Services that start at Boot$STD"
echo $GRN"=========================================$STD"
chkconfig --list | grep $(runlevel | awk '{ print $2}'):on
#
#						List of init Scripts aka System Services
#-----------------------------------------------------------------------
echo -e "\n"
echo $GRN"========================================$STD"
echo $RED"List of init Scripts aka System Services$STD"
echo $GRN"========================================$STD"
ls /etc/init.d/
echo
echo
echo
echo "More Linux enumeration commands from the original author can be found at: $BLU https://highon.coffee/docs/linux-commands  \n$STD"

#!/bin/bash - 
#===============================================================================
#
#          FILE: proxy.sh
# 
#         USAGE: ./proxy.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2017年09月02日 10:18
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error




json_parser(){

	
cat  ./test.json | \

	python -c "import sys, json; print json.load(sys.stdin)['$1']['$2']"


}

proxy=$(json_parser proxy_info ip_address) #; [ -z "$proxy" ];
p_user_name=$(json_parser proxy_info user_name)
p_password=$(json_parser proxy_info password)
 
#if [ -n "$proxy" -o -n "$p_user_name" -a -n "$password"  ];then
if [ -n "$proxy" ];then
	echo true
	if [ -z "$p_user_name" -a -z "$p_password" ]; then
	 echo "no pass and username"
       	 #put log here
      	 run=1
	elif [ -n "$p_user_name" ]; then
	 echo "there are username"
	 run=0
	elif [ -n "$p_password" ] ; then
	 echo "there are no password"
	 run=0
	fi
#else 
#  	echo no "
# 	run=3	
fi
# 
# 
# case $run in 
# 	1) curl 
# 	   ;;
# 	2) curl
# 	   ;;
# 	3) curl
# 	   ;;
# 
# #proxy with identifier 
# #proxy_identifier parameter
# #0 = no proxy
# # 1 = proxy with only ip (no Auth)
# # 2 = proxy with auth(username and passwor)
# # 3 = proxy with username
# # 4 = proxy with password
# proxy identifier=$(json_parser proxy_info proxy_identifier) 
 

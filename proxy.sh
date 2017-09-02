#!/bin/sh



json_parser(){

	
cat  ./test.json | \

	python -c "import sys, json; print json.load(sys.stdin)['$1']['$2']"


}

proxy=$(json_parser proxy_info ip_address) #; [ -z "$proxy" ];
p_user_name=$(json_parser proxy_info user_name)
p_password=$(json_parser proxy_info password)
 
#if [ -n "$proxy" -o -n "$user_name" -a -n "password"  ];then
if [ -n "$proxy" ];then
	echo true
	if [ -z "$user_name" -a -z "password" ]: then
	 echo "no pass and username"
       	 #put log here
      	 run=1
	else if [ -n "user_name"   ]
	 echo "there are username"
	 run=0
	else if [ -n "password" ] 
	 echo "there are no password"
	 run=0
	fi
else 
 	echo "no proxy"
	run=3	
fi


case $run in 
	1) curl 
	   ;;
	2) curl
	   ;;
	3) curl
	   ;;

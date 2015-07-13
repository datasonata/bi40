# fix for hosts file to assign out domain to the private ip
if test -f /etc/hosts; then
   cat /etc/hosts |grep localhost > /tmp/hosts.$$
   ETH_IP=`/sbin/ifconfig -a eth0 |grep inet |awk {'print $2'} |sed 's/addr://'`
   HNAME_FQDN=`hostname -f`
   HNAME_SHORT=`echo ${HNAME_FQDN} |awk -F "." {'print $1'}`
   echo "${ETH_IP}	${HNAME_FQDN}	${HNAME_SHORT}" >> /tmp/hosts.$$
   cp /tmp/hosts.$$ /etc/hosts
   rm -f /tmp/hosts.$$
fi


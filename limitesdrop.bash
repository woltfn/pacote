#!/bin/bash
mkdir /etc/usuarios 1>/dev/null 2>/dev/null
echo "$limpcron" > /etc/crontab
sustenido=$
echo "#!/bin/bash" > /etc/usuarios/$1.sh

echo "echo -n > /tmp/pid2">> /etc/usuarios/$1.sh
echo "ps ax|grep dropbear > /tmp/pid" >> /etc/usuarios/$1.sh
echo "cat /tmp/pid | grep -i 'dropbear -p' > /tmp/pids" >> /etc/usuarios/$1.sh
echo "cat /var/log/auth.log |  grep -i "Password auth succeeded" |  grep "$1" > /tmp/sks" >> /etc/usuarios/$1.sh
echo "perl -pi -e 's/Password auth succeeded for//g' /tmp/sks" >> /etc/usuarios/$1.sh
echo "perl -pi -e 's/dropbear//g' /tmp/sks" >> /etc/usuarios/$1.sh
echo "cat /tmp/pid | while read line;do" >> /etc/usuarios/$1.sh
echo "set -- "$sustenido"line" >> /etc/usuarios/$1.sh
echo "p="$sustenido"1" >> /etc/usuarios/$1.sh
echo "var="'`cat /tmp/sks | grep -i $1`'"" >> /etc/usuarios/$1.sh
echo "set -- "$sustenido"var" >> /etc/usuarios/$1.sh
echo "l="$sustenido"6" >> /etc/usuarios/$1.sh
echo "if [ '"$sustenido"6' != '' ]" >> /etc/usuarios/$1.sh
echo "then" >> /etc/usuarios/$1.sh
echo "echo '"$sustenido"p "$sustenido"l'| cat - /tmp/pid2 > /tmp/temp && mv /tmp/temp /tmp/pid2" >>$
echo "fi" >> /etc/usuarios/$1.sh
echo " done" >> /etc/usuarios/$1.sh

echo "echo -n > /tmp/user1" >> /etc/usuarios/$1.sh
echo "cat /tmp/pid2 | while read line;do" >> /etc/usuarios/$1.sh
echo "set -- "$sustenido"line" >> /etc/usuarios/$1.sh
echo "p="$sustenido"1" >> /etc/usuarios/$1.sh
echo "u="$sustenido"2" >> /etc/usuarios/$1.sh
echo "cat /tmp/user1 | grep -i "$sustenido"u > /dev/null" >> /etc/usuarios/$1.sh
echo "if [ "$sustenido"? = 1 ];then" >> /etc/usuarios/$1.sh
echo "echo "$sustenido"line >> /tmp/user1" >> /etc/usuarios/$1.sh
echo "else" >> /etc/usuarios/$1.sh
echo "kill "$sustenido"p" >> /etc/usuarios/$1.sh
echo "echo "kill "$sustenido"p user "$sustenido"u" " >> /etc/usuarios/$1.sh 
echo "fi" >> /etc/usuarios/$1.sh
echo "done" >> /etc/usuarios/$1.sh
echo "rm -f /tmp/pid" >> /etc/usuarios/$1.sh
echo "rm -f /tmp/pid2" >> /etc/usuarios/$1.sh
echo "rm -f /tmp/pids" >> /etc/usuarios/$1.sh
echo "rm -f /tmp/sks" >> /etc/usuarios/$1.sh
echo "rm -f /tmp/user1" >> /etc/usuarios/$1.sh
echo "exit 0" >> /etc/usuarios/$1.sh
echo ";;" >> /etc/usuarios/$1.sh
echo "esac" >> /etc/usuarios/$1.sh


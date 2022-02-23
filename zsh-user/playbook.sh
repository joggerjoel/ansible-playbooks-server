#set -x # bash tracing
#debug="-vvv" #ansible tracing


if [ -z "$SUDOPASS" ]; then
   echo "Sudo password: "
   read -sr SUDO_PASS
   export SUDOPASS=$SUDO_PASS
fi

if [ -z "$1" ]; then
   ansible-playbook -i ../inventory playbook.yml -b --extra-vars "ansible_sudo_pass=$SUDOPASS"  -e 'ansible_python_interpreter=/usr/bin/python3' $debug
else 
   ansible-playbook -i ../inventory --limit=$1 playbook.yml -b --extra-vars "ansible_sudo_pass=$SUDOPASS"  -e 'ansible_python_interpreter=/usr/bin/python3' $debug
fi

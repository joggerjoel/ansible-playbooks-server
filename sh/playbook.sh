if [ -z "$SUDOPASS" ]; then
   echo "export SUDOPASS=password missing"
   exit
fi
#debug="-vvv"

ansible-playbook -i ../inventory playbook.yml -b --extra-vars "ansible_sudo_pass=$SUDOPASS"  -e 'ansible_python_interpreter=/usr/bin/python3' $debug


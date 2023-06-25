#date: 25/6/23
#script: password less (authentication) ssh from master server to slaves THIS IS PREREQUISITE FOR ANSIBLE


# now create n no of slave servers


# ceate one master server and run 
sudo apt update 
sudo apt install ansible

#setting up pass less connection from master to slave

ssh-keygen 

cd .ssh
ls -ltr

cat id_rsa.pub
#copy the key login the slave server

ssh-keygen

cd .ssh
vim authorized_keys
#paste the key here

#press  esc:wq to save the file

#navigate to master server 

ssh <ip of slave> 

#connection established 


------------------------------------

#date: 25/6/23
#script: writing ansible PLAYBOOKS

##################################
bonus^C

#write ansible adhoc cmds (when there are very less tasks use adhoc cmds instead of playbooks) 

#in master server make inventory 

touch inventory 
vim inventory 

# paste ips of slave servers that are ssh from master as- 

[name]
127.0.0.1
100.10.22.22

#save and exit

ansible -i inventory <name> "shell" -a "df" 

# the cmd will run  on the servers under the [name] and shows the disk space of all servers
#################################


#script2: install and run nginx in slave server with ansible playbook

vim first-playbook.yml


---
- name: Install and Start nginx
  hosts: all
  become: true

  tasks:
    - name: Install nginx 
      apt:
        name: nginx
        state: present
    - name: Start nginx
      service: 
        name: nginx
        state: started  
#save n exit

ansible-playbook -i inventory first-playbook.yml

#success in all the slaves 

########################################################################

#date: 25/6/23
#script3: creating a complex playbook solution to avoide overly complicated playbook 

mkdir second-playbook
cd second-playbook 
ansible-galaxy role init kubernetes

# now u get structured ansible playbook with the help of roles from ansible galaxy 

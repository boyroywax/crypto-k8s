# crypto-k8s
Crypto Wallets on Kubernetes

## Development Environment
* MacBook Pro (16gb ram)
* 4 x Atomic Pi (x86 Intel, 2gb ram, 32gb ssd)
* Raspberry Pi 4 NFS Server (4gb ram, 1tb ssd)
* k3s
* MetalLB
* Skaffold
* VS Code

## Index
1. Prepare development environment.
2. Install NFS server.
3. Install k3s cluster.
4. Configure MetalLB.
5. Deploy crypto wallets.
6. Deploy block explorers.*
7. Deploy web wallets.*
```text
* = Incomplete or Not Started
```

## 1. Prepare development environment.
A. Configure Atomic Pi's for k3s.
  * OS: Atomic Pi Pre-loaded - https://www.digital-loggers.com/api_faqs.html#OriginalOS
  * Give each atomic pi a distinct hostname
  ```shell
  sudo nano /etc/hostname
  ```
  * Disable Swap
  * Set Static IP
  ```shell
  sudo nano /etc/dhcpcd.conf
  ```
  * Add the following to the end of file, editing to fit your needs.
  ```text
  interface eth0
  static ip_address=192.168.0.87/24
  static routers=192.168.0.1
  statis domain_name_servers=75.75.75.75
  ```
  * https://raspberrypi.stackexchange.com/questions/68477/static-ip-configuration-in-dhcpcd-conf-ignored

B. Add host entries to ```/user/username/.ssh/config```.
  * Example ssh config file located on MacBook Pro:
  ```text
  # example atomic pi ssh config
  # example path: /user/username/.ssh/config
  Host atomic
	HostName atomic.local
	Port 22
	User atomicpi
	IdentityFile ~/.ssh/id_openvpn

  Host atomic2
        HostName atomic2.local
        Port 22
        User atomicpi
        IdentityFile ~/.ssh/id_openvpn

  Host atomic3
        HostName atomic3.local
        Port 22
        User atomicpi
        IdentityFile ~/.ssh/id_openvpn

  Host atomic4
        HostName atomic4.local
        Port 22
        User atomicpi
        IdentityFile ~/.ssh/id_rsa
   ```


* More Atomic Pi resources
  * http://www.hydrogen18.com/blog/first-hour-with-the-atomic-pi.html

## 2. Install NFS server.
A. Update Raspberry Pi 4 and upgrade.
```shell
sudo apt update && sudo apt upgrade -y
```

B. Install the NFS server packages.
```shell
sudo apt-get install nfs-kernel-server portmap nfs-common
```

C. Create the NFS folder for sharing.
```shell
export MOUNT=/media
mkdir -p $MOUNT/nfs && \
sudo chmod -R 777 $MOUNT/nfs
sudo chown nobody:nogroup $MOUNT/nfs
```

D. Add share folder to ```/etc/exports```.
``` shell
sudo echo -e "$MOUNT/nfs 192.168.1.0/24(rw,sync,no_subtree_check,insecure,no_root_squash)" >> /etc/exports
```

E. Reset exports.
```shell
sudo exportfs -a
```

F. Restart the NFS service.
```shell
sudo systemctl restart nfs-kernel-server
```

## 3. Install k3s cluster.
A. Use Ansible playbook.
  * Download the latest playbook
  ```shell
  git clone https://github.com/boyroywax/crypto-k8s
  ```
B. Configure the playbook.
  * Add your master and nodes to ```hosts.ini```, use the Host name from the ssh config file.
  ```text
  # ansible-k3s-atomicpi/hosts.ini
  [master]
  atomic

  [node]
  atomic2
  atomic3
  atomic4

  [k3s-cluster:children]
  master
  node
  ```
  * Edit ```group_vars/all.yml```.  Pay attention to the IP of your master.  
  ```Full_clean_install``` deletes all previous k3s files for a fresh install.  
  The file is commented with the variables description.

C. Run the Ansible playbook.
  * 
  ```shell
  make
  ```

D. K3s config file located at ```ansible-k3s-atomic/files/k3s.yml```
  ```shell
  export KUBECONFIG=$PWD/ansible-k3s-atomic/files/k3s.yml
  kubectl get nodes # test by checking for nodes
  ```

## 4. Configure MetalLB
A. Edit the IP address range in ```config.yaml```.

B. Run the ```run_metal.sh``` script.
```shell
./run_metal.sh
```

## 5. Deploy crypto wallets.
A. Create ```crypto``` namespace.
```shell
kubectl create ns crypto
```

B. Run ```deploy_all.sh``` script.
```shell
./deploy_all.sh
```

C. Clean Up: Remove crypto wallets.
```shell
./delete_all.sh
```

D. Getinfo from all the running wallets. * NOT FINISHED
```shell
./getinfo_all.sh
```

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
2. Install k3s cluster.
3. Install NFS server.
4. Configure MetalLB.
5. Deploy crypto wallets.
6. Deploy block explorers.*
7. Deploy web wallets.*
```text
* = Incomplete or Not Started
```

## 1. Prepare development environment.
A. Configure Atomic Pi's for k3s.
  * Give each atomic pi a distinct hostname
  ```shell
  sudo nano /etc/hostname
  ```
  * Disable Swap
  
 B. Add host entries to ```/user/username/.ssh/config```
   * Example:
   ```text
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
  

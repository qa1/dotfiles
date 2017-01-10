# How to .... [Few things that I need frequently]
## Colorful Terminal is here ...
For colorizing your terminal you can read [this](http://misc.flogisoft.com/bash/tip_colors_and_formatting) manual.

## Fix Perl warning setting locale failed on Raspbian
You can fix the issue by setting the locale to en_US.UTF-8 for example:
```sh
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
sudo locale-gen en_US.UTF-8
sudo dpkg-reconfigure locales
```
## Docker Monitoring based on [Portainer](https://github.com/portainer/portainer)
Portainer is a simple management solution for docker.
it consists of a webUI that allows you to easily manage your docker containers, images, networks and volumes.

> remote docker engine
```sh
docker run -d -p 9000:9000 portainer/portainer -H tcp://<REMOTE_HOST>:<REMOTE_PORT>
```

> local docker engine
```sh
docker run -d -p 9000:9000 portainer/portainer -V /var/run/docker.sock:/var/run/docker.sock
```

## Zabbix based Monitoring
Zabbix is an open source software for networks and application monitoring.
Zabbix provides agents to monitor remote hosts as well as Zabbix includes
support for monitoring via SNMP, TCP and ICMP checks.

[How to Install Zabbix Server 3.0 on Ubuntu 16.04/14.04 LTS and Debian 8/7](http://tecadmin.net/install-zabbix-on-ubuntu/)

## Build Router and NAT with your ubuntu
First edit `/etc/sysctl.conf` and uncomment:
```
# net.ipv4.ip_forward=1
```
so that it reads:
```
net.ipv4.ip_forward=1
```
To enable IP masquerading, enter following set of commands in terminal:
```sh
# eth0: LAN - private
# eth1: WAN - public

sudo iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

sudo iptables -A FORWARD -i eth1 -o eth0 -m state -–state RELATED,ESTABLISHED -j ACCEPT

sudo iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
```
> IP Masquerade is a form of Network Address Translation or NAT which NAT allows internally connected computers that do not have one or more registered Internet IP addresses to communicate to the Internet via the Linux server's Internet IP address.

## Better bash on CentOS
For having better bash completion use following package:
```sh
yum install bash-completion
```
## Dircolors on OSx
Try installing the GNU coreutils from this if you really want dircolors to work.
I also had to set an alias for dircolors to gdircolors as this is the command that FreeBSD ports installed the fun as.

## Font
Personally I used *Meslo LG S Powerline* as my default font and you can
install it with
```shell
./fonts/install.sh
```
## Airspeed [Automated ...]
For installing *airspeed* on OSx use pip3 command as follows
```shell
pip3 install airspeed
```
For installing it on Ubuntu you must compile it from source code:
```shell
git clone https://github.com/purcell/airspeed.git
cd airspeed
sudo python3 setup.py install
cd ..
sudo rm -Rf airspeed
```
## Ubuntu Bug
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/887793
```shell
sudo -s
echo "disable" > /sys/firmware/acpi/interrupts/gpe13
```

## ONOS Configuration
For using [ONOS SDN platform](http://onosproject.org/) based on this dotfiles
set following configuration in `zshrc.local`:

```shell
export ONOS_ROOT="$HOME/Documents/Git/others/onos"
autoload bashcompinit
bashcompinit
source $ONOS_ROOT/tools/dev/bash_profile
```

and comment out following line in `$ONOS_ROOT/tools/dev/bash_profile`:

```shell
export ONOS_CELL=${ONOS_CELL:-local}
```
## GTK Theme Settings
Inorder to use gtk configuration
copy the settings files from `gtk` into `~/.config/gtk-3.0/gtk.css`.
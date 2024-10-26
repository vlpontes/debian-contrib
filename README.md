!["Under Construction"](https://github.com/vlpontes/debian-contrib/blob/main/images/underconstruction.png)


# Debian Contributions
[Debian Site](https://www.debian.org/)  
[How you can help Debian](https://www.debian.org/intro/help)

[Orfan Packages](https://qa.debian.org/developer.php?email=packages@qa.debian.org)

Bugs: https://bugs.debian.org/BUGNUMBER  
      https://bugs.debian.org/PACKAGENAME

[bugs.debian.org](https://www.debian.org/Bugs/)  
- Search for bugs with severity: Critical. Grave and Serious  
- Select Bugs "in packages maintained by "packages@qa.debian.org"

Another way to search for bugs:  
[udd.debian.org/bugs](https://udd.debian.org/bugs)  
Filter:   
- tagged: ftbfs(fails to build from source - package is not being compiled)

Get following informatio to filter:
- User and Usertags

#### Bug consulting in command line
```bash
apt install devscripts
man bts | grep select
bts select package:openarena
bts status:493739
bts select maintainer:packages@qa.debian.org status:open severity:critical severity:grave severity:serious
bts select maintainer:packages@qa.debian.org status:open usertag:ftbfs-gcc-14 users:debian-gcc@lists.debian.org
```

#### Create the environment:
```bash
apt install lxc
lxc-create -n dev-unstable -t debian -- -r unstable
lxc-start dev-unstable
lxc-attach dev-unstable
 - Inside the environment
apt update
echo "deb-src http://deb.debian.org/debian unstable main" >> /etc/apt/sources.list
apt update
```


Check if the bug was('nt) fixed outside Debian:  
https://tracker.debian.org/nameofpackage  
Clicking in other distros redirects to: https://repology.org/project/nameofpackage

#### Starting fixing the bug:
```bash
lxc-attach dev-unstable
mkdir -p /pkgs/nameofpackage; cd /pkgs/nameofpackage
apt source nameofpackage
cd nameofpackage
debuild

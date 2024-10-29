<p align="center"> <img src="https://github.com/vlpontes/debian-contrib/blob/main/images/underconstruction.png">


# Debian Contributions

What is **Debian**?   
- [Debian Official Website](https://www.debian.org/)  

Find out 
[HERE](https://www.debian.org/intro/help) how you can contribute to Debian  

Packages in need of a maintainer:
- [Orfan Packages](https://qa.debian.org/developer.php?email=packages@qa.debian.org)

Bugs: https://bugs.debian.org/**BUGNUMBER**    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;https://bugs.debian.org/**PACKAGENAME**

[bugs.debian.org](https://www.debian.org/Bugs/)  
- Search for bugs with severity: Critical. Grave and Serious  
- Select Bugs "in packages maintained by "**packages@qa.debian.org**"

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
docker run -it \
--name debian-bugfix \
vlpontes/debian-bugfix:latest
```


#### Check if the bug was('nt) fixed outside Debian:  
https://tracker.debian.org/**package_name**  
Clicking in "other distros" redirects to: https://repology.org/project/**package_name**

<details>
<summary>Starting fixing the bug:</summary>  

```bash
mkdir package_name; cd package_name # create a folder with the name of the package
apt source package_name # download the source code of the package
cd package_name-version # after downloading it extracts a folder with the name of the package
debuild # compile the source code
```
</details>  

<details>
<summary>Create a patch to the fix:</summary>  

```bash 
ls debian/patches # to check the name of previous patches
dpkg-source --commit # to create a patch
debuild # compile the package you just fixed
debi # to install and test the fixed package before sending to Debian
```
</details>


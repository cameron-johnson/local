How to move docker data directory to another location on Ubuntu
tested 02/2021


ihttps://www.guguweb.com/2019/02/07/how-to-move-docker-data-directory-to-another-location-on-ubuntu/

```
sudo service docker stop
```

add to /etc/docker/daemon.json:

```
{
   "data-root": "/path/to/your/docker"
}
```

```
sudo rsync -aP /var/lib/docker/ /path/to/your/docker
```

```
sudo mv /var/lib/docker /var/lib/docker.old
```


```
sudo service docker start
```

If that all works:
```
sudo rm -rf /var/lib/docker.old
```


Then Minikube didn't work, per this problem:
https://unix.stackexchange.com/questions/546822/why-does-sudo-fail-inside-docker-complaining-about-nosuid

solution:
sudo mount -n -o remount,suid /mount/for/var/lib/docker


# Project

This project tests a very simple CI/CD toolchain.
It uses :
- Git/GitHub as Source Code Management
- Jenkins as Integration Server and Deployment Server

This project catches source code on Github and build a Docker image. Then it deploys it on the local environment.

I'm currently working on Ubuntu 16.04 LTS in a Virtualbox VM.

# Git commands to update source code

Commands :
```
git add <file>
git commit -m "<message>"
git push <repository> <branch>
``` 

This Git contains a very simple web application in Python / Flask framework.
There are only 2 html pages with a link between them.

# Requirements
Install Jenkins :

You have to pull the official image :
```
docker pull jenkins/jenkins
```

Then, you run the image sharing the docker.sock file to have an access to the host docker engine:
```
docker run -p 49001:8080 -v /var/run/docker.sock:/var/run/docker.sock --name jenkins jenkins
```

# Remote Docker API

This section is to use Docker Host Engine from a dockerized jenkins slave.

Local IP Address : 172.17.0.1

In the /lib/systemd/system/docker.service, search for ExecStart and add this :
```
ExecStart=/usr/bin/docker daemon -H fd:// -H tcp://0.0.0.0:4243
```
Then you'll have to restart daemon and service :
```
sudo systemctl daemon-reload
sudo service docker restart
```

you can test with the following commands :
```
curl http://localhost:4243/version
curl http://172.17.0.1:4243/version
```

Source : https://scriptcrunch.com/enable-docker-remote-api/

# Jenkins configuration

Plugins recommanded installed.

Creation of a project pipeline, checking the SCM.
- In "Pipeline" parameters : 
	- Source : Git
	- Repository and credentials fullfilled
	- Branches to build : master
	- Script path : Jenkinsfile

- In "Manage Jenkins -> Configure System -> Cloud" section :
	- Choose Docker
	- Docker Host URI : tcp:172.17.0.1:4243
	- Docker agent templates :
		- Docker name : docker-slave
		- Docker image : citizenstig/jenkins-slave-python 
This section is to use Docker Host API when building an image in a dockerized jenkins slave.

Sources :
- https://devopscube.com/docker-containers-as-build-slaves-jenkins
- https://blog.nimbleci.com/2016/08/31/how-to-build-docker-images-automatically-with-jenkins-pipeline
- https://getintodevops.com/blog/building-your-first-docker-image-with-jenkins-2-guide-for-developers

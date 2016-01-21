#! /bin/bash

PWD=`pwd`

startJenkins(){
    JENKINS_HOME=$PWD"/jenkins/home"
    docker run --name jenkins -p 8080:8080 -p 50000:50000 -v $JENKINS_HOME:/var/jenkins_home daniel-jenkins
}

JENKINS="`docker ps -a|grep jenkins`"
if [ -n "$JENKINS" ];
then 
    echo "Jenkins  exists, try starting it"
    docker start jenkins	
else 
    echo "Starting a new jenkins container"
    startJenkins
fi

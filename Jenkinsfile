pipeline {

	agent any

	stages{
        	stage('Clone repository'){
                	steps{
				checkout scm
        		}
		}

		stage ('Remove latest image'){
			steps{
				sh 'sudo docker rmi $(sudo docker images -q flask-jenkins)'
			}
		}
        	
		stage ('Build image'){
			steps{
				sh 'sudo docker build -t flask-jenkins:latest .'
        		}
		}
        	
		stage ('Deploy image'){
			steps{
				sh 'sudo docker run -p 5000:5000 -h 0.0.0.0 flask-jenkins:lastest'
			}
		}
	}
}

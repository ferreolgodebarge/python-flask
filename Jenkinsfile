pipeline {

	agent any

	stages{
        	stage('Clone repository'){
                	steps{
				checkout scm
        		}
		}

        	stage ('Build image'){
                	
			steps{
				sh 'sudo docker build -t flask-jenkins:v1.03 .'
        		}
		}
        }
}


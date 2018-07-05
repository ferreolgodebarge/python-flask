node {
	stages{
        	stage('Clone repository'){
                	checkout scm
        	}

        	stage ('Build image'){
                	bash 'sudo docker build -t flask-jenkins:v1.03 .'
        	}
        }
}


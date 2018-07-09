pipeline {

	agent any

	stages{
        	stage ('Clone Git repository'){
                	steps{
				checkout scm
        		}
		}
		
		stage ('delete previous container'){
			steps{
				script{
					try{
						sh 'sudo docker rm -f $(sudo docker ps -f label=flask-jenkins)'
					}
					catch (exc){}
				}
			}
		}

		stage ('delete previous image'){
			steps{
				script{
					try{	
						sh 'sudo docker rmi $(sudo docker images -q flask-jenkins)'
					}
					catch (exc){}
				}
			}
		}

		stage ('Build image'){
			steps{
				sh 'sudo docker build --label app=flask-jenkins -t flask-jenkins:latest .'
        		}
		}
        	
		stage ('Deploy image'){
			steps{
				sh 'sudo docker run -d -p 5000:5000 -h 0.0.0.0 -l app=flask-jenkins flask-jenkins:latest'
			}
		}
	}
}

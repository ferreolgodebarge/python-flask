pipeline {

	agent any

	stages{
        	stage ('Clone Git repository'){
                	steps{
				checkout scm
        		}
		}
		
		stage ('delete previous container'){
			try{
				steps{
					sh 'sudo docker rm -f $(sudo docker ps -f label=flask-jenkins)'
				}
			}
			catch (exc){
				echo 'delete container failed'
				throw
			}
		}

		stage ('delete previous image'){
			try{	
				steps{
					sh 'sudo docker rmi $(sudo docker images -q flask-jenkins')
				}
			}
			catch (exc){
				echo 'delete image failed' 
				throw
			}
		}

		stage ('Build image'){
			steps{
				sh 'sudo docker build -l flask-jenkins -t flask-jenkins:latest .'
        		}
		}
        	
		stage ('Deploy image'){
			steps{
				sh 'sudo docker run -d -p 5000:5000 -h 0.0.0.0 -l flask-jenkins flask-jenkins:latest'
			}
		}
	}
}

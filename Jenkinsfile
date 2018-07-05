node {
        def app

        stage('Clone repository'){
                checkout scm
        }

        stage ('Build image'){
                steps{
                        sh 'sudo docker build -t flask-jenkins:v1.03 .'
                }
        }
}


properties([pipelineTriggers([githubPush()])])
pipeline{
    agent any
    tools {
        maven 'MAVEN'
    }
    stages {
        stage('Build Maven') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'github-account', url: 'https://github.com/soban252/docker-java-sample-webapp']]])

                sh "mvn clean install"
                sh "cd target"
                sh "ls -a"
                
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                  sh 'docker build -t soban252/my-app-3.0 .'
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                script {
                 withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u soban252 -p ${dockerhubpwd}'
                 }  
                 sh 'docker push soban252/my-app-3.0'
                }
            }
        }
    }
}

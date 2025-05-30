pipeline{
  agent any
  tools {
    maven 'maven'
  }
  environment {
    DOCKERHUB_USERNAME = "venugopaldr"
  }
  stages{
    stage('clean'){
      steps{
        sh 'mvn clean'
      }
    }
    stage('validate'){
      steps{
        sh 'mvn validate'
      }
    }
    stage('test'){
      steps{
        sh 'mvn test'
      }
    }
    stage('package'){
      steps{
        sh 'mvn package'
      }
    post {
      success {
        echo 'Build succeeded!'
      }
    }
    }
    stage('build docker image'){
      steps{
        sh 'docker build -t zomato .'
      }
      post {
        success {
          echo 'Docker image built successfully!'
        }
        failure {
          echo 'Docker image build failed!'
        }
      }
    }
    stage('push to docker hub'){
      steps{
        script {
          sh"""
          docker tag zomato ${DOCKERHUB_USERNAME}/zomato
          docker push ${DOCKERHUB_USERNAME}/zomato
          """
        }
      }
    }
        stage('remove docker image locally'){
          steps{
              sh"""
              docker rmi ${DOCKERHUB_USERNAME}/zomato
              """
          }
          }
          stage('stop and restart'){
            steps{
                sh"""
                docker rm -f app
                docker run -it -d --name app -p 8081:8080 ${DOCKERHUB_USERNAME}/zomato
                """
              }
            }
          }
          post {
            success {
              echo 'Deployment succeeded!'
            }
            failure {
              echo 'Deployment failed!'
            }
          }
        }

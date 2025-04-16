pipeline{
  agent any
  stages{
    stage('print info'){
      steps{
        sh """
        uptime
        whoami
        pwd
        hostname
        echo ${env.BUILD_ID}
        echo ${env.JOB_NAME}
        """
      }
    }
  }
}

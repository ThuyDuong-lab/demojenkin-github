pipeline {
  agent any
  stages {
    stage('Pipeline1') {
      parallel {
        stage('Pipeline1') {
          steps {
            echo 'pipeline1'
          }
        }

        stage('pipeline2') {
          steps {
            echo 'pipeline2'
          }
        }

        stage('pipeline3') {
          steps {
            echo 'p3'
          }
        }

      }
    }

    stage('wait to complete') {
      steps {
        waitForBuild '1'
      }
    }

    stage('Send mail') {
      steps {
        mail(subject: 'Announcement - Run completely', body: 'CICD run done', to: 'thuy.phuong.duong@agest.vn')
      }
    }

    stage('Final') {
      steps {
        echo 'run completely'
      }
    }

  }
}
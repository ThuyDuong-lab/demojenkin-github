pipeline {
  agent {
    node {
      label 'Slave1'
    }

  }
  stages {
    stage('Pipeline1') {
      parallel {
        stage('Pipeline1') {
          steps {
            bat "mvn test -Dtest=KarateRunner"
          }
        }

        stage('pipeline2') {
          steps {
            bat "mvn test -Dtest=KarateRunner"
          }
        }

        stage('pipeline3') {
          steps {
            bat "mvn test -Dtest=KarateRunner"
          }
        }

      }
    }

    stage('Final') {
      steps {
        echo 'run completely'
      }
    }

  }
}

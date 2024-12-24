pipeline {
  agent any
  stages {
    stage('Pipeline1') {
      parallel {
        stage('Stage1') {
          steps {
            bat "mvn test -Dtest=KarateRunner"
          }
        }

        stage('Stage2') {
          steps {
            bat "mvn test -Dtest=KarateRunner1"
          }
        }

        stage('Stage3') {
          steps {
            // Add your steps here if you want to run something for Pipeline3
            // bat "mvn test -Dtest=KarateRunner"
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

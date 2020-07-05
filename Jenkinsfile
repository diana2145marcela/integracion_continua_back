pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('Pruebas unitarias') {
      steps {
        sh 'bundle exec rspec'
      }
    }

  }
}
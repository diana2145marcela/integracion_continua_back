pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('Instalacion librerias') {
      steps {
        sh 'gem install bundler -v 2.0.1'
      }
    }

    stage('build') {
      steps {
        sh 'bundle install'
      }
    }

    stage('Pruebas') {
      steps {
        sh 'bundle exec rspec'
      }
    }

  }
}
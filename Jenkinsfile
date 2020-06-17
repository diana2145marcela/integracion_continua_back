pipeline {
  agent {
    docker {
      image 'ruby:2.6.5'
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
pipeline {
  agent {
    node {
      label 'localhost_vagrant'
    }

  }
  options {
    buildDiscarder(logRotator(numToKeepStr:'10'))
  }
  stages {
    stage('Build Atlassian Plugin Development Image') {
      steps {
        sh 'if [ ! -f $SW_FILE ]; then cp "$SW_DIR/$SW_FILE" $SW_FILE; fi'
        withCredentials([usernamePassword(credentialsId: 'store.docker', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''docker login --username $USERNAME --password $PASSWORD
docker build --tag tkleiber/atlassian:$SW_VERSION --build-arg SW_FILE=$SW_FILE .'''
        }
      }
    }
    stage('Push Docker Image to Local Registry') {
      steps {
        sh 'docker tag tkleiber/atlassian:$SW_VERSION localhost:5000/tkleiber/atlassian:$SW_VERSION'
        sh 'docker push localhost:5000/tkleiber/atlassian:$SW_VERSION'
      }
    }
    stage('Cleanup') {
      steps {
        sh 'docker rmi --force localhost:5000/tkleiber/atlassian:$SW_VERSION'
        sh 'docker rmi --force tkleiber/atlassian:$SW_VERSION'
      }
    }
  }
  environment {
    SW_VERSION = '1.0.0'
    SW_FILE = 'ideaIC-2017.3.3.tar.gz'
    SW_DIR = '/software/Atlassian'
  }
}

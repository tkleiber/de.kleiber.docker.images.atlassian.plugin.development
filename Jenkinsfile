pipeline {

  agent {
    node {
      label 'docker_in_docker'
    }
  }

  environment {
    SW_VERSION = '2021.3.2'
    SW_FILE = 'ideaIC-2021.3.2.tar.gz'
    SW_DIR = '/software/saved/IntelliJ'
  }

  options {
    buildDiscarder logRotator(numToKeepStr: '1')
  }

  stages {

    stage('Build Atlassian Plugin Development Image') {
      steps {
        sh 'if [ ! -f $SW_FILE ]; then cp "$SW_DIR/$SW_FILE" $SW_FILE; fi'
        withCredentials([usernamePassword(credentialsId: 'docker_hub_id', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
            export DOCKER_BUILDKIT=1
            docker login --username $USERNAME --password $PASSWORD
            docker build --progress=plain --tag tkleiber/atlassian:$SW_VERSION --build-arg SW_FILE=$SW_FILE .'''
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

}

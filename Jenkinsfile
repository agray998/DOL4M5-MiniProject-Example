pipeline {
  agent any

  stages {
    stage('Checkout Code') {
      steps {
        git url: "https://gitlab.com/Reece-Elder/devops-m5-nodeproject", branch: "main"
      }
    }
    stage('Install Deps') {
      steps {
        sh "npm install"
      }
    }
    stage('Run App') {
      steps {
        sh "sudo npm install -g forever"
        sh "forever start index.js"
      }
    }
  }
}

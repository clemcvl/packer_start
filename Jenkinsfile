pipeline {
  agent any
  parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
  }
  environment {
    TF_IN_AUTOMATION = 'true'
    AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
  }
  stages {
   stage('clone repo') {
      steps {
        sh "ls -al && cd terraform && ls -al && env"
      }
    }
    stage('Terraform Init') {
      steps {
        sh "cd terraform && terraform init "
      }
    }
    stage('Terraform Plan') {
      steps {
        sh "cd terraform && terraform plan -out=tfplan "
      }
    }
    stage('Terraform Apply') {
      steps {
        input 'Apply Plan'
        sh "cd terraform && terraform apply -input=false tfplan"
      }
    }
  }
}
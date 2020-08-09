pipeline {
  agent any
  parameters {
    password (name: 'AWS_ACCESS_KEY_ID')
    password (name: 'AWS_SECRET_ACCESS_KEY')
  }
  environment {
    TF_IN_AUTOMATION = 'true'
    TF_VAR_AWS_ACCESS_KEY_ID = "${params.AWS_ACCESS_KEY_ID}"
    TF_VAR_AWS_SECRET_ACCESS_KEY = "${params.AWS_SECRET_ACCESS_KEY}"
  }
  stages {
   stage('clone repo') {
      steps {
        sh "cd packer_start/terraform"
      }
    }
    stage('Terraform Init') {
      steps {
        sh "terraform init -input=false"
      }
    }
    stage('Terraform Plan') {
      steps {
        sh "terraform plan -out=tfplan -input=false"
      }
    }
    stage('Terraform Apply') {
      steps {
        input 'Apply Plan'
        sh "terraform apply -input=false tfplan"
      }
    }
  }
}
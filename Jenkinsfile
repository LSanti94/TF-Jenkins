pipeline{
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Toggle this value')
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
  agent any
   stages {
       stage('checkout') {
           steps {
                script{
                      dir("terraform")
                      {
                          git "https://github.com/LSanti94/TF-Jenkins.git"
                      }
                  }
              }
          }
       stage('Install Terraform') {
            steps {
                sh '''
                curl -O https://releases.hashicorp.com/terraform/1.0.11/terraform_1.0.11_linux_amd64.zip
                unzip terraform_1.0.11_linux_amd64.zip
                sudo mv terraform /usr/local/bin/
                terraform --version
                '''
            }
        }
       stage('fmt') {
           steps {
               sh 'pwd;cd terraform/ ; ls ; terraform fmt'
           }
       }
       stage('plan') {
           steps {
               sh 'pwd;cd terraform/ ; terraform plan -out tfplan'
               sh 'pwd;cd terraform/ ; terraform show -no-color tfplan > tfplan.txt'
           }
       }
       stage('Approval') {
          when {
              not {
                  equals expected: true, actual: params.autoApprove
              }
          }
          steps {
              script {
                   def plan = readFile 'terraform/tfplan.txt'
                   input message: "Do you want to apply the plan?"
                   parameters: [text(name: 'plan', description: 'Check review the plan', defaultValue: plan)]
              }
          }
       }
        stage('deploy') {
            steps {
                sh 'pwd;cd terraform/ ; terraform apply -input=false tfplan'
              }
          }
      }
  }

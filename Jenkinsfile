
pipeline {
   
   agent any

    environment {
        // Use Jenkins credentials for AWS access
        AWS_ACCESS_KEY_ID = credentials('default') // Use 'default' for the access key credential ID
        AWS_SECRET_ACCESS_KEY = credentials('default') // Use 'default' for the secret key credential ID
        AWS_DEFAULT_REGION = 'us-east-1' // Set your desired AWS region
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your Terraform project from Git
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }

        stage('Terraform Plan') {
            steps {
                // Generate a Terraform execution plan
                sh 'terraform plan -out=tfplan'
            }
        }

        stage('Terraform Apply') {
            when {
                // Only apply changes on specific conditions (e.g., after manual approval)
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                // Apply the Terraform changes
                input message: 'Deploy infrastructure?', ok: 'Deploy'
                sh 'terraform apply tfplan'
            }
        }

        stage('Terraform Destroy') {
            when {
                // Optionally, add a stage to destroy the infrastructure (e.g., for cleanup)
                expression { currentBuild.resultIsBetterOrEqualTo('SUCCESS') }
            }
            steps {
                // Destroy the Terraform resources
                input message: 'Destroy infrastructure?', ok: 'Destroy'
                sh 'terraform destroy'
            }
        }
    }

    post {
        success {
            // Optionally, add post-build actions or notifications on success
            echo 'Infrastructure provisioned successfully!'
        }
        failure {
            // Optionally, add actions on pipeline failure
            echo 'Infrastructure provisioning failed!'
        }
    }
}
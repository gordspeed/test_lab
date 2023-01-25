pipeline {
    agent { label 'agent' }
    stages {
        stage('Build') {
            steps {
                sh 'packer init ubuntu.pkr.hcl'
                sh 'packer build ubuntu.pkr.hcl'
            }
        }
    }
}

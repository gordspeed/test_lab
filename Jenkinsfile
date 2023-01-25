pipeline {
    agent { label 'agent' }
    stages {
        stage('Build') {
            steps {
                sh 'packer init .'
                sh 'packer build .'
            }
        }
    }
}

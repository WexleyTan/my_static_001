pipeline {
    agent { label 'b' }
    stages {
        stage('Build Image') {
            steps {
                sh 'docker build -t nextjs_jenkins .'
            }
        }
    }
}

pipeline {
    agent any

    environment {
      PASS = credentials('registry-pass')
} 
    stages {
        stage('Build') {
            steps {
                sh '''
                   ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                   ./jenkins/build/build.sh
                '''
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/test/test-mvn.sh mvn test'
            }
        }
        stage('Push') {
            steps {
               sh '''
                     ./jenkins/push/push.sh
               '''
            }
        }
        
        stage('Cleanup') {
		steps {
			sh './jenkins/build/mvn.sh mvn clean'
			deleteDir()
		    }
	    }
    }
	post {
        always {
            echo 'Limpando diretorios'
            sh './jenkins/build/mvn.sh mvn clean'
	    deleteDir()
        }
    }
}


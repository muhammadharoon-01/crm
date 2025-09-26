pipeline {
    agent any
    
    parameters {
        choice(
            name: 'BROWSER',
            choices: ['safari', 'chrome', 'firefox'],
            description: 'Browser to run tests on'
        )
        string(
            name: 'TAGS',
            defaultValue: '',
            description: 'Specific tags to run (optional)'
        )
    }
    
    environment {
        SAUCE_USERNAME = credentials('oauth-anwarharoon1307-33a73')
        SAUCE_ACCESS_KEY = credentials('0c5e43da-fb50-423b-820f-747ce93e682e')
    }
    
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', 
                url: 'https://github.com/muhammadharoon-01/crm.git'
            }
        }
        
        stage('Setup') {
            steps {
                sh '''
                    python -m pip install --upgrade pip
                    pip install robotframework
                    pip install robotframework-seleniumlibrary
                    pip install selenium
                '''
            }
        }
        
        stage('Run Tests') {
            steps {
                script {
                    def tagOption = params.TAGS ? "--include ${params.TAGS}" : ""
                    sh """
                        robot ${tagOption} --variable BROWSER:${params.BROWSER} tests/
                    """
                }
            }
            post {
                always {
                    // Archive test results
                    robot outputPath: '.', passThreshold: 80.0, unstableThreshold: 60.0
                    
                    // Publish HTML report
                    publishHTML([
                        allowMissing: false,
                        alwaysLinkToLastBuild: true,
                        keepAll: true,
                        reportDir: '.',
                        reportFiles: 'report.html',
                        reportName: 'Robot Framework Report'
                    ])
                }
            }
        }
    }
    
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
    }
}
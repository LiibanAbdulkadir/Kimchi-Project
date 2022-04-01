pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/LiibanAbdulkadir/Kimchi-Project.git'
            }
             stage('Robot Framework System tests with Selenium') {
                    steps {

                        sh 'robot --variable BROWSER:headlesschrome -d Results  Tests'
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'RobotPublisher',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/output.xml',
                                          reportFileName      : '**/report.html',
                                          logFileName         : '**/log.html',
                                          disableArchiveOutput: false,
                                          passThreshold       : 50,
                                          unstableThreshold   : 40,
                                          otherFiles          : "**/*.png,**/*.jpg",
                                        ]
                                       )
                                  }
                            }
                        }
                    }
            }
        }
    }

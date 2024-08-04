pipeline {
    agent any
    stages {
        stage('Git Clone') {
            steps {
                echo 'Git Clone start'
                git branch: 'main', url: 'https://github.com/Ludo-SMP/ludo-backend.git'
		withCredentials([GitUsernamePassword(credentialsId: 'submodule_configuration', gitToolName: 'Default')]) {
                    echo 'submodule fetching start'
                    sh 'git submodule init'
                    sh 'git submodule update'
                    echo 'submodule fetching end'
                }
                echo 'Git Clone success'
            }
        }
        
	# deprecated
        # stage('Test') {
        #    steps {
        #        dir('./') {
        #            echo 'Test start'
        #            sh './gradlew clean test'
        #            echo 'Test success'
        #        }
        #    }
        #}
        
        stage('Build') {
            steps {
                dir('./') {
                    echo 'Build start'
                    sh './gradlew bootJar'
                    echo 'Build success'
                }
            }
        }
        
        stage('Deploy') {
            steps {
                dir('./build/libs/') {
                    sshagent(credentials:['ludo-backend-ssh']) {
                        echo 'Deploy start'

                        # 그라파나, 프로메테우스 재실행 쉘 스크립트 필요 + 환경변수
                        # 1. docker hub push, 모니터링 인스턴스 docker hub pull
                        # 2(V). docker-compose.yaml 파일을 그냥 배포, 인스턴스에서 쉘 스크립트 실행
                        sh 'scp study-matching-platform-0.0.1-SNAPSHOT.jar archa@35.185.251.89:/home/archa'
                        echo 'Deploy end'
                        sh 'ssh -t archa@35.185.251.89 /home/archa/run.sh'
                    }
                }
            }
        }
    }
}

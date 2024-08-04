# ludo-backend-cicd

### docker-compose.yml
- JDK17 Jenkins 이미지를 빌드하는 docker-compose yaml 파일입니다.
- 도커로 젠킨스를 구축 후, 호스트 인스턴스 IP와 port 번호로 웹에서 Jenkins 어드민 페이지에 접속하면 됩니다.
```text
# in gcp instance console
docker-compose up [options]

# in web
xx.xx.xx.xx:8080(default)
```

### JenkinsFile
- Jenkins 파이프라인 스크립트입니다. 위에서 접속한 어드민 페이지에서 스크립트를 구성할 수 있습니다.
- Step은 크게 3가지 - Clone, Build, Deploy 로 구성됩니다.
- Test Step 은 미팅 때 논의한대로, git actions 로 이관합니다.
- 자세한 스크립트 설명은 [젠킨스 파이프라인 구축 Ludo 백엔드 위키](https://github.com/Ludo-SMP/ludo-backend_wiki/blob/main/%EC%A0%A0%ED%82%A8%EC%8A%A4%20CI.CD%20%ED%8C%8C%EC%9D%B4%ED%94%84%EB%9D%BC%EC%9D%B8%20%EA%B5%AC%EC%B6%95/README(%EC%9E%91%EC%84%B1%EC%A4%91).md)를 참고해주세요.


### run.sh
- 배포한 Jar를 실행하는 자동화 스크립트입니다.
- 해당 스크립트는 아래의 Jenkins 파이프라인 스크립트 경로와 동일한 경로에 위치시켜야 합니다.
- ```shell
  sh 'ssh -t ludo@xx.xx.xx.xx /home/build/run.sh'
  ```
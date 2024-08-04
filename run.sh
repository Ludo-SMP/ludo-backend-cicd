#! /bin/bash

PROJECT_NAME=study-matching-platform
CURRENT_PID=$(pgrep -f ${PROJECT_NAME}-.*.jar | head -n 1)

if [ -z "$CURRENT_PID" ]; then
        echo "구동중인 애플리케이션이 없습니다."
else
        echo "구동중인 애플리케이션을 종료합니다. (pid : $CURRENT_PID)"
        sudo kill -15 $CURRENT_PID
        echo "구동중인 애플리케이션을 종료했습니다. (pid : $CURRENT_PID)"
fi

echo "SpringBoot 애플리케이션을 실행합니다."

JAR_NAME=$(ls | grep .jar | head -n 1)
echo "JAR_NAME = "$JAR_NAME""
sudo nohup java -jar ./$JAR_NAME --spring.profiles.active=prod > /dev/null 2>&1 &

NEW_PID=$(pgrep -f ${PROJECT_NAME}-.*.jar | head -n 1)
echo "SpringBoot 애플리케이션 실행이 완료되었습니다."
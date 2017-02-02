set AWS_ACCESS_KEY_ID=%1
set AWS_SECRET_ACCESS_KEY=%2
set MACHINE_NAME=%3
set AWS_DEFAULT_REGION=ap-northeast-2
rem set AWS_SECURITY_GROUP=
set AWS_INSTANCE_TYPE=t2.micro
rem set AWS_SSH_USER=

docker-machine.exe create --driver amazonec2 --amazonec2-access-key %AWS_ACCESS_KEY_ID% --amazonec2-secret-key %AWS_SECRET_ACCESS_KEY% %MACHINE_NAME%
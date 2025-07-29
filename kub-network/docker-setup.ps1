docker build -t pensiveeagle/kub-net-demo:users-api-1 ./users-api

docker build -t pensiveeagle/kub-net-demo:tasks-api-1 ./tasks-api

docker build -t pensiveeagle/kub-net-demo:auth-api-1 ./auth-api

docker build -t pensiveeagle/kub-net-demo:frontend-1 ./frontend

docker push pensiveeagle/kub-net-demo:users-api-1

docker push pensiveeagle/kub-net-demo:tasks-api-1

docker push pensiveeagle/kub-net-demo:auth-api-1

docker push pensiveeagle/kub-net-demo:frontend-1
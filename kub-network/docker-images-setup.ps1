$registry_account_name = "pensiveeagle"
$repository_name = "kub-net-demo"

docker build -t $registry_account_name/$repository_name":users-api-1" ./users-api

docker build -t $registry_account_name/$repository_name":tasks-api-1" ./tasks-api

docker build -t $registry_account_name/$repository_name":auth-api-1" ./auth-api

docker build -t $registry_account_name/$repository_name":frontend-1" ./frontend

docker push $registry_account_name/$repository_name":users-api-1"

docker push $registry_account_name/$repository_name":tasks-api-1"

docker push $registry_account_name/$repository_name":auth-api-1"

docker push $registry_account_name/$repository_name":frontend-1"
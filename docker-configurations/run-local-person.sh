mkdir -p ~/local
cd ~/local
docker compose down
curl https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/docker-compose-person.yaml > docker-compose.yaml
docker compose up --detach
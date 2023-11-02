mkdir -p ~/local
cd ~/local
docker compose down
curl curl https://raw.githubusercontent.com/agile-learning-institute/institute/main/docker-compose/docker-compose-person.yaml > docker-compose.yaml
docker compose up --detach

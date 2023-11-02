mkdir -p ~/local
cd ~/local
docker compose down
curl curl https://raw.githubusercontent.com/agile-learning-institute/institute/main/docker-compose/run-local-person.sh > docker-compose.yaml
docker compose up --detach

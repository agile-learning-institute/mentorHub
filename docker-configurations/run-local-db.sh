docker compose down
curl --create-dirs --output-dir ~/local https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/docker-compose.yaml
docker compose --project-directory ~/local up --detach

if [ ! -z "$1" ]; then
	export COMPOSE_PROFILES="$1"
fi

docker compose --project-directory ~/local down
curl --create-dirs --output-dir ~/local --output docker-compose.yaml https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/docker-compose.yaml
docker compose --project-directory ~/local up --detach

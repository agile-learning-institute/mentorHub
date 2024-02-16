if [ ! -z "$1" ]; then
	export COMPOSE_PROFILES="$1"
fi

compose_dir="$(mktemp -d)"

docker compose --project-directory "$compose_dir" down
curl --create-dirs --output "$compose_dir/docker-compose.yaml" https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/docker-compose.yaml
docker compose --project-directory "$compose_dir" up --detach && {


cat > compose-down.sh << EOF
#!/bin/sh

docker compose --project-directory "$compose_dir" --profile "$1" down && rm -r "$compose_dir" && rm "\$0"
EOF


chmod u+x compose-down.sh

echo "To stop the containers, just execute compose-down.sh"

}

if [ ! -z "$1" ]; then
	export COMPOSE_PROFILES="$1"
fi

compose_dir="$(mktemp -d)"

[ -f /tmp/compose-down.sh ] && /tmp/compose-down.sh
curl --create-dirs --output "$compose_dir/docker-compose.yaml" https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/docker-compose.yaml
docker compose --project-directory "$compose_dir" up --detach && {


cat > /tmp/compose-down.sh << EOF
#!/bin/sh

docker compose --project-directory "$compose_dir" --profile "$1" down && rm -r "$compose_dir" && rm "\$0"
EOF


chmod u+x /tmp/compose-down.sh

echo "To stop the containers, just execute /tmp/compose-down.sh"

}

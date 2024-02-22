# Docker Configurations

This folder contains the master docker-compose.yaml file, as well as templates for various 2-stage build Dockerfiles

## Testing locally
If you've made a change to the docker-compose, you can check if there are any errors with `docker-compose -f <$PATH-TO-COMPOSE-YAML-HERE> config`. If there are any syntax errors in your docker compose, they will be printed to the console. You will have to run the command after every fix until it stops returning errors, as it only prints one error at a time.
NOTE: It doesn't detect typos for stuff like environment variables or other variable values like profile names.


If there are no errors detected, you should get an output that looks like the snippet below.
```bash
name: <$DIRECTORY-NAME-HERE>
services: {}
```

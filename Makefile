# Makefile

.PHONY: install

install:
	cp ./docker-configurations/docker-compose.yaml ~/Applications/MentorHub-DE/mentorHub
	cp ./mentorHub-developer-edition/mh ~/Applications/MentorHub-DE/mentorHub

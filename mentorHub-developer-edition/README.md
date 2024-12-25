# MentorHub Developers Edition

If you are a software engineer contributing to the mentorHub platform, or a software quality engineer, or just a someone interested in running the mentorhub platform locally, you can install and use MentorHub - Developers Edition.

## Prerequisites

- [ ] MacOS or Linux.
  - If you are a Windows user follow the Virtual Machine from [Odin Foundations installations lesson](https://www.theodinproject.com/lessons/foundations-installations#os-installation). This software will **not** run in Windows or WSL. 
- [ ] [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [ ] zsh Shell. This is the Default shell for MacOS, [install for linux users](https://phoenixnap.com/kb/install-zsh-ubuntu) - you can do the basic install, it doesn't need to be your default shell or have any extra tools. So long as the ``!/bin/zsh`` shebang works correctly you should be good to go.

## Installation

Execute the following command from your terminal window, and identify an installation location when prompted, and your done.

```bash
/bin/bash <(curl https://raw.githubusercontent.com/agile-learning-institute/mentorHub/main/mentorHub-developer-edition/install)
```
NOTE: This will download ~7Gb of Docker Container images. Make appropriate network bandwidth plans, and make sure you have the free space for Docker to download these files. 

## Local access to MongoDB 

Access to the MongoDB from you machine requires configuration of the mongodb host in your /etc/hosts file. You can use the following command to make this change. 
```sh
echo '127.0.0.1 mongodb' | sudo tee -a /etc/hosts
```

## Use

After installation you can use the ``mh`` command to manage the mentorHub micro-services. Here are a few examples.

### See usage options
```bash
mh --help
```

### Bring the system up
You can use the ``mh up`` command to start different components within the system. Using ``mh up`` without any parameters will show you a list of the available profiles. In general the mongodb service is used by most microservices, the services in the [architecture](../specifications/ARCHITECTURE.md) each have an -api (i.e. person-api) and full (i.e. person) profile that start the database, api and UI accordingly. If you want to run everything you can use ``mh up all`` - this will require ~4Gb of docker volume space. 
```bash
mh up person
```
NOTE: To run multiple profiles, separate profile names with a ,
```bash
mh up person,search
```
NOTE: You can also bring up services one at a time
```bash
mh up person
mh up search
```

### Stop running services, server state is preserved.
```bash
mh stop
```

### Start previously stopped services
```bash
mh start
```

### Bring all of the containers down (state is lost)
```bash
mh down
```

## How to access the system
So you've started a set of containers, and you can see them running in docker desktop, now what? Well the answer depends on what you are working on or interested in. The Search UI can be found at [http://localhost] if it's running. If you want to use a specific UI, or access a specific API you can find details about ports and paths in those repo README files. 

## Troubleshooting

### Install fails with the following errors

```bash
Shell Config .zshrc not found
Shell Config .zshrc not found
```

This indicates that you do not have an initialization file. Issue the following command, and then re-run the install.

#### Mac

```bash
touch ~/.zshrc
```

#### Linux

```bash
touch ~/.bashrc
```

### mh command not working on WSL after install

If you've run the install script without errors but still get `mh: command not found`, check your .bashrc file. Here's an example:

```bash
sudo nano ~/.bashrc
```

This will open a terminal text editor. In the text editor you can use the arrow keys (←↑→↓) to move the cursor. Hold the down (↓) arrow key to until you get to the bottom of the file. You might see something like ![image](https://github.com/agile-learning-institute/mentorHub/assets/67389882/1d7ecdd5-1f32-44d1-9b67-a0947e1f86bd) Navigate your cursor to the line with the long comment, move the cursor to the `e` in `export`, and press `enter` to create a new line. To save and exit, press `control + x` then `y` to confirm, then hit `enter` to confirm again. After that, run `source ~/.bashrc` (or where ever your `.bashrc` file is) and try `mh` again. It should work. If not, try restarting your WSL terminal.

# Contributing
If you are interested in contributing to the MentorHub Developer Edition you should familiarize yourself with the [mh zsh script](./mh) and the [docker compose file](../docker-configurations/docker-compose.yaml). If you are editing these files and want to test your changes locally, you can use the following command

```sh
make install
```

This script will copy the mh script and docker-compose file to your ~/Applications/Mentorhub/mentorhub folder, which is the default install location. If you have installed in a different location you will need to manually copy the files to your install location to test things locally.

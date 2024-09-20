# MentorHub Developers Edition

If you are a software engineer contributing to the mentorHub platform, or a software quality engineer, or just a someone interested in running the mentorhub platform locally, you can install and use MentorHub - Developers Edition.

## Prerequisites

- [ ] MacOS or Linux.
  - If you are a Windows user follow the Virtual Machine, or WSL instructions from [Odin Foundations installations lesson](https://www.theodinproject.com/lessons/foundations-installations#os-installation)
- [ ] [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [ ] zsh Shell, Defaut for MacOS, [install for linux users](https://phoenixnap.com/kb/install-zsh-ubuntu)

## Installation

Execute the following command from your terminal window, and identify an installation location when promted, and your done.

```bash
/bin/bash <(curl https://raw.githubusercontent.com/agile-learning-institute/mentorHub/main/mentorHub-developer-edition/install)
```

## Use

After installation you can use the ``mh`` command to manage the mentorHub micro-services. Here are a few examples.

```bash
mh --help
```

```bash
mh up person
```

```bash
mh stop
```

```bash
mh start
```

```bash
mh down
```

## Troubleshooting

### Install fails with the following errors

```bash
Shell Config .zshrc not found
Shell Config .zshrc not found
```

This indicates that you do not have an initilization file. Issue the following command, and then re-run the install.

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
If you are interested in contributing to the MentorHub Developer Edition you should familarize yourself with the [mh zsh script](./mh) and the [docker compose file](../docker-configurations/docker-compose.yaml). If you are editing these files and want to test your changes locally, you can use the following command

```sh
make install
```

This script will copy the mh script and docker-compose file to your ~/Applications/Mentorhub/mentorhub folder, which is the default install locaiton. If you have installed in a different location you will need to manually copy the files to your install location to test things locally.

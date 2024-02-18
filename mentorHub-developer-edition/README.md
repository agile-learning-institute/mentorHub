# MentorHub Developers Edition

If you are a software engineer contributing to the mentorHub platform, or a software quality engineer, or just a someone interested in running the mentorhub platform locally, you can install and use MentorHub - Developers Edition.

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

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

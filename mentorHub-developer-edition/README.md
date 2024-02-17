# MentorHub Developers Edition

If you are a software engineer contributing to the mentorHub platform, or a software quality engineer, or just a someone interested in running the mentorhub platform locally, you can install and use MentorHub - Developers Edition.

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

## Installation

Execute the following command from your terminal window, and identify an installation location when promted, and your done.

```bash
curl https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/mentorHub-DE/install > /bin/bash
```

## Use

After installation you can use the ``mh`` command to manage the mentorHub micro-services. Here are a few examples.

```bash
mh up person
```

```bash
mh start
```

```bash
mh stop
```

```bash
mh down
```

use ``mh --help`` for more detailed information

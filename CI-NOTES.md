# Notes for SRE on CI

## Overview

Each of the following repos:

- [institute-mongodb](https://github.com/agile-learning-institute/institute-mongodb)
- [institute-person-api](https://github.com/agile-learning-institute/institute-person-api)
- [institute-perison-ui](https://github.com/agile-learning-institute/institute-person-ui)

has a /src/docker folder with the following files:

- /src/docker/docker-build.sh
- /src/docker/docker-push.sh
- /src/docker/Dockerfile

docker-build.sh uses docker build to create a single image targeted to the users architecture. docker-push.sh builds multi-architecure images that support amd64 (intel) and arm64(apple) architectures.

### CI Notes

docker-push.sh should probably be depricated once CI is working properly.

the docker-push.sh script can run 400% - 2000% CPU for more than 15 minutes, here is a discussion with ChatGPT on the topic

#### Mike1

why do the npm commands run so much slower when building for arm64 from my amd system?

#### ChatGPT1

When you're building for an architecture that is different from the one you're running on (in your case, building for arm64 on an amd64 system), Docker has to emulate the target architecture. This emulation is managed by QEMU under the hood when using Docker's buildx feature. Emulation is inherently slower than running on native hardware because it involves translating system calls and instructions from one architecture to another in real-time.

Here are some options to improve build times

- Build on Native Hardware: If possible, use an ARM-based system to build the ARM images, which would run at native speed.
- Cloud-Based Build Services: Use cloud-based build services that offer ARM builders (like AWS Graviton processors) to build your ARM images.

#### Mike2

that helps me understand much better, thanks! I'll look into arm builders, the next step in building my system is getting the CI to work in GitHub actions, I'm hoping there will be an arm builder option there.  

#### ChatGPT2

You're welcome! GitHub Actions does indeed support ARM builders. When setting up your CI workflow with GitHub Actions, you can use runs-on to specify the type of runner that you want to use. GitHub provides hosted runners with different architectures, including ARM through the use of self-hosted runners or through GitHub-hosted runners that use emulation.

Here's how you can specify an ARM runner using a self-hosted runner in your workflow file:

```yaml
Copy code
jobs:
  build:
    runs-on: self-hosted
    strategy:
      matrix:
        platform: [ubuntu-latest, ubuntu-arm64]
    steps:
    - name: Checkout code
      uses: actions/checkout@v2
    # ... rest of your steps
```

For GitHub-hosted runners, as of my last update, GitHub Actions didn't natively support ARM runners. However, you can use emulation with buildx in your actions to build multi-arch images. Here's an example of how you might set up a job to build an ARM image using emulation:

```yaml
Copy code
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-action@v1

    - name: Cache Docker layers
      uses: actions/cache@v2
      with:
        path: /tmp/.buildx-cache
        key: ${{ runner.os }}-buildx-${{ github.sha }}
        restore-keys: |
          ${{ runner.os }}-buildx-

    - name: Build and push
      uses: docker/build-push-action@v2
      with:
        context: .
        file: ./Dockerfile
        push: true
        tags: user/app:latest
        build-args: |
          BUILDPLATFORM=${{ matrix.platform }}
        platforms: linux/amd64,linux/arm64
```

This example uses the docker/build-push-action@v2 action to build multi-arch images with buildx, which will handle the emulation for ARM architecture.

Keep in mind that emulation might be slower, as discussed earlier. For CI/CD, this could mean longer build times. If the performance of emulation is not sufficient, you might want to consider using self-hosted runners with ARM architecture or cloud services that provide ARM-based build environments.

Always check the latest GitHub Actions documentation or marketplace for any updates or new features that might be available to improve your CI workflow.

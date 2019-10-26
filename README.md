# Drupal 7 Docker image

[![CircleCI](https://circleci.com/gh/henry40408/docker-drupal-7.svg?style=shield)](https://circleci.com/gh/henry40408/docker-drupal-7) ![Docker Automated build](https://img.shields.io/docker/automated/henry40408/drupal-7) ![Docker Build Status](https://img.shields.io/docker/build/henry40408/drupal-7) ![Docker Pulls](https://img.shields.io/docker/pulls/henry40408/drupal-7) ![Docker Stars](https://img.shields.io/docker/stars/henry40408/drupal-7) ![MicroBadger Layers](https://img.shields.io/microbadger/layers/henry40408/drupal-7) ![MicroBadger Size](https://img.shields.io/microbadger/image-size/henry40408/drupal-7)

> Docker image containing proper configured Drupal 7

## Why create this image?

I have one Drupal 7 website, and I want to migrate it onto Kubernetes cluster, but I cannot upgrade it to next major version (Drupal 8.x), so I create this Docker image to help myself.

## Features

- Copy files with `rsync` when it is necessary.
- Automatically fix file permissions before server starts.

## Usage example

Run Drupal container with the following command:

```sh
$ docker run -it --name drupal-7 \
    -v modules:/var/www/html/modules \
    -v profiles:/var/www/html/profiles \
    -v sites:/var/www/html/sites \
    -v themes:/var/www/html/themes \
    YOUR_USERNAME/drupal-7
```

When the container name is `db`, run with MySQL/MariaDB container with the following command:

```sh
$ docker run -it --name drupal-7 \
    --link db:db \ # <-- option to link two containers
    -v modules:/var/www/html/modules \
    -v profiles:/var/www/html/profiles \
    -v sites:/var/www/html/sites \
    -v themes:/var/www/html/themes \
    YOUR_USERNAME/drupal-7
```

## Development setup

Build Docker image:

```sh
$ docker built -t YOUR_USERNAME/drupal-7 .
```

## How to test

```sh
$ rbenv install
$ bundle
$ bundle exec rspec
```

## Meta

### License

- Drupal: [GNU General Public License, version 2 or later](https://git.drupalcode.org/project/drupal/blob/7.67/LICENSE.txt)

## Contributing

1. Fork it (https://github.com/henry40408/docker-drupal-7/fork)
2. Create your feature branch (git checkout -b feature/foobar)
3. Commit your changes (git commit -am 'Add some foobar')
4. Push to the branch (git push origin feature/foobar)
5. Create a new Pull Request


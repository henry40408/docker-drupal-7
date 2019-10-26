#!/usr/bin/env bash

set -eo pipefail

main() {
    rsync -av --ignore-existing /tmp/drupal-7.67/modules /var/www/html/modules
    rsync -av --ignore-existing /tmp/drupal-7.67/profiles /var/www/html/profiles
    rsync -av --ignore-existing /tmp/drupal-7.67/sites /var/www/html/sites
    rsync -av --ignore-existing /tmp/drupal-7.67/themes /var/www/html/themes
}

main

exec apache2-foreground

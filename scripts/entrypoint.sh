#!/usr/bin/env bash

set -eo pipefail

main() {
    # fix permissions before copy
    chown -R www-data.www-data /tmp/drupal-7.67

    # prepare possibly missing files
    rsync -av --ignore-existing /tmp/drupal-7.67/modules/* /var/www/html/modules
    rsync -av --ignore-existing /tmp/drupal-7.67/profiles/* /var/www/html/profiles
    rsync -av --ignore-existing /tmp/drupal-7.67/sites/* /var/www/html/sites
    rsync -av --ignore-existing /tmp/drupal-7.67/themes/* /var/www/html/themes

    # fix permissions
    chown -R www-data.www-data /var/www/html
}

main

exec apache2-foreground

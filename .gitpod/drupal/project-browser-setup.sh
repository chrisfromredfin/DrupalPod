#!/usr/bin/env bash
ddev composer require drupal/automatic_updates:^3
ddev drush en -y package_manager
ddev drush -y config:set project_browser.admin_settings allow_ui_install true && ddev drush cr
find web/modules/contrib -name ".git" -exec rm -rf {} +

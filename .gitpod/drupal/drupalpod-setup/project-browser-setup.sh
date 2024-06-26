#!/usr/bin/env bash
ddev composer remove mglaman/composer-drupal-lenient
ddev composer require drupal/automatic_updates:^3.1.3
ddev drush en -y project_browser package_manager
ddev drush cset -y package_manager.settings include_unknown_files_in_project_root true

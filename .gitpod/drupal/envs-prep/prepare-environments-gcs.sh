#!/usr/bin/env bash
if [ -n "$DEBUG_SCRIPT" ]; then
    set -x
fi

# Load env vars during prebuild using `gp env` command
if [ -n "$GITPOD_HEADLESS" ]; then
    eval "$(gp env -e | grep DP_GOOGLE_ACCESS_KEY)"
    eval "$(gp env -e | grep DP_GOOGLE_SECRET)"
fi

CURRENT_BRANCH="$(cd "$GITPOD_REPO_ROOT" && git branch --show-current)"

# If it's not ready - rebuild environment from scratch
cd "$GITPOD_REPO_ROOT" && time .gitpod/drupal/envs-prep/create-environments.sh

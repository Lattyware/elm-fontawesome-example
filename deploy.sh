#!/bin/sh
set -e

eval "$(ssh-agent -s)"
openssl aes-256-cbc -K $encrypted_509bb3f1cc0b_key -iv $encrypted_509bb3f1cc0b_iv -in elm-fontawesome-example.enc -out elm-fontawesome-example-deploy-key -d
chmod 600 ./elm-fontawesome-example-deploy-key
ssh-add ./elm-fontawesome-example-deploy-key

git config --global user.name "Gareth Latty"
git config --global user.email "gareth@lattyware.co.uk"

npx gh-pages -d build/ -b gh-pages -r "git@github.com:${TRAVIS_REPO_SLUG}.git"

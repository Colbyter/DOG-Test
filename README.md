# Wordpress Demo Page
[![CircleCI](https://circleci.com/gh/Colbyter/DOG-Test.svg?style=svg)](https://circleci.com/gh/Colbyter/DOG-Test)

This Demo launches a WordPress blog page.

It uses Terraform to provision the EC2 instance with Bitnami's Wordpress image.

CircleCI is used for testing, building and deploying.

The AWS ACCESS and SECRET Keys are set in CircleCI as environment variables.
# Chef: An Introduction

This repository is an example of the "Chef Solo with Vagrant" pattern that Atomic Object has used for maintaining various servers.

The intent is to provide a skeletal framework from which others can start using the pattern, and also track changes to the pattern itself.

## Requirements

1. [Ruby](http://ruby-lang.org), 1.9.3 or 2.0.0
1. [Bundler](http://gembundler.com/)
1. [Vagrant](http://vagrantup.com) (Tested with 1.2.x)
1. [VirtualBox](http://virtualbox.org) (Tested with 4.2.x)
1. (Could be adapted to use other Vagrant providers, such as [VMWare Fusion](http://www.vagrantup.com/vmware) or [AWS](https://github.com/mitchellh/vagrant-aws))

## Getting Started

The following steps will install all necessary gems, boot a new Vagrant, bootstrap chef on the Vagrant, and finally run chef on the Vagrant.

1. Run `bundle install`
1. Run `bundle exec cap berks`
1. Run `bundle exec cap vrails4 vg:up`
1. Run `bundle exec cap vrails4 bootstrap`
1. Run `bundle exec cap vrails4 chef`

## Customization

`README` files in each of the repository's directories provide information about the purpose of the directory and included files. Working examples have been provide ("example" and "vrails4" stages, and "example_cookbook" cookbook).

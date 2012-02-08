# Puppet control module for gitolite

This module provides a resource that will manage the installation of gitolite
for a defined user, admin key and repository path. In this way multiple
repository types may be managed.

## Quick Use

In a node definition:

    gitolite { 'production repos':
      user => 'git',
      admin_key => 'ssh-rsa AAAAB3N99SKIPAFEW blt@doritos',
      path => '/var/lib/git',
    }

You will now be able to clone the gitolite-admin repository with the provided
key. Refer to the [gitolite documentation](http://sitaramc.github.com/gitolite/)
to learn how to manage gitolite.


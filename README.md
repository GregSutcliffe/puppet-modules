# Puppet-modules

This contains the modules I use at home to control various parts of my
infrastructure. Some are submodule links to other, published modules. There
are also some Archlinux/Puppet hacks in (manifests/site.pp)

# Notable unpublished modules

Most decent modules I write get published separately. Currently there are 2
modules here awaiting publication:

## SSH

This ssh module is slightly different to the many published on the Forge - it uses
a function called `ssh_keygen()` to generate persistent SSH RSA Host Keys in `/etc/ssh`.
This means that when you rebuild your machines, they won't cause known\_hosts mismatches.

The function itself will be discussed in an upcoming blog post, which will be linked
here in due course

## Dirvish

A module to automate setting up a Dirvish backup server. The `dirvish` class should
be included on the main server, and the `dirvish::client` class on the targets. A
hash of backups to perform should be passed to the dirvish class:

```yaml
---
  classes:
    dirvish:
      backup_location: /backup
      vaults:
        home:
          client: jade
          tree: /home
          excludes:
          - '*.swp'
          - '*.tmp'
        topaz:
          client: topaz
          tree: /
```

<!-- vim: set ft=markdown: -->

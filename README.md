# Querycasts Lab

This is a [Vagrant](http://www.vagrantup.com/) base box used for a development environment for students of [Querycasts](http://www.querycasts.com/).

## VM details

* Ubuntu 12.04.2 LTS 64-bit
* 40 GB HD
* 384 MB RAM
* Ruby 1.9.3-p385
* Chef and Puppet via RubyGems

## Installation

```
$ git clone git@github.com:querycasts/lab.git
$ cd lab
$ bundle
```

## Creating a definition

Get a list of definition templates to start from:

```
$ bundle exec veewee vbox templates
```

Choose a template and create a new definition:

```
$ bundle exec veewee vbox define BOX_NAME TEMPLATE_NAME
```

Edit the generated definition files as necessary. Then you're ready to build the box.

## Building a base box

```
$ bundle exec veewee vbox build BOX_NAME
```

This will take a few minutes. Once it's finished, you will see a message telling you how to SSH into the box. Connect to it using the password "vagrant" and remove and shell scripts in the home directory, then exit the connection. To export the box and finish the process:

```
$ bundle exec veewee vbox validate [NAME]
$ vagrant basebox export BOX_NAME
$ bundle exec veewee vbox destroy BOX_NAME
```

Where `BOX_NAME` is one of the directories in the definitions directory. This will build the box, validate it, export it to a `.box` file, and destroy the running VM.

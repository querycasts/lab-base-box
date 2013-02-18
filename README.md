# Querycasts Lab

This is a [Vagrant](http://www.vagrantup.com/) base box used for a development environment for students of [Querycasts](http://www.querycasts.com/).

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
$ bundle exec veewee vbox validate [NAME]
$ vagrant basebox export BOX_NAME
$ bundle exec veewee vbox destroy BOX_NAME
```

Where `BOX_NAME` is one of the directories in the definitions directory. This will build the box, validate it, export it to a `.box` file, and destroy the running VM.

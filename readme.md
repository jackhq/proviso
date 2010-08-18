# Proviso

Proviso is a server provisioning tool.  It is a plugin based system that
enables you to build your specific plugins to use for your server provisioning

## Features

* Command Line Options
* Config
* Helpers
* Plugins

## Command Line Options

You can use command line options to specify your settings

    proviso ec2:create --image_id ami-123456

## Config

Proviso makes it easy to manage configuration settings for you plugins

It includes a command line api that allows you to create, add and list
configuration settings that your plugin can read to make your server provisioning
super easy!

* Create Config

    proviso config:create [section]

eg. 

    proviso config:create ec2

* Add config settings

    proviso config:add [section] [key] [value]
    
eg.

    proviso config:add ec2 access_key_id 123456789
    
* List Config

    proviso config:list
    
Lists all of the configuration settings.

# Plugins

Proviso is completely plugin based, all of the provision software is 
actual plugins, which makes it so awesome.

So far there are two plugins:

* ec2 - Provision EC2 servers with this plugin

  proviso plugins:install git://github.com/jackhq/proviso_ec2.git
  
* zerigo - Link IP to FQDN with this plugin

  proviso plugins:install git://github.com/jackhq/proviso_zerigo.git
  


== Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

== Copyright

Copyright (c) 2010 Tom Wilson. See LICENSE for details.

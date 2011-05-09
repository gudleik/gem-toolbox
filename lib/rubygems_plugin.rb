# encoding: utf-8
require 'rubygems/command_manager'
require 'rubygems/command'
require 'rubygems/dependency'
require 'rubygems/version_option'
require 'shellwords'
require 'gem_toolbox/common_options'
require 'appscript'

Gem::CommandManager.instance.register_command :open
Gem::CommandManager.instance.register_command :doc
Gem::CommandManager.instance.register_command :history
Gem::CommandManager.instance.register_command :readme
Gem::CommandManager.instance.register_command :visit
Gem::CommandManager.instance.register_command :cd

# encoding: utf-8

# CdCommand will cd to gem's source path
class Gem::Commands::CdCommand < Gem::Command
  include GemToolbox::CommonOptions
  include Gem::VersionOption
  
  def initialize
    super 'cd', "Change directory to the gem's source directory",
      :command => nil, 
      :version=>  Gem::Requirement.default,
      :latest=>   false
    
    add_command_option
    add_latest_version_option
    add_version_option
    add_exact_match_option
  end
  
  def arguments # :nodoc:
    "GEMNAME       gem to cd into"
  end

  def execute
    name = get_one_gem_name
    path = get_path(name)
    
    do_cd(path) if path
  end

  def do_cd(path)
    app = Appscript.app("Terminal")
    win = app.windows.get.detect { |w| w.properties_.get[:frontmost] }
    win.do_script "cd #{path}", :in => win
  end
  
end

# encoding: utf-8

# OpenCommand will open a gem's source path
# This command is the same as +open+ in open_gem 
class Gem::Commands::OpenCommand < Gem::Command
  include GemToolbox::CommonOptions
  include Gem::VersionOption
  
  def initialize
    super 'open', "Opens the gem's source directory with $GEM_OPEN_EDITOR or $EDITOR", 
      :command => nil, 
      :version=>  Gem::Requirement.default,
      :latest=>   false
    
    add_command_option
    add_latest_version_option
    add_version_option
    add_exact_match_option
  end
  
  def arguments # :nodoc:
    "GEMNAME       gem to open"
  end

  def execute
    name = get_one_gem_name
    path = get_path(name)
    
    open_gem(path) if path
  end
  
  def open_gem(path)
    editor = options[:command] || ENV['GEM_OPEN_EDITOR'] || ENV['VISUAL'] || ENV['EDITOR']
    if !editor
      say "Either set $GEM_OPEN_EDITOR, $VISUAL, $EDITOR, or use -c <command_name>"
    else
      command_parts = Shellwords.shellwords(editor)
      command_parts << path
      success = system(*command_parts)
      if !success 
        raise Gem::CommandLineError, "Could not run '#{editor} #{path}', exit code: #{$?.exitstatus}"
      end
    end
  end
end
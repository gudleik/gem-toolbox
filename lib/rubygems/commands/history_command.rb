# encoding: utf-8

# HistoryCommand displays the gem's changelog using $GEM_PAGER or $PAGER
class Gem::Commands::HistoryCommand < Gem::Command
  include GemToolbox::CommonOptions
  include Gem::VersionOption
  
  CHANGELOG_PATTERN = /^(history|changelog|changes)/i

  def initialize
    super "history", "Show gem's changelog using $GEM_PAGER or $PAGER",
      :command => nil, 
      :version => Gem::Requirement.default,
      :latest  => false
    
    add_latest_version_option
    add_exact_match_option
    add_version_option
    add_command_option
  end
  
  def arguments # :nodoc:
    "GEMNAME      Gem to show changelog for"
  end
  
  def execute
    name = get_one_optional_argument
    path = get_path(name)
    
    if path
      if log = find_changelog(path)
        show log
      else
        say "No changelog found for #{name}"
      end
    end
  end
  
  def find_changelog(path)
    Dir.glob(File.join(path, "*")).each do |file|
      return file if File.file?(file) && File.basename(file) =~ CHANGELOG_PATTERN
    end
    nil
  end
  
end
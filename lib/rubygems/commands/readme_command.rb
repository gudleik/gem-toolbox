# encoding: utf-8

# ReadmeCommand opens the gem's readme file using $PAGER or $GEM_PAGER
class Gem::Commands::ReadmeCommand < Gem::Command
  include GemToolbox::CommonOptions
  include Gem::VersionOption

  def initialize
    super "readme", "Show gem's readme file using $GEM_PAGER or $PAGER",
      :command => nil, 
      :version => Gem::Requirement.default,
      :latest  => false
    
    add_latest_version_option
    add_exact_match_option
    add_version_option
    add_command_option
  end
  
  def arguments # :nodoc:
    "GEMNAME      Gem to show readme for"
  end
  
  def execute
    name = get_one_optional_argument
    path = get_path(name)
    
    if path
      if file = find_readme(path)
        show file
      else
        say "No readme found for #{name}"
      end
    end
  end
  
  def find_readme(path)
    Dir.glob(File.join(path, "{README,readme,Readme,ReadMe}*")).first
  end
  

end
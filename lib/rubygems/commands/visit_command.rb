# encoding: utf-8

require 'launchy'
# VisitCommand opens the gem's homepage in a browser
class Gem::Commands::VisitCommand < Gem::Command
  include GemToolbox::CommonOptions
  include Gem::VersionOption

  def initialize
    super "readme", "Visit gem's homepage in a browser",
      :command => nil, 
      :version => Gem::Requirement.default,
      :latest  => false
    
    add_latest_version_option
    add_exact_match_option
    add_version_option
  end
  
  def arguments # :nodoc:
    "GEMNAME      Gem to visit"
  end
  
  def execute
    name = get_one_gem_name
    spec = get_spec(name)    
    
    if spec.homepage
      Launchy::Browser.run(spec.homepage)
    else
      say "Homepage not defined for #{name}"
    end
  end
  

end
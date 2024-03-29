# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bada_bing/version"

Gem::Specification.new do |s|
  s.name        = "bada_bing"
  s.version     = BadaBing::VERSION
  s.authors     = ["Ezekiel Templin"]
  s.email       = ["ezkl@me.com"]
  s.homepage    = ""
  s.summary     = %q{Bing, but easier}
  s.description = %q{Bada... bing.}

  s.rubyforge_project = "bada_bing"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "yajl-ruby"
  s.add_runtime_dependency "typhoeus"
end

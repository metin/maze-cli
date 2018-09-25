
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "maze/cli/version"

Gem::Specification.new do |spec|
  spec.name          = "maze-cli"
  spec.version       = Maze::Cli::VERSION
  spec.authors       = ["Metin Yorulmaz"]
  spec.email         = ["metin@me.com"]

  spec.summary       = %q{CLI toolkit for maze generation}
  spec.description   = %q{Generate, solve, print mazes}
  spec.homepage      = "http://gitlab.com/metin"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["maze-cli"]
  spec.require_paths = ["lib"]
  spec.add_dependency "awesome_print", "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 0.59.1"
end

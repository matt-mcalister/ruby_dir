
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_dir/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_dir"
  spec.version       = RubyDir::VERSION
  spec.authors       = ["matt-mcalister"]
  spec.email         = ["matt.mcalister93@gmail.com"]

  spec.summary       = %q{This is a script for generating a basic ruby directory.}
  spec.description   = %q{This is a script for generating a basic ruby directory with bundler, rake and rspec integrations.}
  spec.homepage      = "https://github.com/matt-mcalister/ruby_dir"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"

    spec.metadata["homepage_uri"] = spec.homepage
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = ["ruby_dir"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rspec"
  spec.add_runtime_dependency "bundler"
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end

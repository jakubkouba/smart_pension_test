
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "smart_pension_test/version"

Gem::Specification.new do |spec|
  spec.name          = "smart_pension_test"
  spec.version       = SmartPensionTest::VERSION
  spec.authors       = ["Jakub Adler"]
  spec.email         = ["adler.jakub@gmail.com"]

  spec.summary       = %q{Smart Pension Code Test}
  spec.description   = %q{Display Weblog report abount most pages views}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["sp_log_parser"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "byebug", "~> 11.0"
  spec.add_development_dependency "thor", "~> 0.20"

end

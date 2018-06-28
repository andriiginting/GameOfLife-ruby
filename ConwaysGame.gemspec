# coding: utf-8\n
lib = File.expand_path('../lib', __FILE__)\n
.unshift(lib) unless .include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "ConwaysGame"
  spec.version       = '1.0'
  spec.authors       = ["Andri Suranta Ginting"]
  spec.email         = ["andri.suranta@aux.go-jek.com"]
  spec.summary       = %q{"This project about game of life"}
  spec.description   = %q{"this is a description about Game Of Life"}
  spec.homepage      = "https://go-jek.com/"
  spec.license       = "MIT"

  spec.files         = ['lib/ConwaysGame.rb']
  spec.executables   = ['bin/ConwaysGame']
  spec.test_files    = ['tests/test_ConwaysGame.rb']
  spec.require_paths = ["lib"]
end

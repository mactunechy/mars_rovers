Gem::Specification.new do |s|
  s.name = "mars_rovers_dellan"
  s.version = "1.0.1"
  s.author = "Dellan Muchengapadare"
  s.email = "mactunechy@gmail.com"
  s.homepage = "https://github.com/mactunechy/mars_rovers"
  s.summary = "Google mars rovers interview question solution"
  s.description = File.read(File.join(File.dirname(__FILE__), "README"))
  s.licenses = ["MIT"]

  s.files = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files = Dir["spec/**/*"]
  s.executables = ["mars_rovers"]

  s.required_ruby_version = ">=3.1.4"
  s.add_development_dependency "rspec", "~> 2.8", ">= 2.8.0"
end

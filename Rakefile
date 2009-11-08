require 'rubygems'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
  s.platform  =   Gem::Platform::RUBY
  s.name      =   "rack_errorpage"
  s.version   =   "1.0.0"
  s.author    =   "Michael Gorsuch"
  s.email     =   "michael@styledbits.com"
  s.summary   =   "Simple Rack Middleware catching exceptions and rendering the error page of your choice"
  s.homepage  =   "http://github.com/mgorsuch/rack_errorpage"
  s.files     =   FileList['lib/*.rb', 'test/*'].to_a
  s.require_path  =   "lib"
  s.test_files = Dir.glob('tests/*.rb')
  s.has_rdoc  =   true
  s.add_dependency('rack')
end

Rake::GemPackageTask.new(spec) do |pkg|
    pkg.need_tar = true
end

task :default => "pkg/#{spec.name}-#{spec.version}.gem" do
    puts "generated latest version"
end

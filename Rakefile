desc "Publish current podspec version"
task :publish do
  version = spec_version
  puts "** Publishing #{version} (to origin/master, origin/<tag>, pod-repo/master)"
  sh "sleep 1"
  sh "git tag -a #{version} -m 'Release #{version}'"
  sh "git push origin master"
  sh "git push origin #{version}"
  sh "pod trunk push #{podspec}"
end

def spec_version
  require 'cocoapods'
  spec = Pod::Specification.from_file(podspec)
  spec.version
end

def podspec
  Dir['*.podspec'].first
end

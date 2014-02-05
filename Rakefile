INITIAL_VERSION = '0.1.0'

namespace :release do
  task :prompt do
    release
  end
  desc "Release the next version of the Pod"
  task :next do
    release :use_defaults => true
  end
end

desc "Release a new version of the Pod"
task :release => 'release:prompt'

def release(**options)
  use_defaults = options[:use_defaults]

  if current_branch != 'master'
    puts "Error: you need to be on the `master` branch to do a release"
    exit
  end

  podspec_path = any_podspec_in_current_dir
  puts "- Found Podspec: " + blue(podspec_path)

  puts "* Fetching from remote"
  sh "git fetch"

  local_version = spec_version('master', podspec_path)
  remote_version = spec_version('origin/master', podspec_path)

  if local_version != remote_version
    puts "Error: local (#{local_version}) and remote (#{remote_version}) versions do not match"
    exit
  end

  puts "- Current Version: " + blue(local_version)
  current_version = local_version || INITIAL_VERSION

  next_version = bump_version(current_version)

  if use_defaults
    new_version = next_version

    puts "* Releasing version #{red(new_version)}"
  else
    version_prompt = "Enter the new version"
    new_version = ask_user :prompt => version_prompt, :default => next_version
    exit unless confirm "Are you sure you want to release version #{red(new_version)}"
  end

  replace_spec_version(podspec_path, current_version, new_version)

  sh "git commit #{podspec_path} -m 'Release #{new_version}'"
  sh "git tag #{new_version}"
  sh "git push origin master"
  sh "git push origin #{new_version}"
end

def current_branch
  `git rev-parse --abbrev-ref HEAD`.strip
end

def any_podspec_in_current_dir
  `ls -1 *.podspec`.split("\n").first
end

def spec_version(branch, podspec_path)
  require 'cocoapods-core'

  if file_exist_on_branch?(branch, podspec_path)
    remote_spec = eval(`git show #{branch}:#{podspec_path}`)
    remote_spec.version.to_s
  end
end

def file_exist_on_branch?(branch, file_path)
  `git rev-parse --verify --quiet #{branch}:#{file_path} >/dev/null`
  $?.exitstatus == 0
end

def bump_version(version)
  xs = version.split('.')
  xs[-1] = xs[-1].to_i.next.to_s
  xs.join('.')
end

# @param :prompt => String to prompt the user with
#        :default => Optional default value to return if the user presses ENTER
#
def ask_user(**options)
  prompt = options[:prompt] or raise "Prompt is required"
  default = options[:default]
  if default
    print "#{prompt} [#{default}]: "
    result = $stdin.gets.strip
    (!result.empty? && result) || default
  else
    print "#{prompt}: "
    $stdin.gets.strip
  end
end

def confirm prompt
  print "#{prompt}? [y/n] "
  $stdin.gets.strip.downcase == 'y'
end

def colorize(text, color_code)
  if STDOUT.tty?
    "\e[#{color_code}m#{text}\e[0m"
  else
    text
 end
end

def red(text); colorize(text, 31); end
def blue(text); colorize(text, 34); end

def replace_spec_version(podspec_path, current_version, new_version)
  file_gsub!(podspec_path,
             /(s.version\s*=\s*.)#{current_version}(.)/,
             "\\1#{new_version}\\2")
end

def file_gsub!(path, pattern, replacement)
  text = File.read(path)
  text.gsub!(pattern, replacement)
  File.write(path, text)
end

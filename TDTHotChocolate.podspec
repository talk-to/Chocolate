Pod::Spec.new do |s|
  s.name     = 'TDTHotChocolate'
  s.version  = '0.1.0'
  s.summary  = 'Library containing additions to Cocoa and Cocoa Touch'
  s.homepage = 'https://github.com/talk-to/hot-chocolate'
  s.source   = { :git => 'https://github.com/talk-to/hot-chocolate' }
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'TDTHotChocolate'
end

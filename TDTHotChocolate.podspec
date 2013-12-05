Pod::Spec.new do |s|
  s.name     = 'TDTHotChocolate'
  s.version  = '0.1.0'
  s.summary  = 'Library containing additions to Cocoa and Cocoa Touch'
  s.homepage = 'https://github.com/talk-to/hot-chocolate'
  s.source   = { :git => 'https://github.com/talk-to/hot-chocolate.git' }
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'TDTHotChocolate/TDTHotChocolate.h'
  s.source_files = 'TDTHotChocolate/TDTHotChocolateDummy.{h,m}'

  s.header_mappings_dir = 'TDTHotChocolate'
  
  s.subspec 'FoundationAdditions' do |ss|
    ss.source_files = 'TDTHotChocolate/FoundationAdditions/TDTObjectOrDefault.{h,m}', 'TDTHotChocolate/TDTFoundationAdditions.h'
  end
end

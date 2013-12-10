Pod::Spec.new do |s|
  s.name     = 'TDTHotChocolate'
  s.version  = '0.1.1'
  s.summary  = 'Library containing additions to Cocoa and Cocoa Touch'
  s.homepage = 'https://github.com/talk-to/hot-chocolate'
  s.author   = 'Talk.to'
  s.license  = { :type => 'COMMERCIAL', :text => 'Property of Talk.to FZC' }
  s.source   = {
    :git => 'https://github.com/talk-to/hot-chocolate.git',
    :tag => "#{s.version}"
  }
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'

  s.source_files = 'TDTHotChocolate/TDTHotChocolate.h'

  s.header_mappings_dir = 'TDTHotChocolate'
  
  s.subspec 'Assertions' do |ss|
    ss.source_files = 'TDTHotChocolate/TDTAssert.h'
  end
  
  s.subspec 'Logging' do |ss|
    ss.source_files = [ 'TDTHotChocolate/Logging/*.{h,m}',
                        'TDTHotChocolate/TDTLog.h' ]
  end
  
  s.subspec 'FoundationAdditions' do |ss|
    ss.source_files = [ 'TDTHotChocolate/FoundationAdditions/*.{h,m}',
                        'TDTHotChocolate/TDTFoundationAdditions.h' ]
  end
  
  s.subspec 'TestingAdditions' do |ss|
    ss.source_files = [ 'TDTHotChocolate/TestingAdditions/*.{h,m}',
                        'TDTHotChocolate/TDTTestingAdditions.h' ]
  end
  
  s.subspec 'RuntimeAdditions' do |ss|
    ss.source_files = [ 'TDTHotChocolate/RuntimeAdditions/*.{h,m}',
                        'TDTHotChocolate/TDTRuntimeAdditions.h' ]
  end
end

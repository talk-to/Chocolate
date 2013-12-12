Pod::Spec.new do |s|
  s.name     = 'TDTHotChocolate'
  s.version  = '0.1.3'
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

  s.header_mappings_dir = 'TDTHotChocolate'
  
  s.subspec 'FoundationAdditions' do |ss|
    ss.source_files = [ 'TDTHotChocolate/FoundationAdditions/*.{h,m}',
                        'TDTHotChocolate/TDTFoundationAdditions.h' ]
  end
  
  s.subspec 'TestingAdditions' do |ss|
    ss.source_files = [ 'TDTHotChocolate/TestingAdditions/*.{h,m}',
                        'TDTHotChocolate/TDTTestingAdditions.h' ]
  end

  s.subspec 'SecurityAdditions' do |ss|
    ss.osx.source_files = ''
    ss.ios.source_files = [ 'TDTHotChocolate/SecurityAdditions/*.{h,m}',
                            'TDTHotChocolate/TDTSecurityAdditions.h' ]
    ss.ios.frameworks = 'Security'
  end

  s.subspec 'CoreDataAdditions' do |ss|
    ss.source_files = [ 'TDTHotChocolate/CoreDataAdditions/*.{h,m}',
                        'TDTHotChocolate/TDTCoreDataAdditions.h' ]
    ss.frameworks = 'CoreData'
    ss.osx.exclude_files = 'TDTHotChocolate/CoreDataAdditions/NSFetchedResultsController+TDTAdditions.{h,m}'
  end
end

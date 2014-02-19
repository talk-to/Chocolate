Pod::Spec.new do |s|
  s.name     = 'TDTChocolate'
  s.version  = '0.7.1'
  s.summary  = 'Library containing additions to Cocoa and Cocoa Touch'
  s.homepage = 'https://github.com/talk-to/Chocolate'
  s.author   = 'Talk.to'
  s.license  = { :type => 'COMMERCIAL', :text => 'Property of Talk.to FZC' }
  s.source   = {
    :git => 'https://github.com/talk-to/Chocolate.git',
    :tag => "#{s.version}"
  }
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'

  s.header_mappings_dir = 'TDTChocolate'
  
  s.subspec 'FoundationAdditions' do |ss|
    ss.source_files = [ 'TDTChocolate/FoundationAdditions/*.{h,m}',
                        'TDTChocolate/TDTFoundationAdditions.h' ]
  end
  
  s.subspec 'TestingAdditions' do |ss|
    ss.source_files = [ 'TDTChocolate/TestingAdditions/*.{h,m}',
                        'TDTChocolate/TDTTestingAdditions.h' ]
  end

  s.subspec 'SecurityAdditions' do |ss|
    ss.osx.source_files = ''
    ss.ios.source_files = [ 'TDTChocolate/SecurityAdditions/*.{h,m}',
                            'TDTChocolate/TDTSecurityAdditions.h' ]
    ss.ios.frameworks = 'Security'
  end

  s.subspec 'CoreDataAdditions' do |ss|
    ss.source_files = [ 'TDTChocolate/CoreDataAdditions/*.{h,m}',
                        'TDTChocolate/TDTCoreDataAdditions.h' ]
    ss.frameworks = 'CoreData'
    ss.osx.exclude_files = 'TDTChocolate/CoreDataAdditions/NSFetchedResultsController+TDTAdditions.{h,m}'
  end

end

Pod::Spec.new do |s|
  s.name             = 'JSONFactorable'
  s.version          = '0.2.1'
  s.summary          = 'JSONFactorable is cross-platform framework for building decodable objects out of raw, json-convertible values.'


  s.description      = <<-DESC
The framework is for creating object out of raw values. It is very usefull
  if you want to create decodable structure in tests out of given parameters
  for easier testing of decodable structures.
                       DESC

  s.homepage         = 'https://github.com/railwaymen/JSONFactorable'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bartłomiej Świerad' => 'bartlomiej.swierad@railwaymen.org' }
  s.source           = { :git => 'https://github.com/railwaymen/JSONFactorable.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'Sources/JSONFactorable/**/*'
  s.swift_versions = '5.1'
end

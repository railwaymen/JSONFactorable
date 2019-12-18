#
# Be sure to run `pod lib lint JSONFactorable.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JSONFactorable'
  s.version          = '0.1.0'
  s.summary          = 'A short description of JSONFactorable.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://git.railwaymen.org/open/jsonfactorable'
  s.license          = { :type => 'Custom', :file => 'LICENSE' }
  s.author           = { 'Bartłomiej Świerad' => 'bartlomiej.swierad@railwaymen.org' }
  s.source           = { :git => 'ssh://git@git.railwaymen.org:10522/open/jsonfactorable.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.4'

  s.source_files = 'JSONFactorable/Classes/**/*'
  s.swift_versions = '5.1'
end

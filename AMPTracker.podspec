#
# Be sure to run `pod lib lint AMPTracker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AMPTracker'
  s.version          = '0.1.0'
  s.summary          = 'Helper to deal with common analytics frameworks'

  s.description      = <<-DESC
Helper to deal with common analytics frameworks
                       DESC

  s.homepage         = 'https://github.com/alvaromurillo/AMPTracker'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Álvaro Murillo' => 'alvaromurillop@gmail.com' }
  s.source           = { :git => 'https://github.com/alvaromurillo/AMPTracker.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.tvos.deployment_target = '11.0'
  s.default_subspec = 'Core'

  s.subspec 'Core' do |sp|
    sp.source_files = 'AMPTracker/Classes/*.swift'
  end

  s.subspec 'Amplitude' do |sp|
    sp.source_files = 'AMPTracker/Classes/Amplitude/*.swift'
    sp.dependency 'AMPTracker/Core'
    sp.dependency 'Amplitude'
  end

end

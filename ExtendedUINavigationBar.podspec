Pod::Spec.new do |s|
  s.name             = 'ExtendedUINavigationBar'
  s.version          = '1.0.0'
  s.summary          = 'If you ever need to extend the height of UIKit NavigationBar.'

  s.description      = <<-DESC
This helps extending the work area of UIKit NavigationBar by adding a header view.
                       DESC

  s.homepage         = 'https://github.com/piperamirez/ExtendedUINavigationBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'piperamirez' => 'feliperamirezg@gmail.com' }
  s.source           = { :git => 'https://github.com/piperamirez/ExtendedUINavigationBar.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.0'

  s.source_files = 'ExtendedUINavigationBar/Classes/**/*'
end

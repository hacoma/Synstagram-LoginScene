Pod::Spec.new do |s|
  s.name = 'LoginScene'
  s.version = '1.0.7'
  s.license = { :type => 'MIT' }
  s.homepage = 'https://github.com/hacoma/Synstagram-LoginScene'
  s.authors = { 'hacoma' => 'hacoma92@gmail.com' }
  s.summary = 'LoginScene for synstagram'
  s.swift_version = '5.0'

  s.ios.deployment_target = '11.0'

  s.source = { :git => 'https://github.com/hacoma/Synstagram-LoginScene.git', :tag => s.version }
  s.source_files = 'LoginScene/Module/Source/**/*.{swift,xib}'
  s.resource = 'LoginScene/Module/Resources/*.xcassets'

  s.dependency 'HacomaDIContainer', '1.0.3'
  s.dependency 'HacomaExtensions', '1.0.2'
  s.dependency 'HacomaUI/InsetTextField', '1.0.2'
  s.dependency 'APIService/Auth', '1.0.5'
  s.dependency 'Injectable/Login', '1.0.0'
  s.dependency 'Injectable/AlbumList', '1.0.0'
end
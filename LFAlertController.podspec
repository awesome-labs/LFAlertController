Pod::Spec.new do |s|
s.name             = 'LFAlertController'
s.version          = '0.0.2'
s.summary          = 'UIAlertController with global handler :large_orange_diamond:'
s.description      = 'UIAlertController Swift extension with handler inside initialization'
s.homepage         = 'https://github.com/lfarah/LFAlertController'
s.license          = 'MIT'
s.author           = { 'lucasfarah' => 'lucas.farah@me.com' }
s.source           = { :git => 'https://github.com/lfarah/LFAlertController.git', :tag => s.version.to_s }
s.ios.deployment_target   = '8.0'
s.source_files = 'Source/LFAlertController.swift'
s.requires_arc = true 
end

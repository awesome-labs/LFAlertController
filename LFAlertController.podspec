Pod::Spec.new do |s|
s.name             = "LFAlertController"
s.version          = "0.1"
s.summary          = "UIAlertController Swift extension with handler inside initialization :large_orange_diamond:"
s.description      = "UIAlertController Swift extension with handler inside initialization :large_orange_diamond:"
s.homepage         = "https://github.com/lfarah/LFAlertController"
s.license          = 'MIT'
s.author           = { "lucasfarah" => "lucas.farah@me.com" }
s.source           = { :git => "https://github.com/lfarah/LFAlertController.git", :tag => s.version.to_s }
s.ios.deployment_target   = '8.0'
s.requires_arc = true

# If more than one source file: https://guides.cocoapods.org/syntax/podspec.html#source_files
s.source_files = 'Source/LFAlertController.swift' 

end

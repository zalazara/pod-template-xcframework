#
# Be sure to run `pod lib lint ${POD_NAME}.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|

  spec.name         = "${POD_NAME}"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of ${POD_NAME}."
  spec.description  = <<-DESC
  TODO: Add long description of the pod here.
                         DESC

  spec.homepage     = "https://github.com/${USER_NAME}/${POD_NAME}"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "${USER_NAME}" => "${USER_EMAIL}" }
  spec.source       = { :git => "https://github.com/${USER_NAME}/${POD_NAME}/${POD_NAME}.xcframework.zip", :tag => "#{spec.version}" }
  spec.vendored_frameworks = "${POD_NAME}.xcframework"
  spec.ios.deployment_target = '11.0'
  spec.swift_version = '5.0'
end
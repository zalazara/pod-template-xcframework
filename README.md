pod-template-xcframework
============

An opinionated template for creating an XCFramework that have dependencies from CocoaPods and distribute via Pod. 



## Getting started

There are two reasons for wanting to work on this template, making your own or improving the one for everyone's. In both cases you will want to work with the ruby classes inside the `setup` folder, and the example base template that it works on from inside `templates/Example`. 



## Add dependencies

In this version you need to register dependencies in podspec and podfile in the Example app.



Example :



**MyPod.podspec**

```ruby
spec.dependency 'Alamofire' 
```



**Podfile**

```ruby
platform :ios, '11.0'

target 'MyPod_Example' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for MyPod_Example
	pod 'Alamofire'
  
  target 'MyPod' do
    # Pods for MyPod
  end

  target 'MyPod_ExampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MyPod_ExampleUITests' do
    # Pods for testing
  end

end
```



## Generate XCFramework

This is simple, run build.sh in your terminal. 



```bash
sh build.sh
```



This command will generate .xcframework and zipped xcframework file for distribution.

## Best practices

The command `pod lib create` aims to be ran along with this guide: https://guides.cocoapods.org/making/using-pod-lib-create.html so any changes of flow should be updated there also.

It is open to communal input, but adding new features, or new ideas are probably better off being discussed in an issue first. In general we try to think if an average Xcode user is going to use this feature or not, if it's unlikely is it a _very strongly_ encouraged best practice ( ala testing / CI. ) If it's something useful for saving a few minutes every deploy, or isn't easily documented in the guide it is likely to be denied in order to keep this project as simple as possible.

## Requirements:

- CocoaPods 1.0.0+

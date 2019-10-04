![Swift DropBox](https://user-images.githubusercontent.com/43349628/66216607-12830400-e6c6-11e9-812f-a99a83a37ab7.jpg)
# Swift_and_DropBox
[![Swift](https://img.shields.io/badge/Swift-5.3-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-10.3-blue.svg)](https://developer.apple.com/xcode)
[![Dropbox](https://img.shields.io/badge/Dropbox-Cloud_Storage-blue.svg)](https://www.dropbox.com/login?cont=https%3A%2F%2Fwww.dropbox.com%2Fdevelopers%2Fapps)



Application written with Swift 5.3 on Xcode 10.3.

This application integrates Dropbox Swift SDK with DropBox API v2.

Before using this iOS project, you need register a your application in the Dropbox App Console. You will get a DropBox API Key that will be associated with the API calls in the project.

You will see how to recall the upload and download functions, sending and receiving a test file between your iOS app and your DropBox account.

The test file is generated in the iOS application's Documents folder via the FileManager path (this folder will also be used to receive file recovery from the DropBox account to the iOS application).

Everything can be monitored through Xcode's output and a connected iPhone (or iPad).

More info here: [How to exchange data between Swift and Dropbox](https://medium.com/@jkdory83/how-to-exchange-data-between-swift-and-dropbox-39c3805d9a04)

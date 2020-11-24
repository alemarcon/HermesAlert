![Hermes: Elegant alert written in Swift](hermes.png)

# HermesAlert
An elegant and lightweight alert for iOS, customizable and very easy to use.

# Requirements
iOS 12.0  
Xcode 12.0  
Swift 5.0

# Installation

## CocoaPods
CocoaPods is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate Hermes into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'HermesAlert'
```

# Get start

Show an alert on Hermes is very easy and required just 1 line of code. In your view controller just type:

```Swift
Hermes(message: "Hi everybody!!").show()
```

and a cool alert will showed to you on your screen. Easy, right?

# HermesAlertType
You can easily change the appearance of your alert by changing the parameter
```Swift
alert: HermesAlertType
```
You can choose between different types and each of these will transform the appearance of the alert depending on the type selected.

## Customization
Anyway, you can customize your alert appearance specifing any single aspect of the alert also after it's initialization

# Manage alert button response
If you need to do specific operation after that button will tapped, you should implement **HermesAlertDelegate** that provide 2 methods responding to buttons of alerts. You will also have parameters that specify data inserted in alert (if you use Textbox alert for example).

Anyway, if you don't need to manage alert response, you don't need to implement it's delegate.

# Hermes origin
Why Hermes?? No i'm not a fashon addicted (as someone could think about) but Hermes, in ancient Greek religion and mythology is considered the herald of the gods. In myth, Hermes functioned as the emissary and messenger of the gods and here, Hermes would be the messenger of your app.

# Icons
Thanks for icons to:

Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>

Icons made by <a href="https://www.flaticon.com/authors/kiranshastry" title="Kiranshastry">Kiranshastry</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>

Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>

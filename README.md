![](https://img.shields.io/badge/build-pass-brightgreen.svg?style=flat-square)
![](https://img.shields.io/badge/platform-tvOS9+-ff69b4.svg?style=flat-square)
![](https://img.shields.io/badge/Require-XCode7.1-lightgrey.svg?style=flat-square)


# tvOS 9 - New OS - TVMLKit tvOS! - Example
tvOS 9~ Experiments - TVApplicationController Javascript Environment - appleTv.

## Example

![](https://raw.githubusercontent.com/Sweefties/tvOS9-TVMLKitDemo/master/source/tvOS9_Simulator2x_TVMLKitDemotvOS_1.jpg)
![](https://raw.githubusercontent.com/Sweefties/tvOS9-TVMLKitDemo/master/source/tvOS9_Simulator2x_TVMLKitDemotvOS_2.jpg)

## Pictures Source
Licence CCO Public Domain from : [Pixabay.com](https://pixabay.com)


## Requirements

- >= XCode 7.1 beta~.
- >= Swift 2.
- >= tvOS 9.0

Tested on tvOS 9.0 Simulator.

## App Transport Security Settings

To support HTTP hosted : add the Boolean type Value to `YES` for `NSAllowsArbitraryLoads` in app's `info.plist` file.


## Client-Server App

- Create and configure the client-server app with javascript file : `main.js`
- Create and configure `.tvml` files

- TVML Templates here : [Apple TV Markup Language Reference Templates](https://developer.apple.com/library/prerelease/tvos/documentation/LanguagesUtilities/Conceptual/ATV_Template_Guide/index.html#//apple_ref/doc/uid/TP40015064-CH41-SW1).


## Code Example

AppDelegate Class

```swift
import TVMLKit

...

// MARK: - Properties
var window: UIWindow?
var appController : TVApplicationController?
static let TVBaseURL = "http://localhost:9001/"
static let TVBootURL = "\(AppDelegate.TVBaseURL)js/main.js"

// MARK: - UIApplication Overrides
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    self.window = UIWindow(frame:UIScreen.mainScreen().bounds)

    /// Create the TVApplicationControllerContext
    let appControllerContext = TVApplicationControllerContext()

    /// Javascript Context for TVMLKit Application
    if let javaScriptURL = NSURL(string: AppDelegate.TVBootURL) {
        appControllerContext.javaScriptApplicationURL = javaScriptURL
    }

    appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL

    if let launchOptions = launchOptions as? [String: AnyObject] {
        for (kind, value) in launchOptions {
            appControllerContext.launchOptions[kind] = value
        }
    }

    /// Javascript Environment
    appController = TVApplicationController(context: appControllerContext, window: self.window, delegate: self)

    return true
}

...

```


## Usage

To run the example project, download or clone the repo.
Run client-server app with Terminal command :

```bash
python -m SimpleHTTPServer 9001
```

Build and Run tvOS Simulator!

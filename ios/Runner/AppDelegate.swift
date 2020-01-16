import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self);
    GMSServices.provideAPIKey("AIzaSyA4DbACzqNHQ8BSg8BbOY0lXWETh9fa9LU")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

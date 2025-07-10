import UIKit
import SwiftUI
import AppMetricaCore
import OneSignalFramework

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

 var window: UIWindow?
    
    var restrictRotation: UIInterfaceOrientationMask = .all
    
    private let oneSignalIDChecker = OneSignalIDChecker()
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return restrictRotation
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        OneSignal.initialize("2397aee7-2957-46b8-b15d-27b0a7bea852", withLaunchOptions: nil)
        oneSignalIDChecker.startCheckingOneSignalID()
        setupAppmetrica()
        initViewController()
        return true
    }
    
    private func initViewController() {
        let controller: UIViewController
        if let lastUrl = SaveService.lastUrl {
            controller = WebviewVC(url: lastUrl)
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = controller
            window?.makeKeyAndVisible()
            print("Saved")
        } else {
            controller = LoadingSplash()
            let navigationController = UINavigationController(rootViewController: controller)
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
            print("Not Saved")
        }
    }
    
    private func setupAppmetrica() {
        let configuration = AppMetricaConfiguration(apiKey: "3b8f6e93-47b4-4cc1-ad6c-16625971ebf7")
         AppMetrica.activate(with: configuration!)
        print(AppMetrica.deviceIDHash)
    }
}

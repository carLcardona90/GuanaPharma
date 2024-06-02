//
//  GuanaPharmaApp.swift
//  GuanaPharma
//
//  Created by Carlos Cardona on 28/4/24.
//

import SwiftUI
import Firebase
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }

}


@main
struct GuanaPharmaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            if let user = authenticationViewModel.user {
                Home(authenticationViewModel: authenticationViewModel)
            } else {
                InicioSesion(authenticationViewModel: authenticationViewModel)
            }
        }
    }
}

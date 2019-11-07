//
//  AppDelegate.swift
//  Sabq
//
//  Created by Ahmed Refaat on 10/17/19.
//  Copyright © 2019 Ahmed Refaat. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GIDSignIn.sharedInstance().clientID = "135094796263-3mulgpgnni2uamq3bsrlhj7vdm0cdb1v.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        
        setupNetworking()
        window = UIWindow(frame: UIScreen.main.bounds)
        NewsRouter.startRouting(at: window)
        return true
    }
    
    func application(_ application: UIApplication,
                     open url: URL,
                     sourceApplication: String?,
                     annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!,
              didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            // [START_EXCLUDE silent]
            NotificationCenter.default.post(
                name: Notification.Name(rawValue: "ToggleAuthUINotification"), object: nil, userInfo: nil)
            // [END_EXCLUDE]
            return
        }
        
        NewsRouter.moveToApplication()
        
        // Perform any operations on signed in user here.
        let _ = user.userID                  // For client-side use only!
        let _ = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name
        let _ = user.profile.givenName
        let _ = user.profile.familyName
        let _ = user.profile.email
        
        guard let name = fullName else { return }
        
        // [START_EXCLUDE]
        NotificationCenter.default.post(
            name: Notification.Name(rawValue: "ToggleAuthUINotification"),
            object: nil,
            userInfo: ["statusText": "Signed in user:\n\(name)"])
        // [END_EXCLUDE]
    }
}

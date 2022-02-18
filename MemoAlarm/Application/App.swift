//
//  App.swift
//  MemoAlarm
//
//  Created by 山田純平 on 2022/02/18.
//

import Foundation
import UIKit

final class App {
    static let shared = App()
    
    func startInterface(in window: UIWindow) {
        //"Main"はGlobalConstなどで定義
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationVC = storyboard.instantiateInitialViewController() as! UINavigationController
        let viewController = navigationVC.viewControllers[0] as! ViewController
        let mainViewModel = MainViewModel(database: UserDefaultsDatabase(), notificationManager: UserNotificationManager(), navigator: MainViewNavigator(navigationController: navigationVC))
        viewController.viewModel = mainViewModel
        
        window.rootViewController = navigationVC
        window.makeKeyAndVisible()
    }
}

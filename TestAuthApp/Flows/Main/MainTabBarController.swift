//
//  MainTabBarController.swift
//  TestAuthApp
//
//  Created by Захар  Сегал on 26.02.2021.
//

import UIKit

class MainTabBarController: UITabBarController, TabBarModuleOutput {
    
    var onSignOut: (() -> Void)?
    let userSession: UserSessionController!
    
    init(userSession: UserSessionController) {
        self.userSession = userSession
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureVCs()
        
    }
    
    private func setupUI() {
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.systemPurple.cgColor
        tabBar.clipsToBounds = true
        tabBar.tintColor = .systemBlue
        tabBar.barTintColor = .white
    }
    
    private func configureVCs() {
        let tabTitles = ["Projects", "Home", "Settings"]
        
        let tabItems = (0..<tabTitles.count).map({ UITabBarItem(title: tabTitles[$0], image: UIImage(systemName: "star.fill"), tag: $0)})
      
        let projectsVC = ProjectsViewController()
        let homeVC = HomeViewController()
        let settingsVC: SettingsViewController = SettingsViewController()
        settingsVC.userSession = userSession
        settingsVC.onSignOut = { [weak self] in
            self?.onSignOut?()
        }

        projectsVC.tabBarItem = tabItems[0]
        homeVC.tabBarItem = tabItems[1]
        settingsVC.tabBarItem = tabItems[2]
        
        self.viewControllers = [
            projectsVC,
            homeVC,
            settingsVC
        ]
    }
    

}

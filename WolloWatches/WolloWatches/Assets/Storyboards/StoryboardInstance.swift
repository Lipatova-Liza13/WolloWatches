//
//  StoryboardInstance.swift
//  WolloWatches
//
//  Created by Bogdan Deshko on 9/29/20.
//  Copyright © 2020 Liza Lipatova and Maxim Semeniy. All rights reserved.
//

import UIKit


extension UIStoryboard {
    //MARK: - Auth Storyboards
    class Auth {
        private
        static var value: UIStoryboard { return .init(name: "Auth", bundle: nil) }

        static var logIn: LogInViewController {
            value.initVC(type: LogInViewController.self)
        }
        
        static var signUp: LogUpViewController {
            value.initVC(type: LogUpViewController.self)
        }

    }

    class Main {
        private
        static var value: UIStoryboard {return .init(name: "Main", bundle: nil) }

        static var tabBar: MainTabBarController {
            value.initVC(type: MainTabBarController.self)
        }
    }

    class Profile {
        private
        static var value: UIStoryboard {return .init(name: "Profile", bundle: nil) }

        static var about: AboutViewController {
            value.initVC(type: AboutViewController.self)
        }
    }
    
    class WhatToWatch {
        private
        static var value: UIStoryboard {return .init(name: "WhatToWatch", bundle: nil)}
        
        static var video: VideoViewController {
            value.initVC(type: VideoViewController.self)
        }
        
        static var WhatToWatchList: WhatToWatchViewController {
            value.initVC(type: WhatToWatchViewController.self)
        }
    }
    
    func initVC<T>(type : T.Type) -> T where T : UIViewController {
        self.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
}

//
//  Extension.swift
//  TheMoviee
//
//  Created by Ilham Hadi Prabawa on 2/23/21.
//

import Foundation
import UIKit
import Nuke

//MARK: viewcontroler extension
extension UIViewController {
    
    func storyboardInstance<T: UIViewController>(_ className: String) -> T? {
        let storyboard = UIStoryboard(name: className, bundle: nil)
        return storyboard.instantiateInitialViewController() as? T
    }
    
    func storyboardInstanceWithID<T: UIViewController>(name: String, identifier: String) -> T? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier) as? T
    }
    
    func alertView(title: String, message: String, completion: @escaping (() -> ()) = {}){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
            completion()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alertView(title: String, message: String, completion: (() -> Void)?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
            completion?()
        }))
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addChildViewController(content: UIViewController){
        self.addChild(content)
        self.view.addSubview(content.view)
        self.didMove(toParent: self)
    }
    
    func removeChildViewController(content: UIViewController){
        self.willMove(toParent: nil)
        content.view.removeFromSuperview()
        content.removeFromParent()
    }
    
    func loadImage(from url: ImageRequestConvertible, into view: ImageDisplayingView) {
        let options = ImageLoadingOptions(transition: .fadeIn(duration: 0.25))
        Nuke.loadImage(with: url, options: options, into: view)
    }
    
}

extension Date {
    func formatDate(with format: String = "dd-MM-yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
}

extension UIColor {
    open class var primary: UIColor{
        get {
            return UIColor(named: "Primary") ?? .clear
        }
    }
    
    open class var secondary: UIColor{
        get {
            return UIColor(named: "Secondary") ?? .clear
        }
    }
    
    open class var terniary: UIColor {
        get {
            return UIColor(named: "Terniary") ?? .clear
        }
    }
}

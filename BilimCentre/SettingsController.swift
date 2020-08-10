import UIKit
import Foundation

class SettingsController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func exitButton(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "isSignIn")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"PhoneController")
        self.present(viewController, animated: true)
    }
    
}

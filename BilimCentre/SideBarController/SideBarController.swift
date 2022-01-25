import UIKit
import Foundation


class SideBarController: UIViewController {
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var signButton: UIButton!
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if defaults.bool(forKey: "isSignIn") == true{
            signButton.alpha = 0.0
        }
        else{
            signButton.alpha = 1.0
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    func sideMenus(){
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 300
            view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        }
    }
    
    
    @IBAction func coursesButton(_ sender: UIButton) {
        if Reachability.isConnectedToNetwork() == true {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"StartCoursesController")
            self.present(viewController, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Извините", message: "Ошибка соединения с интернетом...", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func answersButton(_ sender: UIButton) {
        defaults.set(true, forKey: "fromMain")
        let alert = UIAlertController(title: "Назар аудар!", message: "Өкінішке орай әзірге рұксат жоқ.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        self.present(alert, animated: true)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier :"SubjectsController")
//        self.present(viewController, animated: true)
        
    }
    
    @IBAction func testButton(_ sender: UIButton) {
        if Reachability.isConnectedToNetwork() == true {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"StartTestController")
            self.present(viewController, animated: true)
        }
        else{
            let alert = UIAlertController(title: "Извините", message: "Ошибка соединения с интернетом...", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func isSignInButton(_ sender: UIButton) {
        if Reachability.isConnectedToNetwork() == true {
            if defaults.bool(forKey: "isSignIn") == true{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier :"SWRevealViewController")
                self.present(viewController, animated: true)
            }
            else{
                let alert = UIAlertController(title: "Назар аудар!", message: "Сіз тіркелмегенсіз? Тіркелгіңіз келеді ме?", preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "Иә", style: .default, handler: { (action: UIAlertAction!) in
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"PhoneController")
                    self.present(viewController, animated: true)
                }))

                alert.addAction(UIAlertAction(title: "Жоқ", style: .cancel, handler: { (action: UIAlertAction!) in
                }))

                present(alert, animated: true, completion: nil)
            }
        }
        else{
            let alert = UIAlertController(title: "Извините", message: "Ошибка соединения с интернетом...", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

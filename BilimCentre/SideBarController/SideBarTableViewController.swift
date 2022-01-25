import UIKit
import Foundation
import Alamofire
import Kingfisher

class SideBarTableViewController: UITableViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ava: UIImageView!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        name.text = defaults.string(forKey: "Name")
        if defaults.url(forKey: "AvaURL") != nil {
            ava.kf.setImage(with: defaults.url(forKey: "AvaURL"))
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Reachability.isConnectedToNetwork() == true {
            if defaults.bool(forKey: "isSignIn") == true{
                if (indexPath.row == 0) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"ProfileController")
                    self.present(viewController, animated: true)
                }
                else if (indexPath.row == 1) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"HistoryController")
                    self.present(viewController, animated: true)
                }
                else if (indexPath.row == 2) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"FeedBackController")
                    self.present(viewController, animated: true)
                }
                else if (indexPath.row == 3) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"SWRevealViewController")
                    self.present(viewController, animated: true)
                }
                else if (indexPath.row == 4) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let viewController = storyboard.instantiateViewController(withIdentifier :"GraduatesController")
                    self.present(viewController, animated: true)
                }
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

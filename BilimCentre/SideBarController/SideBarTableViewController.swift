import UIKit
import Foundation


class SideBarTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.automaticallyAdjustsScrollViewInsets = false

    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"ProfileController")
            self.present(viewController, animated: true)
        }
        else if (indexPath.row == 1) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"ProfileController")
            self.present(viewController, animated: true)
        }
        else if (indexPath.row == 2) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"FeedBackController")
            self.present(viewController, animated: true)
        }
        else if (indexPath.row == 3) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"ProfileController")
            self.present(viewController, animated: true)
        }
        else if (indexPath.row == 4) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"ProfileController")
            self.present(viewController, animated: true)
        }
        else if (indexPath.row == 5) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"GraduatesController")
            self.present(viewController, animated: true)
        }
    }
    
    
}

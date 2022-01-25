import UIKit
import Foundation

class ClassesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var Classes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClaTVCell", for: indexPath) as! ClassesTableViewCell
        cell.classOf.text = String(indexPath.row + 5)
        if (indexPath.row > 4){
            cell.imageBG.image = UIImage(named: "card40")
            cell.classOf.textColor = UIColor.white
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"SubjectsController")
        self.present(viewController, animated: true)
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

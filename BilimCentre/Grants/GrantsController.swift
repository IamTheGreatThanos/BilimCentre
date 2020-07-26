import UIKit
import Foundation

class GrantsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var specialties = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GTVCell", for: indexPath) as! GrantsTableViewCell
        cell.specialtyLabel.text = "Педагогика и психология"
        return cell
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

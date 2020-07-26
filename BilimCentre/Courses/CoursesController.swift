import UIKit
import Foundation

class CoursesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var courses = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CTVCell", for: indexPath) as! CoursesTableViewCell
        cell.nameLabel.text = "Ануарбек Амангельді"
        return cell
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}



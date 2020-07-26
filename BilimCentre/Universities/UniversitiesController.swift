import UIKit
import Foundation

class UniversitiesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var universities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UTVCell", for: indexPath) as! UniversitiesTableViewCell
        cell.universityLabel.text = "Satbayev University"
        return cell
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

import UIKit
import Foundation

class HistoryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var history = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HTVCell", for: indexPath) as! HistoryTableViewCell
        return cell
        
    }

}

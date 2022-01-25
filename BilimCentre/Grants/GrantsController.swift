import UIKit
import Foundation

class GrantsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var specialties = [String]()
    var allGrants = [String]()
    var fullTraining = [String]()
    var abbTraining = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "Grants", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSArray
                for i in jsonResult{
                    let i = i as! Dictionary<String, Any>
                    specialties.append(i["specialty_name"] as! String)
                    allGrants.append("Барлық гранттар: " + String(i["all_grants"] as! Int))
                    fullTraining.append("Толық оқу гранттары: " + String(i["full_training"] as! Int))
                    abbTraining.append("Қысқаша оқу гранттары: " + String(i["abbreviated_training"] as! Int))
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specialties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GTVCell", for: indexPath) as! GrantsTableViewCell
        cell.specialtyLabel.text = specialties[indexPath.row]
        cell.codeLabel.text = allGrants[indexPath.row]
        cell.allGrantsLabel.text = fullTraining[indexPath.row]
        cell.fullEducationLabel.text = abbTraining[indexPath.row]
        return cell
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

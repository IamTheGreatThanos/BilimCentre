import UIKit
import Foundation

class UniversitiesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var universities = [String]()
    var universitieCodes = [String]()
    var universitieAddresses = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "Universities", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSArray
                for i in jsonResult{
                    let i = i as! Dictionary<String, Any>
                    universities.append(i["university_name"] as! String)
                    universitieCodes.append("Университет коды: " + (i["university_code"] as! String))
                    universitieAddresses.append(i["university_address"] as! String)
                }
            }
            catch {
                print(error)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UTVCell", for: indexPath) as! UniversitiesTableViewCell
        
        cell.universityLabel.text = universities[indexPath.row]
        cell.cityLabel.text = universitieCodes[indexPath.row]
        cell.numberLabel.text = universitieAddresses[indexPath.row]
        
        return cell
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

import UIKit
import Foundation

class SpecialtiesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var specialties = [String]()
    var subs = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "Specialties", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSArray
                for i in jsonResult{
                    let i = i as! Dictionary<String, Any>
                    specialties.append(i["specialty_name"] as! String)
                    subs.append(i["profile_subjects"] as! String)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "STVCell", for: indexPath) as! SpecialtiesTableViewCell
        cell.specialtyLabel.text = specialties[indexPath.row]
        if subs[indexPath.row] == "Творческий экзамен и Творческий экзамен"{
            cell.firstLabel.text = "Творческий экзамен"
        }
        else{
            cell.firstLabel.text = subs[indexPath.row]
        }
        
        return cell
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}



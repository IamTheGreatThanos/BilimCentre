import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class HistoryController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var History = [String]()
    var RightAns = [String]()
    var Count = [String]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headers: HTTPHeaders = [
            "Authorization": "Token " + defaults.string(forKey: "Token")!,
          "Accept": "application/json"
        ]
        
        AF.request(GlobalVariables.url + "users/history", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { [self] response in
            let json = try? JSON(data: response.data!)
            if json != nil{
                for i in json!.arrayValue{
                    if i["type_test"].string == "ent"{
                        self.History.append("ҰБТ")
                    }
                    else{
                        self.History.append(i["subject1"].string!)
                    }
                    self.RightAns.append(i["right_answers"].stringValue)
                    self.Count.append(i["count_of_questions"].stringValue)
                }
                self.mainTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return History.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HTVCell", for: indexPath) as! HistoryTableViewCell
        if History[indexPath.row] == "ent"{
            cell.testName.text = "ҰБТ"
        }
        else{
            cell.testName.text = History[indexPath.row]
        }
        cell.subjects.text = ""
        cell.points.text = RightAns[indexPath.row] + "/" + Count[indexPath.row]
        return cell
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

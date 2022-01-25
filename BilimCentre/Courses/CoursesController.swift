import UIKit
import Foundation
import Alamofire
import Kingfisher
import SwiftyJSON

class CoursesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    let defaults = UserDefaults.standard
    
    var courses = [JSON]()
    var id = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        id = defaults.string(forKey: "courseID")!
        getData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CTVCell", for: indexPath) as! CoursesTableViewCell
        cell.nameLabel.text = courses[indexPath.row]["full_name"].string
        if courses[indexPath.row]["avatar"].string! != "http://back.bilimcentre.kz/media/default/default.png"{
            let url = URL(string: courses[indexPath.row]["avatar"].string!)
            cell.ava.kf.setImage(with: url)
        }
        else{
            cell.ava.image = UIImage(named: "Ava")
        }
        cell.subjectLabel.text = courses[indexPath.row]["subject_name"].string
        cell.idLabel.text = courses[indexPath.row]["card"].string
        cell.price.text = String(courses[indexPath.row]["price"].int!) + " тг/сағ"
        cell.experience.text = courses[indexPath.row]["experience"].string
        cell.education.text = courses[indexPath.row]["education"].string
        cell.about.text = courses[indexPath.row]["about"].string
        return cell
    }
    
    func getData(){
        let headers: HTTPHeaders = [
            "Authorization": "Token " + defaults.string(forKey: "Token")!,
          "Accept": "application/json"
        ]
        
        AF.request(GlobalVariables.url + "online_course/" + id, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            let json = try? JSON(data: response.data!)
            if json != nil{
                self.courses = json?.array as! [JSON]
                self.mainTableView.reloadData()
            }
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}



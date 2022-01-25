import Foundation
import UIKit

class SubjectsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var Subjects = ["Математикалық сауаттылық", "Оқу сауаттылығы", "Қазақстан тарихы", "Физика", "Математика", "Биология", "Химия", "Дүниежүзі тарихы", "Құқық", "География", "Қазақ тілі мен әдебиет", "Ағылшын тілі"]
    let defaults = UserDefaults.standard
    var fromMain = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromMain = defaults.bool(forKey: "fromMain")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubTVCell", for: indexPath) as! SubjectsTableViewCell
        cell.subjectTitle.text = Subjects[indexPath.row]
        cell.subjectIcon.image = UIImage(named: "Icon" + String(indexPath.row+1))
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 11{
            defaults.set(String(indexPath.row+2), forKey: "CurrentSubID")
        }
        else{
            defaults.set(String(indexPath.row+1), forKey: "CurrentSubID")
        }
        
        if fromMain == false{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"SendQuestionController")
            self.present(viewController, animated: true)
        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = storyboard.instantiateViewController(withIdentifier :"TestAnswersController")
            self.present(viewController, animated: true)
        }
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

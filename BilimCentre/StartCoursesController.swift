import UIKit
import Foundation

class StartCoursesController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func untButton(_ sender: UIButton) {
        defaults.set("1", forKey: "courseID")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"CoursesController")
        self.present(viewController, animated: true)
    }
    
    @IBAction func ktlButton(_ sender: UIButton) {
        defaults.set("2", forKey: "courseID")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"CoursesController")
        self.present(viewController, animated: true)
    }
    
    @IBAction func englishButton(_ sender: UIButton) {
        defaults.set("3", forKey: "courseID")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"CoursesController")
        self.present(viewController, animated: true)
    }
    
    @IBAction func prodlenkaButton(_ sender: UIButton) {
        defaults.set(false, forKey: "fromMain")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"SubjectsController")
        self.present(viewController, animated: true)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

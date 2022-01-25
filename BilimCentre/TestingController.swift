import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class TestingController: UIViewController {
    
    
    @IBOutlet weak var currentQuestion: UILabel!
    @IBOutlet weak var segmentControlOutlet: UISegmentedControl!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    
    let defaults = UserDefaults.standard
    var TestType = ""
    var subject1 = ""
    var subject2 = ""
    
    var Sub1 = [JSON]()
    var Sub2 = [JSON]()
    var Sub3 = [JSON]()
    var Sub4 = [JSON]()
    var Sub5 = [JSON]()
    
    var currentInd = 1
    var currentSubjectCount = 20
    var currentSubjectIndex = 1
    
    
    @IBOutlet weak var A_Button_Outlet: UIButton!
    @IBOutlet weak var B_Button_Outlet: UIButton!
    @IBOutlet weak var C_Button_Outlet: UIButton!
    @IBOutlet weak var D_Button_Outlet: UIButton!
    @IBOutlet weak var E_Button_Outlet: UIButton!
    @IBOutlet weak var F_Button_Outlet: UIButton!
    @IBOutlet weak var G_Button_Outlet: UIButton!
    @IBOutlet weak var H_Button_Outlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for i in (1...20){
//            Sub1Q.append(String(i) + " Қазақ хандығы құрылған жыл? 1")
//            Sub2Q.append(String(i) + " Қазақ хандығы құрылған жыл? 2")
//            Sub3Q.append(String(i) + " Қазақ хандығы құрылған жыл? 3")
//        }
//        for i in (1...40){
//            Sub4Q.append(String(i) + " Қазақ хандығы құрылған жыл? 4")
//            Sub5Q.append(String(i) + " Қазақ хандығы құрылған жыл? 5")
//        }
        
        TestType = defaults.string(forKey: "TestType")!
        if TestType == "Subject"{
            segmentControlOutlet.alpha = 0.0
            self.subject1 = defaults.string(forKey: "Subject1")!
            getTestForSubject()
        }
        else{
            self.subject1 = defaults.string(forKey: "Subject1")!
            self.subject2 = defaults.string(forKey: "Subject2")!
            getTestForUNT()
        }
        currentQuestion.text = String(currentInd) + "/" + String(currentSubjectCount)
        
        F_Button_Outlet.alpha = 0.0
        G_Button_Outlet.alpha = 0.0
        H_Button_Outlet.alpha = 0.0
        
        A_Button_Outlet.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        B_Button_Outlet.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        C_Button_Outlet.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        D_Button_Outlet.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        E_Button_Outlet.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        F_Button_Outlet.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        G_Button_Outlet.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        H_Button_Outlet.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    }
    
    
    @IBAction func segmentControlAction(_ sender: UISegmentedControl) {
        currentInd = 1
        if sender.selectedSegmentIndex == 0{
            currentSubjectCount = 20
            questionLabel.text = Sub1[currentInd-1]["text"].string
            currentSubjectIndex = 1
        }
        if sender.selectedSegmentIndex == 1{
            currentSubjectCount = 20
            questionLabel.text = Sub2[currentInd-1]["text"].string
            currentSubjectIndex = 2
        }
        if sender.selectedSegmentIndex == 2{
            currentSubjectCount = 20
            questionLabel.text = Sub3[currentInd-1]["text"].string
            currentSubjectIndex = 3
        }
        if sender.selectedSegmentIndex == 3{
            currentSubjectCount = 40
            questionLabel.text = Sub4[currentInd-1]["text"].string
            currentSubjectIndex = 4
        }
        if sender.selectedSegmentIndex == 4{
            currentSubjectCount = 40
            questionLabel.text = Sub5[currentInd-1]["text"].string
            currentSubjectIndex = 5
        }
        currentQuestion.text = String(currentInd) + "/" + String(currentSubjectCount)
        
        F_Button_Outlet.alpha = 0.0
        G_Button_Outlet.alpha = 0.0
        H_Button_Outlet.alpha = 0.0
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func finishButton(_ sender: UIButton) {
    }
    
    @IBAction func prevButton(_ sender: UIButton) {
        if currentInd > 1 {
            currentInd -= 1
            currentQuestion.text = String(currentInd) + "/" + String(currentSubjectCount)
            if currentInd > 20{
                F_Button_Outlet.alpha = 1.0
                G_Button_Outlet.alpha = 1.0
                H_Button_Outlet.alpha = 1.0
            }
            else{
                F_Button_Outlet.alpha = 0.0
                G_Button_Outlet.alpha = 0.0
                H_Button_Outlet.alpha = 0.0
            }
            
            if currentSubjectIndex == 1{
                questionLabel.text = Sub1[currentInd-1]["text"].string
                if self.Sub1[self.currentInd-1]["question_photo"].count == 0{
                    self.imageHeight.constant = 0
                }
                else{
                    self.imageHeight.constant = 100
                }
            }
            else if currentSubjectIndex == 2{
                questionLabel.text = Sub2[currentInd-1]["text"].string
            }
            else if currentSubjectIndex == 3{
                questionLabel.text = Sub3[currentInd-1]["text"].string
            }
            else if currentSubjectIndex == 4{
                questionLabel.text = Sub4[currentInd-1]["text"].string
            }
            else if currentSubjectIndex == 5{
                questionLabel.text = Sub5[currentInd-1]["text"].string
            }
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if currentInd < currentSubjectCount {
            currentInd += 1
            currentQuestion.text = String(currentInd) + "/" + String(currentSubjectCount)
            if currentInd > 20{
                F_Button_Outlet.alpha = 1.0
                G_Button_Outlet.alpha = 1.0
                H_Button_Outlet.alpha = 1.0
            }
            else{
                F_Button_Outlet.alpha = 0.0
                G_Button_Outlet.alpha = 0.0
                H_Button_Outlet.alpha = 0.0
            }
            
            if currentSubjectIndex == 1{
                questionLabel.text = Sub1[currentInd-1]["text"].string
                if self.Sub1[self.currentInd-1]["question_photo"].count == 0{
                    self.imageHeight.constant = 0
                }
                else{
                    self.imageHeight.constant = 100
                }
            }
            else if currentSubjectIndex == 2{
                questionLabel.text = Sub2[currentInd-1]["text"].string
            }
            else if currentSubjectIndex == 3{
                questionLabel.text = Sub3[currentInd-1]["text"].string
            }
            else if currentSubjectIndex == 4{
                questionLabel.text = Sub4[currentInd-1]["text"].string
            }
            else if currentSubjectIndex == 5{
                questionLabel.text = Sub5[currentInd-1]["text"].string
            }
            
            
        }
    }
    
    func getTestForSubject(){
        AF.request(GlobalVariables.url + "ent/oneSubject/" + subject1, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            let json = try? JSON(data: response.data!)
            print(json)
            self.Sub1 = json?.array as! [JSON]
            self.questionLabel.text = self.Sub1[self.currentInd-1]["text"].string
            if self.Sub1[self.currentInd-1]["question_photo"].count == 0{
                self.imageHeight.constant = 0
            }
            else{
                self.imageHeight.constant = 100
            }
            self.currentSubjectCount = self.Sub1.count
        }
    }
    
    func getTestForUNT(){
        let parameters = ["sub_id1" : subject1, "sub_id2" : subject2]
        AF.request(GlobalVariables.url + "ent/pass", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            let json = try? JSON(data: response.data!)
            print(json)
        }
    }
    
    @IBAction func A_Button_Tapped(_ sender: UIButton) {
    }
    
    @IBAction func B_Button_Tapped(_ sender: UIButton) {
    }
    
    @IBAction func C_Button_Tapped(_ sender: UIButton) {
    }
    
    @IBAction func D_Button_Tapped(_ sender: UIButton) {
    }
    
    @IBAction func E_Button_Tapped(_ sender: UIButton) {
    }
    
    @IBAction func F_Button_Tapped(_ sender: UIButton) {
    }
    
    @IBAction func G_Button_Tapped(_ sender: UIButton) {
    }
    
    @IBAction func H_Button_Tapped(_ sender: UIButton) {
    }
    
}

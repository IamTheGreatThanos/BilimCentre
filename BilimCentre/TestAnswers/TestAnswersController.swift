import UIKit
import Foundation
import Alamofire
import Kingfisher
import SwiftyJSON
import WebKit

class TestAnswersController: UIViewController, UITableViewDelegate, UITableViewDataSource, WKNavigationDelegate {
    
    @IBOutlet weak var mainTableView: UITableView!
    let defaults = UserDefaults.standard
    var Questions = [JSON]()
    var subID = ""
    var contentHeights : [CGFloat] = [100.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...29{
            contentHeights.append(100.0)
        }
        subID = defaults.string(forKey: "CurrentSubID")!
        getData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Questions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TATVCell", for: indexPath) as! TestAnswersTableViewCell
        cell.questionWebView.tag = indexPath.row
        cell.answerWebView.tag = indexPath.row
        cell.questionWebView.navigationDelegate = self
        cell.answerWebView.navigationDelegate = self
        cell.questionWebView.loadHTMLString(Questions[indexPath.row]["text"].stringValue, baseURL: nil)
        cell.answerWebView.loadHTMLString(Questions[indexPath.row]["rights"][0]["text"].stringValue, baseURL: nil)
        cell.qHeight.constant = contentHeights[indexPath.row]
        cell.aHeight.constant = contentHeights[indexPath.row]
        
        return cell
        
    }
    
    func getData(){
        let headers: HTTPHeaders = [
            "Authorization": "Token " + defaults.string(forKey: "Token")!,
          "Accept": "application/json"
        ]
        AF.request(GlobalVariables.url + "ent/answers/" + subID, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { response in
            let json = try? JSON(data: response.data!)
            if json != nil{
                self.Questions = json?.array as! [JSON]
                self.mainTableView.reloadData()
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let js = "document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust='300%'"
        webView.evaluateJavaScript(js, completionHandler: nil)
        
//        if contentHeights[webView.tag] != 10.0{
//            return
//        }
//        else{
//            contentHeights[webView.tag] = webView.scrollView.contentSize.height
//            mainTableView.reloadRows(at: [IndexPath(row: webView.tag, section: 0)], with: .automatic)
//        }
    }
    
    
    @IBAction func backButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

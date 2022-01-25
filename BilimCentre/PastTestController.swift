import UIKit
import Foundation
import WebKit
import Alamofire
import SwiftyJSON
import Kingfisher

class PastTestController: UIViewController, WKScriptMessageHandler, UIScrollViewDelegate, WKNavigationDelegate {
    
    let defaults = UserDefaults.standard
    
    var load_url = "http://webview.bilimcentre.kz/"
    var TestType = ""
    var subject1 = ""
    var subject2 = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load_url += "?key=" + defaults.string(forKey: "Token")!
        TestType = defaults.string(forKey: "TestType")!
        if TestType == "Subject"{
            self.subject1 = defaults.string(forKey: "Subject1")!
            load_url += "&type=1&sub1=" + subject1
        }
        else{
            self.subject1 = defaults.string(forKey: "Subject1")!
            self.subject2 = defaults.string(forKey: "Subject2")!
            load_url += "&type=2&sub1=" + subject1 + "&sub2=" + subject2
        }
        
        let config = WKWebViewConfiguration()
        let source = "var meta = document.createElement('meta');" +
            "meta.name = 'viewport';" +
            "meta.content = 'width=device-width, shrink-to-fit=YES, initial-scale=1.0, maximum-scale=1.0, user-scalable=no';" +
            "var head = document.getElementsByTagName('head')[0];" +
            "head.appendChild(meta);"
        let script = WKUserScript(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        config.userContentController.addUserScript(script)
        
        config.userContentController.add(self, name: "iosListener")
        let webView = WKWebView(frame: self.view.bounds, configuration: config)
        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: load_url)!))
        webView.scrollView.delegate = self
        self.view = webView
        
    }
    
    //MARK: - UIScrollViewDelegate
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        showAction()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            let javascriptStyle = "var css = '*{-webkit-touch-callout:none;-webkit-user-select:none}'; var head = document.head || document.getElementsByTagName('head')[0]; var style = document.createElement('style'); style.type = 'text/css'; style.appendChild(document.createTextNode(css)); head.appendChild(style);"
            webView.evaluateJavaScript(javascriptStyle, completionHandler: nil)
        }
    
    func showAction(){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Назар салыңыз!", message: "Тест аяқталған жоқ шыққыңыз келеді ме?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Иә", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Жоқ", style: .cancel, handler: { action in
            
        }))
        
        self.present(alert, animated: true)
    }
    
    
}

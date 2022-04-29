//
//  ViewController.swift
//  myWKWebViewApp
//
//  Created by anh thu on 2022-02-22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    @IBOutlet weak var siteView: WKWebView!
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadSpinner.isHidden = false
        loadAddress()
        
        siteView.navigationDelegate = self
        self.view.addSubview(loadSpinner)
        
        siteView = WKWebView()
    }
    func loadAddress() {
        let myURL = URL(string:"https://www.google.com")
        let request = URLRequest(url: myURL!)
        siteView.load(request)
    }
    
    func webView (_ webView: WKWebView, didStartProvisionalNavigation navigation:
     WKNavigation! ) {
        print("Start to Load")
        loadSpinner.startAnimating()
    }
    
    func webView (_ webView: WKWebView, didFinish navigation: WKNavigation! ) {
        print("Finish to Load")
        loadSpinner.startAnimating()
        loadSpinner.isHidden = true
    }
}
extension UIActivityIndicatorView {
    func scaleIndicator(factor: CGFloat) {
        transform = CGAffineTransform(scaleX: factor, y: factor)
    }
}


//
//  WebViewController.swift
//  MarzipanPlatter
//
//  Created by Michael Thomas on 6/12/18.
//  Copyright © 2018 Biscuit Labs. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(webView)
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // Load the page
        let request = URLRequest(url: URL(string: "https://www.apple.com/macos/mojave-preview/")!)
        webView.load(request)
    }
}

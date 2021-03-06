//
//  ViewController.swift
//  Webview Test
//
//  Created by Ryang Sohn on 2020/01/24.
//  Copyright © 2020 Ryang Sohn. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConf = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConf)
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        view = webView
    }

    override func viewDidLoad() {
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) {records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
            }
        }
        
        super.viewDidLoad()
        let startURL = URL(string: "https://www.google.com")
        let req = URLRequest(url: startURL!)
        webView.load(req)
    }


}


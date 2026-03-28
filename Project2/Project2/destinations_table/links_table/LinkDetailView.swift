//
//  LinkDetailView.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/23/26.
//
import UIKit
import SnapKit
import WebKit

class LinkDetailView: UIViewController {
    let webView = WKWebView()
    var url: URL?
    
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        webView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        if let url = url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

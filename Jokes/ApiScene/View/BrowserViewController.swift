//
//  BrowserViewController.swift
//  Jokes
//
//  Created by Антон Хомяков on 14/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit
import WebKit
import MBProgressHUD

class BrowserViewController: UIViewController {

    // MARK: - Properties

    var presenter: BrowserPresenterProtocol?
    var webView: WKWebView?

    // MARK: - Outlets

    @IBOutlet private weak var rootView: UIView!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupWebView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPresenter().onViewDidApear()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Browser_Title".localize()
    }

    // MARK: - Private

    private func setupWebView() {
        let webView = WKWebView()
        self.webView = webView
        rootView.addSubview(webView)
        webView.stretchToSuperview()
        webView.navigationDelegate = self
    }

    private func getPresenter() -> BrowserPresenterProtocol {
        guard let presenter = presenter else {
            fatalError("Could not get presenter")
        }
        return presenter
    }
}

// MARK: - BrowserViewProtocol

extension BrowserViewController: BrowserViewProtocol {

    func startPreloader() {
        MBProgressHUD.showAdded(to: view, animated: true).isUserInteractionEnabled = true
    }

    func stopPreloader() {
        MBProgressHUD.hide(for: view, animated: true)
    }

    func navigateToUrl(_ url: URL) {
        let myRequest = URLRequest(url: url)
        getWebView().load(myRequest)
    }

    // MARK: - Private

    private func getWebView() -> WKWebView {
        guard let view = webView else {
            fatalError("Could not get WebView")
        }
        return view
    }
}

// MARK: - WKNavigationDelegate

extension BrowserViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation) {
        getPresenter().onLoadingFinished()
    }
}

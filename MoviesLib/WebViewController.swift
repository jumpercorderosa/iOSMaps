//
//  WebViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 11/09/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loading.startAnimating()
        webView.delegate = self
        
        // Do any additional setup after loading the view.
        let webUrl = URL(string:url)!
        let request = URLRequest(url: webUrl)
        webView.loadRequest(request)
    }

    var url: String!
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func runJS(_ sender: Any) {
        
            webView.stringByEvaluatingJavaScript(from: "alert('Rodando Javascript na WebView')")
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WebViewController:UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loading.stopAnimating()
    }
    
    //restringir acesso
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let absoluteString = request.url!.absoluteString
        
        //tira qlqr url que contenha facebook
        if absoluteString.range(of: "facebook") != nil {
            
            let alert = UIAlertController(title: "ERRO", message: "Facebook esta proibido desse App",
                                          preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (ACTION) in
                print("O usuario apertou o OK")
            })
            
            let cancelAction = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            present(alert, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
}

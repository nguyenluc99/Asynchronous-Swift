//
//  ViewController.swift
//  Asynchronous
//
//  Created by Luc Nguyen on 7/16/19.
//  Copyright © 2019 Luc Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var group = DispatchGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlB = URL(string : "https://www.facebook.com") else {
            return
        }
        guard let urlC = URL(string : "https://www.google.com") else {
            return
        }
        guard let urlA = URL(string : "https://www.youtube.com") else {
            return
        }
//        let semaphore = DispatchSemaphore(value : 2)
//        semaphore.wait()
//        DispatchQueue.main.async{
            self.getDataFromUrl(url: urlB)
            self.getDataFromUrl(url: urlA)
//            DispatchQueue.main.sync {
                self.getDataFromUrl(url: urlC)
//            }
//        } 
//        semaphore.wait()
//        semaphore.wait()
//        print("urlC  ")
//        getDataFromUrl(url: urlC)
//        DispatchQueue.main.async{
//        group.enter()
//        group.enter()
//        getDataFromUrl(url: urlA)
//        getDataFromUrl(url: urlB)
//            }
//
//        group.notify(queue : .global()) {
//            print(52)
//            self.getDataFromUrl(url: urlC)
//        }
//        getDataInOrder(urlA: urlA, urlB: urlB)  {(_,_) -> Void in
//            print(50)
//            self.getDataFromUrl(url: urlC)
//            print(52)
//        }
//        group.enter()
//        getDataInOrder(urlA: urlA, urlB: urlB) {
//            print(55)
//            self.getDataFromUrl(url: urlC)
//            print(57)
////            self.group.leave()
//        }
        
    }
    func getDataFromUrl(url : URL) { //, completion : ()->()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(url, error)
            }
            if let data = data  {
                print(url, data)
            }
            
//        }
        }.resume()
    }
    func getDataInOrder(urlA : URL, urlB : URL, completion :@escaping () -> Void) {
        DispatchQueue.main.async {
            self.getDataFromUrl(url: urlA)
            self.getDataFromUrl(url: urlB)
        }
        completion()
    }
}


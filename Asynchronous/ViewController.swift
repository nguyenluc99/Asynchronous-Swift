//
//  ViewController.swift
//  Asynchronous
//
//  Created by Luc Nguyen on 7/16/19.
//  Copyright © 2019 Luc Nguyen. All rights reserved.
//

import UIKit

typealias Completion = () -> ()
class ViewController: UIViewController {

    let group = DispatchGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let urlC = URL(string : "https://www.facebook.com") else {
            return
        }
        guard let urlB = URL(string : "https://www.google.com") else {
            return
        }
        guard let urlA = URL(string : "https://www.youtube.com") else {
            return
        }
//        self.group.enter()
//        DispatchQueue.main.async {
//            self.getDataFromUrl(url: urlA, completion: { () in
//                self.group.leave()
//            })
//            self.group.enter()
//            self.getDataFromUrl(url: urlB, completion: { () in
//                self.group.leave()
//            })
//        }
//        getDataFromUrl(url: urlC, completion: {
//
//        })
        
        
        
        //        getDataFromUrl(url: urlC)
        let semaphore = DispatchSemaphore(value : 0)
//        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: urlA) { (data, response, error) in
                if let data = data {print(urlA, data)} else {print(urlA)}
                semaphore.signal()
            }.resume()
//        }
        URLSession.shared.dataTask(with: urlB) {(data, response, error) in
            if let data = data {print(urlB, data)} else {print(urlB)}
            semaphore.signal()
        }.resume()
        semaphore.wait()
        semaphore.wait()
//        semaphore.wait()
        URLSession.shared.dataTask(with: urlC) { (data, response, error) in
            if let data = data {print(urlC, data)} else {print(urlC)}

        }.resume()
//        semaphore.signal()
        		
        
        
//        semaphore.wait()
//        DispatchQueue.main.async{
//            self.getDataFromUrl(url: urlB)
//            self.getDataFromUrl(url: urlA)
////            DispatchQueue.main.sync {
//                self.getDataFromUrl(url: urlC)
////            }
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
//        getDataInOrder(urlA: urlA, urlB: urlB)  {() -> Void in
//            print(50)
//            self.getDataFromUrl(url: urlC)
//            print(52)
//        }
//        group.enter()
//            getDataInOrder(urlA: urlA, urlB: urlB)
//        getDataInOrder(urlA: urlA, urlB: urlB) { () in
//            URLSession.shared.dataTask(with: urlC) {(d,r,e) in
//                print(urlC, d)
//            }.resume()
//        }
    }
    func getDataFromUrl(urlA : URL, urlB : URL) { //, completion : ()->()
        DispatchQueue.main.async{
            URLSession.shared.dataTask(with: urlA) { (data, response, error) in
                if let error = error {
                    print(urlA, error)
                }
                if let data = data  {
                    print(urlA, data)
                }
    //            return
    //        }
            }.resume()
            URLSession.shared.dataTask(with: urlB) { (data, response, error) in
                if let error = error {
                    print(urlB, error)
                }
                if let data = data  {
                    print(urlB, data)
                }
                //            return
                //        }
            }.resume()
        }
//        return
    }
    func getDataInOrder(urlA : URL, urlB : URL,completion: Completion){
//         DispatchQueue.main.sync {
            self.getDataFromUrl(urlA: urlA, urlB : urlB)
//        }
        completion()
//    return a
//        return
    }
}


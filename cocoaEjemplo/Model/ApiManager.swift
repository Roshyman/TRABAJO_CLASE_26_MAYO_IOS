//
//  ApiManager.swift
//  cocoaEjemplo
//
//  Created by Ronald Murillo Solano on 26/5/18.
//  Copyright © 2018 Ronald Murillo Solano. All rights reserved.
//

import Foundation
import SwiftyJSON

class ApiManager: NSObject{
    
    let baseURL = "https://jsonplaceholder.typicode.com"
    static let sharedInstance = ApiManager()
    static let getPostsEndpoint = "/posts/"
    static let getUsersEndpoint = "/users/"
    static let getCommentsEndpoint = "/comments/"
    
    func getPostWithId(postId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseURL + ApiManager.getPostsEndpoint + String(postId)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                do{
                    let result = try JSON(data: data!)
                        onSuccess(result)
                }
                catch{
                    onFailure(error)
                }
                
            }
        })
        task.resume()
    }
    
    
    
    func getUsersWithId(postId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseURL + ApiManager.getUsersEndpoint + String(postId)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                do{
                    let result = try JSON(data: data!)
                    onSuccess(result)
                }
                catch{
                    onFailure(error)
                }
                
            }
        })
        task.resume()
    }
    
    
    func getCommentsWithId(postId: Int, onSuccess: @escaping(JSON) -> Void, onFailure: @escaping(Error) -> Void){
        let url : String = baseURL + ApiManager.getCommentsEndpoint + String(postId)
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if(error != nil){
                onFailure(error!)
            } else{
                do{
                    let result = try JSON(data: data!)
                    onSuccess(result)
                }
                catch{
                    onFailure(error)
                }
                
            }
        })
        task.resume()
    }
    
}

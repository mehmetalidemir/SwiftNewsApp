//
//  Webservice.swift
//  HaberProjesi
//
//  Created by Mehmet Ali Demir on 6.08.2022.
//

import Foundation

class Service {
    
    func downloadNews(url: URL, completion: @escaping ([News]?) -> () ) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let newsArray = try? JSONDecoder().decode([News].self, from: data)
                
                if let haberlerDizisi = newsArray {
                    completion(haberlerDizisi)
                }      
            }
        }.resume()
        
    }
}

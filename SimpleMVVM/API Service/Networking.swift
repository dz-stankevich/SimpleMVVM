//
//  Networking.swift
//  SimpleMVVM
//
//  Created by Дмитрий Станкевич on 10.02.22.
//


import Foundation
import UIKit

struct NetworkManager {
    func fetchImage(code: Int, complition: @escaping (UIImage) -> Void) {
        var apiImage = UIImage()
    
        let session = URLSession.shared
        let url1 = URL(string: "https://http.cat/" + String(code))!
        session.dataTask(with: url1) {data, response, error in
            guard let tempData = data else {return}
            
            apiImage = UIImage(data: tempData)!
            
            DispatchQueue.main.async {
                complition(apiImage)
            }
            
        }.resume()
    }
}

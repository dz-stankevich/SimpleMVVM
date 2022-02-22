//
//  ViewModel.swift
//  SimpleMVVM
//
//  Created by Дмитрий Станкевич on 10.02.22.
//

import Foundation
import UIKit

class ViewModel {
    //MARK: - View Varibles
    let networkManager = NetworkManager()
    var networkCode: Int = 100 {
        willSet {
            networkManager.fetchImage(code: newValue) { image in
                self.image = image
            }
        }
    }
    
    private(set) var image: UIImage! {
        didSet {
            self.bindViewModelToView()
        }
    }
    
    //MARK: - Closure
    var bindViewModelToView: (() -> ()) = {}
    
    //MARK: - Methods
    
    
    func believeCode(codeString: String?) {
        guard let codeString = codeString, Int(codeString) != nil else {
            return
        }
        if let code = Int(codeString), code < 600 && code >= 100 {
            self.networkCode = code
        } else {
            print("error")
        }
            
        
    }
    
    
}

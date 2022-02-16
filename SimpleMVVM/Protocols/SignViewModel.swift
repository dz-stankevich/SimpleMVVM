//
//  SignViewModel.swift
//  SimpleMVVM
//
//  Created by Дмитрий Станкевич on 10.02.22.
//

import Foundation

protocol SignViewModel {
    var networkCode: String? {get set}
    
    func buttonPressed()
}

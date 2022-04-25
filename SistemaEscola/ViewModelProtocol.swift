//
//  ViewModelProtocol.swift
//  SistemaEscola
//
//  Created by Marilise Morona on 24/04/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import Foundation

protocol ViewModelProtocol: AnyObject{
    
    func changeOutputMessage(message: String) -> String
    
}

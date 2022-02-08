//
//  Extension + String.swift
//  SkyLark Weather
//
//  Created by Владислав Баранкевич on 08.02.2022.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}

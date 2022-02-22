//
//  HaseOperation.swift
//  DesignPatterns
//
//  Created by stone on 2022/2/22.
//

import Foundation

class HaseOperation {
    private let openCommand: DoorCommand
    private let closeCommand: DoorCommand
    private let doorName: String
    
    init(_ doorName: String) {
        self.doorName = doorName
        openCommand = OpenCommand(doorName)
        closeCommand = CloseCommand(doorName)
    }
    
    func open() {
        openCommand.execute()
    }
    
    func close() {
        closeCommand.execute()
    }
}

//
//  DoorCommand.swift
//  DesignPatterns
//
//  Created by stone on 2022/2/22.
//

import Foundation

protocol DoorCommand {
    func execute() -> Void
}

class OpenCommand: DoorCommand {
    let door: String
    
    init(_ door: String) {
        self.door = door
    }
    
    func execute() {
        print("Open the door: " + door)
    }
}

class CloseCommand: DoorCommand {
    let door: String
    
    init(_ door: String) {
        self.door = door
    }
    
    func execute() {
        print("Close the door: " + door)
    }
}

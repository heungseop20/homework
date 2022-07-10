//
//  Data.swift
//  homework
//
//  Created by heungseop sim on 2022/07/07.
//
import Foundation

struct Photo : Codable {
    var thumbnail : String
    var username : String
    var likesCount : Int
    var createdAt : String
}

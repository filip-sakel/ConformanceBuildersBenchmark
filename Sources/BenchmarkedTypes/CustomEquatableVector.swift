//
//  CustomEquatableVector.swift
//  
//
//  Created by Filippos Sakellariou on 29/3/21.
//

/// A vector with a custom Equatable implementation.
///
/// Two instances are equal when both components (`x` and `y`)
/// are equal between said instances.
public struct CustomEquatableVector: Equatable {
    let x, y: Double
    
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    public static func == (a: Self, b: Self) -> Bool {
        a.x == b.x && a.y == b.y
    }
}

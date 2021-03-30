//
//  DefaultEquatableVector.swift
//  
//
//  Created by Filippos Sakellariou on 29/3/21.
//

/// A vector with a default Equatable synthesis.
///
/// Two instances are equal when both components (`x` and `y`)
/// are equal between said instances.
public struct DefaultEquatableVector: Equatable {
    let x, y: Double
    
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

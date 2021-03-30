//
//  VectorEquatableSuite.swift
//  
//
//  Created by Filippos Sakellariou on 30/3/21.
//

import Benchmark
import BenchmarkedTypes

@inline(never)
func use<T>(_: T) {}

public let vectorEquatableSuite = BenchmarkSuite(name: "VectorEquatableSuite") { suite in
    func random() -> Double {
        return Double.random(in: .leastNormalMagnitude ... .greatestFiniteMagnitude)
    }
    
    suite.benchmark("CustomEquatableVector") {
        for _ in 0 ... 100_000 {
            let a = CustomEquatableVector(x: random(), y: random()),
                b = CustomEquatableVector(x: random(), y: random())
            
            use(a == b)
        }
    }
    
    suite.benchmark("DefaultEquatableVector") {
        for _ in 0 ... 100_000 {
            let a = DefaultEquatableVector(x: random(), y: random()),
                b = DefaultEquatableVector(x: random(), y: random())
            
            use(a == b)
        }
    }
    
    suite.benchmark("SynthesizedEquatableVector") {
        for _ in 0 ... 100_000 {
            let a = SynthesizedEquatableVector(x: random(), y: random()),
                b = SynthesizedEquatableVector(x: random(), y: random())
            
            use(a == b)
        }
    }
}

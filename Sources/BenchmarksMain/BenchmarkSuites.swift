//
//  BenchmarkSuites.swift
//  
//
//  Created by Filippos Sakellariou on 30/3/21.
//

import Benchmark

public let suites = [
    vectorEquatableSuite
]

@main
public struct Suites {
    static func main() {
        Benchmark.main(suites)
    }
}

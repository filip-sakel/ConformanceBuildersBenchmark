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

public func runBenchmarks() {
    runTests(suites: suites)
}

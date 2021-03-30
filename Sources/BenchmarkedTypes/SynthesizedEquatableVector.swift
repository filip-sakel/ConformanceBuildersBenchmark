/// An `Equatable` conformance builder for vector types.
struct VectorEquatable<
    Root,
    E1: Equatable,
    E2: Equatable
>: Equatable {
    let root: Root
    let properties: (E1, E2)
    
    init(
        root: Root,
        properties e1: KeyPath<Root, E1>,
        _ e2: KeyPath<Root, E2>
    ) {
        self.root = root
        self.properties = (
            root[keyPath: e1],
            root[keyPath: e2]
        )
    }
    
    static func == (a: Self, b: Self) -> Bool {
        a.properties.0 == b.properties.0
        && a.properties.1 == b.properties.1
    }
}

/// A vector with custom `VectorEquatable` Equatable
/// "synthesis".
///
/// Two instances are equal when both components (`x` and `y`)
/// are equal between said instances.
///
/// No actual synthesis occurs; the following code emulates
/// the transoformed code.
public struct SynthesizedEquatableVector: Equatable {
    let x, y: Double
    
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    public static func == (a: Self, b: Self) -> Bool {
        VectorEquatable(
            root: a,
            properties: \Self.x, \Self.y
        ) == VectorEquatable(
            root: b,
            properties: \Self.x, \Self.y
        )
    }
}


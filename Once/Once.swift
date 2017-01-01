//
//  Once.swift
//  Once
//
//  Created by Suguru Kishimoto on 9/25/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public typealias OnceClosure = (() -> Void)?

public final class Once {
    private init() {}

    public static func execute(_ execute: () -> Void) -> OnceClosure {
        execute()
        return { return nil }()
    }
}


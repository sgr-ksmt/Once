//
//  Once.swift
//  Once
//
//  Created by Suguru Kishimoto on 9/25/16.
//  Copyright © 2016 Suguru Kishimoto. All rights reserved.
//

import Foundation

public typealias OnceClosure = (() -> Void)?
public func execute_once(_ execute: () -> Void) -> OnceClosure {
    execute()
    return { return nil }()
}

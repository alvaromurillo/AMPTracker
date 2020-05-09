//
//  AMPTracker.swift
//  AMPTracker
//
//  Created by Álvaro Murillo del Puerto on 09/05/2020.
//

import Foundation

public protocol AMPTrackerClient {
    func setup()
    func set(userID: String)
    func set(property: String, value: Any)
    func incremen(property: String, by: Double)
    func track(event: String, params: [String: Any]?)
}

public final class AMPTracker {

    private let trackers: [AMPTrackerClient]

    public init(trackers: [AMPTrackerClient]) {
        self.trackers = trackers
    }

    public func setup() {
        trackers.forEach { $0.setup() }
    }

    public func set(userID: String) {
        trackers.forEach { $0.set(userID: userID) }
    }

    public func set(property: String, value: Any) {
        trackers.forEach { $0.set(property: property, value: value) }
    }

    public func incremen(property: String, by: Double) {
        trackers.forEach { $0.incremen(property: property, by: by) }
    }

    public func trackEvent(event: String, params: [String: Any]?) {
        trackers.forEach { $0.track(event: event, params: params) }
    }
}

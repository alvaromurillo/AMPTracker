//
//  AmplitudeTracker.swift
//  AMPTracker
//
//  Created by Álvaro Murillo del Puerto on 09/05/2020.
//

import Foundation
import Amplitude
import AMPTracker

public final class AmplitudeTracker: AMPTrackerClient {

    private let apiKey: String

    public init(apiKey: String) {
        self.apiKey = apiKey
    }

    public func setup() {
        Amplitude.instance().initializeApiKey(apiKey)
    }

    public func set(userID: String) {
        Amplitude.instance().setUserId(userID, startNewSession: false)
    }

    public func set(property: String, value: Any) {
        let convertedType: NSObject
        if let value = value as? String {
            convertedType = value as NSString
        } else if let value = value as? NSNumber {
            convertedType = value
        } else if let value = value as? NSDate {
            convertedType = value
        } else {
            convertedType = "Error converting type" as NSString
        }
        let identify = AMPIdentify()
        identify.set(property, value: convertedType)
        Amplitude.instance().identify(identify)
    }

    public func incremen(property: String, by: Double) {
        let identify = AMPIdentify()
        identify.add(property, value: NSNumber(value: by))
        Amplitude.instance().identify(identify)
    }

    public func track(event: String, params: [String : Any]?) {
        if let params = params {
            Amplitude.instance().logEvent(
                event,
                withEventProperties: params.reduce(into: [:]) { $0[$1.key] = $1.value }
            )
        } else {
            Amplitude.instance().logEvent(event)
        }
    }
}

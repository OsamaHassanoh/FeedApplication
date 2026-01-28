//
//  NoAuthHandler.swift
//  FeedApplication
//
//  Created by Osama AlMekhlafi on 28/01/2026.
//

import Foundation
class NoAuthHandler: AuthorizationHandler {
    func setAuthManually(authToken: String) {
    }
    func setUidManually(uid: String) {
    }
    var tokenHeader: [String: String] { [:] }
      var clientHeader: [String: String] { [:] }
}

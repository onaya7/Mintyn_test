//
//  WelcomeViewModel.swift
//  Mintyn
//
//  Created by Devonaya on 16/04/2026.
//

import Foundation

/// ViewModel for the Welcome / landing screen.
/// Owns the two possible navigation actions; the ViewController binds
/// to these closures and triggers them on user interaction.
final class WelcomeViewModel {

    // MARK: - Outputs (bindings for the ViewController)

    /// Called when the user taps "Login"
    var onLoginTapped: (() -> Void)?

    /// Called when the user taps "Create account"
    var onCreateAccountTapped: (() -> Void)?

    // MARK: - Inputs (called by the ViewController)

    func loginTapped() {
        onLoginTapped?()
    }

    func createAccountTapped() {
        onCreateAccountTapped?()
    }

    // MARK: - Display data

    let appVersion: String = {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        return "Mintyn Version \(version)"
    }()

    let welcomeTitle    = "Welcome to\nMintyn Digital Bank"
    let welcomeSubtitle = "Get started with the bank that puts you\nin control."
    let loginTitle      = "Login"
    let createTitle     = "Create account"
}

//
//  GradientButton.swift
//  Mintyn
//
//  Created by Devonaya on 16/04/2026.
//

import UIKit

/// A `UIButton` subclass that supports two visual styles:
/// - `.filled`  — gold gradient background, dark title (used for primary CTA)
/// - `.outline` — transparent background with a coloured border and title
///                (adapts automatically for dark/light mode via `traitCollectionDidChange`)
final class GradientButton: UIButton {

    // MARK: - Style

    enum Style {
        case filled
        case outline
    }

    // MARK: - Private

    private let gradientLayer = CAGradientLayer()
    private var style: Style = .filled

    // MARK: - Init

    init(style: Style = .filled) {
        super.init(frame: .zero)
        self.style = style
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        layer.cornerRadius  = bounds.height / 2
        layer.masksToBounds = true
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            applyStyle()
        }
    }

    // MARK: - Setup

    private func commonInit() {
        layer.insertSublayer(gradientLayer, at: 0)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        applyStyle()
    }

    private func applyStyle() {
        switch style {
        case .filled:
            applyFilled()
        case .outline:
            applyOutline()
        }
    }

    private func applyFilled() {
        gradientLayer.colors = [
            UIColor.mintynGoldStart.cgColor,
            UIColor.mintynGoldEnd.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 1, y: 1)
        gradientLayer.isHidden   = false

        layer.borderWidth = 0
        layer.borderColor = UIColor.clear.cgColor
        setTitleColor(.white, for: .normal)
    }

    private func applyOutline() {
        gradientLayer.isHidden = false

        let isDark = traitCollection.userInterfaceStyle == .dark

        if isDark {
            // Transparent background, gold border, gold title
            gradientLayer.colors = [
                UIColor.clear.cgColor,
                UIColor.clear.cgColor
            ]
            layer.borderWidth = 1.5
            layer.borderColor = UIColor.mintynGoldStart.cgColor
            setTitleColor(.mintynGoldStart, for: .normal)
        } else {
            // Solid black background, no border, white title
            gradientLayer.colors = [
                UIColor(hex: "#1A1A1A").cgColor,
                UIColor(hex: "#1A1A1A").cgColor
            ]
            layer.borderWidth = 0
            layer.borderColor = UIColor.clear.cgColor
            setTitleColor(.white, for: .normal)
        }
    }
}

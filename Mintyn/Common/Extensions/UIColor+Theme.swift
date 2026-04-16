//
//  UIColor+Theme.swift
//  Mintyn
//
//  Created by Devonaya on 16/04/2026.
//

import UIKit

extension UIColor {

    // MARK: - Background

    /// Top/hero area background — black (dark) / light gray (light)
    static let mintynTopBackground = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(hex: "#000000")
            : UIColor(hex: "#F2F2F2")
    }

    /// Card / bottom sheet background — dark gray (dark) / white (light)
    static let mintynCardBackground = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(hex: "#1C1C1E")
            : UIColor(hex: "#FFFFFF")
    }

    // MARK: - Text

    /// Primary text — white (dark) / near-black (light)
    static let mintynTextPrimary = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(hex: "#FFFFFF")
            : UIColor(hex: "#1A1A1A")
    }

    /// Secondary / subtitle text
    static let mintynTextSecondary = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(hex: "#AAAAAA")
            : UIColor(hex: "#666666")
    }

    // MARK: - Brand / Gold

    /// Gradient start (top/left) — warm gold
    static let mintynGoldStart = UIColor(hex: "#C4862D")

    /// Gradient end (bottom/right) — deep gold
    static let mintynGoldEnd   = UIColor(hex: "#8B5E0A")

    // MARK: - Outline button

    /// "Create account" border — gold in dark, opaque black in light
    static let mintynOutlineBorder = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(hex: "#C4862D")
            : UIColor(hex: "#1A1A1A")
    }

    /// "Create account" title colour — gold in dark, white in light
    static let mintynOutlineTitle = UIColor { trait in
        trait.userInterfaceStyle == .dark
            ? UIColor(hex: "#C4862D")
            : UIColor(hex: "#FFFFFF")
    }

    // MARK: - Convenience hex initialiser

    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.hasPrefix("#") ? String(hexSanitized.dropFirst()) : hexSanitized

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255
        let g = CGFloat((rgb & 0x00FF00) >>  8) / 255
        let b = CGFloat( rgb & 0x0000FF       ) / 255

        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}

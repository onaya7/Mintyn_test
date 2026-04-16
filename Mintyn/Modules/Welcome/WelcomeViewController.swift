//
//  WelcomeViewController.swift
//  Mintyn
//
//  Created by Devonaya on 16/04/2026.
//

import UIKit

final class WelcomeViewController: UIViewController {

    // MARK: - ViewModel

    private let viewModel: WelcomeViewModel

    // MARK: - UI Elements

    // Top hero area
    private let topView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "mintyn_logo")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    // Bottom card
    private let cardView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 30
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        v.layer.masksToBounds = true
        return v
    }()

    private let titleLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 2
        l.textAlignment = .center
        l.font = UIFont(name: "Georgia-Bold", size: 26) ?? .boldSystemFont(ofSize: 26)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let subtitleLabel: UILabel = {
        let l = UILabel()
        l.numberOfLines = 2
        l.textAlignment = .center
        l.font = .systemFont(ofSize: 15, weight: .regular)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    private let loginButton    = GradientButton(style: .filled)
    private let createButton   = GradientButton(style: .outline)

    private let versionLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.font = .systemFont(ofSize: 12, weight: .regular)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    // MARK: - Init

    init(viewModel: WelcomeViewModel = WelcomeViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.viewModel = WelcomeViewModel()
        super.init(coder: coder)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupConstraints()
        bindViewModel()
        applyColors()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            applyColors()
        }
    }

    // MARK: - Layout

    private func setupHierarchy() {
        view.addSubview(topView)
        topView.addSubview(logoImageView)

        view.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(subtitleLabel)
        cardView.addSubview(loginButton)
        cardView.addSubview(createButton)
        cardView.addSubview(versionLabel)

        loginButton.translatesAutoresizingMaskIntoConstraints  = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([

            // Top view — occupies top 50% of screen
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.50),

            // Logo — centred in top view, constrained width
            logoImageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.50),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),

            // Card — fills bottom half, overlaps top by corner radius amount
            cardView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -30),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // Title
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),

            // Subtitle
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),

            // Login button
            loginButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 36),
            loginButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 54),

            // Create account button
            createButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 14),
            createButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            createButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            createButton.heightAnchor.constraint(equalToConstant: 54),

            // Version label — pinned near bottom
            versionLabel.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 24),
            versionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 24),
            versionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -24),
            versionLabel.bottomAnchor.constraint(lessThanOrEqualTo: cardView.safeAreaLayoutGuide.bottomAnchor, constant: -12)
        ])
    }

    // MARK: - Styling

    private func applyColors() {
        view.backgroundColor          = .mintynTopBackground
        topView.backgroundColor       = .mintynTopBackground
        cardView.backgroundColor      = .mintynCardBackground
        titleLabel.textColor          = .mintynTextPrimary
        subtitleLabel.textColor       = .mintynTextSecondary
        versionLabel.textColor        = .mintynTextSecondary
    }

    // MARK: - ViewModel Binding

    private func bindViewModel() {
        titleLabel.text    = viewModel.welcomeTitle
        subtitleLabel.text = viewModel.welcomeSubtitle
        versionLabel.text  = viewModel.appVersion

        loginButton.setTitle(viewModel.loginTitle, for: .normal)
        createButton.setTitle(viewModel.createTitle, for: .normal)

        loginButton.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        createButton.addTarget(self, action: #selector(createTapped), for: .touchUpInside)
    }

    // MARK: - Actions

    @objc private func loginTapped() {
        viewModel.loginTapped()
    }

    @objc private func createTapped() {
        viewModel.createAccountTapped()
    }
}

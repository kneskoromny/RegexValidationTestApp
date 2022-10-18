import UIKit

class ViewController: UIViewController {

    // MARK: - Private Properties
    
    let titleLabel = UIFactory.titleLabel
    let verticalStackView = UIFactory.verticalStackView
    
    let phoneStackView = UIFactory.horizontalStackView
    let phoneTextField = UIFactory.textField
    let phoneCheckmark = UIFactory.checkmarkImageView
    
    let emailStackView = UIFactory.horizontalStackView
    let emailTextField = UIFactory.textField
    let emailCheckmark = UIFactory.checkmarkImageView
    
    let nameStackView = UIFactory.horizontalStackView
    let nameTextField = UIFactory.textField
    let nameCheckmark = UIFactory.checkmarkImageView
    
    let dateTextField = UIFactory.textField
    let passwordTextField = UIFactory.textField
    let actionButton = UIFactory.actionButton
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        setButtonEnabled(false)
    }

    // MARK: - Private Methods
    
    private func setupView() {
        view.backgroundColor = .systemMint
        phoneTextField.attributedPlaceholder = NSAttributedString(
            string: "Телефон",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Электронная почта",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Имя",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        dateTextField.attributedPlaceholder = NSAttributedString(
            string: "Дата рождения",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwordTextField.isSecureTextEntry = true
        actionButton.addTarget(self, action: #selector(checkFields), for: .touchUpInside)
        
        set(nameCheckmark, isHidden: true)
        set(phoneCheckmark, isHidden: true)
        set(emailCheckmark, isHidden: true)
    }
    
    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameStackView)
        verticalStackView.addArrangedSubview(phoneStackView)
        verticalStackView.addArrangedSubview(emailStackView)
        verticalStackView.addArrangedSubview(passwordTextField)
        verticalStackView.addArrangedSubview(dateTextField)
        verticalStackView.addArrangedSubview(actionButton)
        
        nameStackView.addArrangedSubview(nameTextField)
        nameStackView.addArrangedSubview(nameCheckmark)
        phoneStackView.addArrangedSubview(phoneTextField)
        phoneStackView.addArrangedSubview(phoneCheckmark)
        emailStackView.addArrangedSubview(emailTextField)
        emailStackView.addArrangedSubview(emailCheckmark)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            nameCheckmark.widthAnchor.constraint(equalToConstant: 44),
            phoneTextField.heightAnchor.constraint(equalToConstant: 44),
            phoneCheckmark.widthAnchor.constraint(equalToConstant: 44),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            emailCheckmark.widthAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            dateTextField.heightAnchor.constraint(equalToConstant: 44),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setButtonEnabled(_ isEnabled: Bool) {
        actionButton.isEnabled = isEnabled
        actionButton.backgroundColor = isEnabled ? .systemYellow : .systemGray
    }
    
    private func set(_ view: UIView, isHidden: Bool) {
        view.isHidden = isHidden
    }
    
    // MARK: - Actions
    
    @objc func checkFields() {
        print("I check input")
    }

}


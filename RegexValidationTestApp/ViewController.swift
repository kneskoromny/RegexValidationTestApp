import UIKit

class ViewController: UIViewController {

    // MARK: - Private Properties
    
    let titleLabel = UIFactory.titleLabel
    let verticalStackView = UIFactory.verticalStackView
    let phoneTextField = UIFactory.textField
    let emailTextField = UIFactory.textField
    let nameTextField = UIFactory.textField
    let dateTextField = UIFactory.textField
    let passwordTextField = UIFactory.textField
    let actionButton = UIFactory.actionButton
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
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
    }
    
    private func setupLayout() {
        view.addSubview(titleLabel)
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(nameTextField)
        verticalStackView.addArrangedSubview(phoneTextField)
        verticalStackView.addArrangedSubview(passwordTextField)
        verticalStackView.addArrangedSubview(emailTextField)
        verticalStackView.addArrangedSubview(dateTextField)
        verticalStackView.addArrangedSubview(actionButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verticalStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            phoneTextField.heightAnchor.constraint(equalToConstant: 44),
            passwordTextField.heightAnchor.constraint(equalToConstant: 44),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            dateTextField.heightAnchor.constraint(equalToConstant: 44),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    // MARK: - Actions
    
    @objc func checkFields() {
        print("I check input")
    }

}


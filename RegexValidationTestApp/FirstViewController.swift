import Combine
import UIKit

class FirstViewController: UIViewController, RegexValidable {

    // MARK: - Private Properties
    
    private let titleLabel = UIFactory.titleLabel
    private let verticalStackView = UIFactory.verticalStackView
    
    private let phoneStackView = UIFactory.horizontalStackView
    private let phoneTextField = UIFactory.textField
    private let phoneCheckmark = UIFactory.checkmarkImageView
    
    private let emailStackView = UIFactory.horizontalStackView
    private let emailTextField = UIFactory.textField
    private let emailCheckmark = UIFactory.checkmarkImageView
    
    private let nameStackView = UIFactory.horizontalStackView
    private let nameTextField = UIFactory.textField
    private let nameCheckmark = UIFactory.checkmarkImageView
    
    private let actionButton = UIFactory.actionButton
    
    // MARK: - Combine
    
    @Published private var isValidName = false
    @Published private var isValidPhone = false
    @Published private var isValidEmail = false
    
    private var isValidToSubmit: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest3($isValidName, $isValidEmail, $isValidPhone)
            .map { name, email, phone in
                return name && phone && email
            }.eraseToAnyPublisher()
    }
    
    private var buttonSubscriber: AnyCancellable?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        setupSubscriber()
    
    }

    // MARK: - Private Methods
    
    private func setupView() {
        view.backgroundColor = .systemCyan
        titleLabel.text = "Fill out the form"
        phoneTextField.attributedPlaceholder = NSAttributedString(
            string: "Phone",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        phoneTextField.addTarget(self, action: #selector(phoneTextFieldDidChanged), for: .editingChanged)
        
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        emailTextField.addTarget(self, action: #selector(emailTextFieldDidChanged), for: .editingChanged)
        
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray]
        )
        nameTextField.addTarget(self, action: #selector(nameTextFieldDidChanged), for: .editingChanged)
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
            nameCheckmark.widthAnchor.constraint(equalToConstant: 30),
            nameCheckmark.heightAnchor.constraint(equalToConstant: 30),
            phoneTextField.heightAnchor.constraint(equalToConstant: 44),
            phoneCheckmark.widthAnchor.constraint(equalToConstant: 30),
            phoneCheckmark.heightAnchor.constraint(equalToConstant: 30),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            emailCheckmark.widthAnchor.constraint(equalToConstant: 30),
            emailCheckmark.heightAnchor.constraint(equalToConstant: 30),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func setupSubscriber() {
        buttonSubscriber = isValidToSubmit
            .receive(on: RunLoop.main)
            .sink(receiveValue: { isValid in
                self.actionButton.backgroundColor = isValid ? .systemGreen : .systemGray
                self.actionButton.isEnabled = isValid
            })
    }
    
    private func set(_ view: UIView, isHidden: Bool) {
        view.isHidden = isHidden
    }
    
    // MARK: - Actions
    
    @objc func nameTextFieldDidChanged() {
        isValidName = isValidName(nameTextField.text)
        set(nameCheckmark, isHidden: !isValidName)
    }
    
    @objc func phoneTextFieldDidChanged() {
        isValidPhone = isValidPhone(phoneTextField.text)
        set(phoneCheckmark, isHidden: !isValidPhone)
    }
    
    @objc func emailTextFieldDidChanged() {
        isValidEmail = isValidEmail(emailTextField.text)
        set(emailCheckmark, isHidden: !isValidEmail)
    }
    
    @objc func checkFields() {
        let secondViewController = SecondViewController()
        present(secondViewController, animated: true)
    }

}

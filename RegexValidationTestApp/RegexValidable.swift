import Foundation

enum Patterns {
    
    case name
    case phone
    case email
    
    func getPattern() -> String {
        switch self {
        case .name:
            return #"\b[a-z]+\b"#
        case .phone:
            return #"\b[0-9]{11}\b"#
        case .email:
            return #"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"#
        }
    }
}

protocol RegexValidable {
    
    func isValidName(_ name: String?) -> Bool
    func isValidPhone(_ phone: String?) -> Bool
    func isValidEmail(_ email: String?) -> Bool
}

extension RegexValidable {
    
    func isValidName(_ name: String?) -> Bool {
        let whitespace = " "
        guard let lowercasedName = name?.lowercased(),
              lowercasedName.range(of: whitespace) == nil else {
            return false
        }
        let pattern = Patterns.name.getPattern()
        let range = NSMakeRange(.zero, lowercasedName.count)
        let regex = try? NSRegularExpression(pattern: pattern)
        return regex?.firstMatch(in: lowercasedName, range: range) != nil
    }
    
    func isValidPhone(_ phone: String?) -> Bool {
        guard let trimmingPhone = phone?.trimmingCharacters(in: .symbols) else {
            return false
        }
        let pattern = Patterns.phone.getPattern()
        let range = NSMakeRange(.zero, trimmingPhone.count)
        let regex = try? NSRegularExpression(pattern: pattern)
        return regex?.firstMatch(in: trimmingPhone, range: range) != nil
    }
    
    func isValidEmail(_ email: String?) -> Bool {
        let whitespace = " "
        guard let email = email,
              email.range(of: whitespace) == nil else {
            return false
        }
        let pattern = Patterns.email.getPattern()
        let range = NSMakeRange(.zero, email.count)
        let regex = try? NSRegularExpression(pattern: pattern)
        return regex?.firstMatch(in: email, range: range) != nil
    }
    
}

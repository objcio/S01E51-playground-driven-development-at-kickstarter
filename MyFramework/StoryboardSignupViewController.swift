public class StoryboardSignupViewController: UIViewController {
  @IBOutlet var rootStackView: UIStackView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var emailLabel: UILabel!
  @IBOutlet var emailTextField: UITextField!
  @IBOutlet var emailStackView: UIStackView!
  @IBOutlet
     var nameLabel: UILabel!
  @IBOutlet var nameTextField: UITextField!
  @IBOutlet var nameStackView: UIStackView!
  @IBOutlet var passwordLabel: UILabel!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var passwordStackView: UIStackView!
  @IBOutlet var submitButton: UIButton!
  
    @IBOutlet var disclaimerLabel: UILabel!

  public override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = UIColor(white: 0.95, alpha: 1)

    self.rootStackView.axis = .vertical
    self.rootStackView.translatesAutoresizingMaskIntoConstraints = false
    self.rootStackView.spacing = 24
    self.rootStackView.layoutMargins = self.traitCollection.horizontalSizeClass == .regular
      ? .init(top: 36, left: 36, bottom: 36, right: 36)
      : .init(top: 16, left: 16, bottom: 16, right: 16)
    self.rootStackView.isLayoutMarginsRelativeArrangement = true

    self.titleLabel.text = "Sign up"
    self.titleLabel.textAlignment = .center
    self.titleLabel.font
      = self.traitCollection.verticalSizeClass == .regular && self.traitCollection.horizontalSizeClass == .regular
      ? .preferredFont(forTextStyle: .title1, compatibleWith: self.traitCollection)
      : .preferredFont(forTextStyle: .title3, compatibleWith: self.traitCollection)
    self.titleLabel.textColor = UIColor.init(white: 0.2, alpha: 1)

    self.nameLabel.text = "Name"
    self.nameLabel.font = UIFont.preferredFont(forTextStyle: .caption1, compatibleWith: self.traitCollection)
    self.nameTextField.borderStyle = .roundedRect
    self.nameStackView.spacing = 4
    self.nameStackView.axis = .vertical

    self.emailLabel.text = "Email"
    self.emailLabel.font = UIFont.preferredFont(forTextStyle: .caption1, compatibleWith: self.traitCollection)
    self.emailTextField.borderStyle = .roundedRect
    self.emailStackView.spacing = 4
    self.emailStackView.axis = .vertical

    self.passwordLabel.text = "Password"
    self.passwordLabel.font = UIFont.preferredFont(forTextStyle: .caption1, compatibleWith: self.traitCollection)
    self.passwordTextField.borderStyle = .roundedRect
    self.passwordStackView.spacing = 4
    self.passwordStackView.axis = .vertical

    self.submitButton.setTitle("Submit", for: .normal)
    self.submitButton.setTitleColor(.white, for: .normal)
    self.submitButton.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .highlighted)
    self.submitButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .callout, compatibleWith: self.traitCollection)
    self.submitButton.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 1, alpha: 1)
    self.submitButton.layer.masksToBounds = true
    self.submitButton.layer.cornerRadius = 6
    
    self.disclaimerLabel.font = UIFont.preferredFont(forTextStyle: .caption2, compatibleWith: self.traitCollection)
    self.disclaimerLabel.textAlignment = .center

  }
}

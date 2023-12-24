import UIKit

final class CriptoTableViewCell: UITableViewCell {

    
    // MARK: - PRIVATE PROPRTIES:
    private let containerView = UIView()
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        contentView.addSubview(containerView)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        contentView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        containerView.backgroundColor = UIColor(red: 37/255, green: 35/255, blue: 51/255, alpha: 1.0)
        containerView.layer.cornerRadius = 10
        selectionStyle = .none
    }
    
    // MARK: LIFECYCLE:
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
      
}

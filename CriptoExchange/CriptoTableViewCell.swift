import UIKit

final class CriptoTableViewCell: UITableViewCell {

    
    // MARK: - PRIVATE PROPRTIES:
    private let containerView = UIView()
    private let nameCoin = UILabel()
    private let valueCoin = UILabel()
    
    // MARK: - ADD SUBVIEWS:
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        contentView.addSubview(nameCoin)
        contentView.addSubview(valueCoin)
    }
    
    // MARK: - CONFIGURE CONSTRAINTS:
    
    private func configureConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        nameCoin.translatesAutoresizingMaskIntoConstraints = false
        nameCoin.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        nameCoin.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15).isActive = true
        nameCoin.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        nameCoin.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        
        valueCoin.translatesAutoresizingMaskIntoConstraints = false
        valueCoin.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        valueCoin.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15).isActive = true
        valueCoin.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.5).isActive = true
        valueCoin.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
    }
    
    // MARK: - CONFIGURE UI:
    
    private func configureUI() {
        contentView.backgroundColor = UIColor(red: 20/255, green: 18/255, blue: 29/255, alpha: 1.0)
        containerView.backgroundColor = UIColor(red: 37/255, green: 35/255, blue: 51/255, alpha: 1.0)
        containerView.layer.cornerRadius = 10
        selectionStyle = .none
        
        nameCoin.textColor = .white
        nameCoin.font = .systemFont(ofSize: 20, weight: .medium, width: .standard)
        valueCoin.textColor = .gray
        valueCoin.textAlignment = .right
    }
    
    func configure(_ coin: ModelCoin) {
        nameCoin.text = coin.name
        valueCoin.text = String(coin.volume_1day_usd)
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

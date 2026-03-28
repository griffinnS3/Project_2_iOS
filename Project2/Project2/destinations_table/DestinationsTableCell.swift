//
//  DestinationsTableCell.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/20/26.
//
import UIKit
import SnapKit

class DestinationsTableCell: UITableViewCell {
    let title = UILabel()
    let image = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        title.backgroundColor = .white
        title.textColor = .black
        contentView.addSubview(image)
        contentView.addSubview(title)
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.top.bottom.right.equalTo(contentView.safeAreaLayoutGuide)
            make.width.equalToSuperview().multipliedBy(0.50)
        }
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.left.equalTo(contentView.snp.left)
            make.right.equalTo(image.snp.left)
        }
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(vm: Destination) {
        title.text = vm.title
        image.image = vm.image
    }
}

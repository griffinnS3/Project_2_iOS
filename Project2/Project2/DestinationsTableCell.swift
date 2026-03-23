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
        image.addSubview(title)
        image.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
        title.snp.makeConstraints { make in
            make.centerX.equalTo(image)
            make.height.equalTo(image).dividedBy(7)
            make.width.equalTo(image)
            make.centerY.equalTo(image).offset(-10)
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

//
//  LinksTableCell.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/21/26.
//
import SnapKit
import UIKit

class LinksTableViewCell: UITableViewCell {
    var label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        label.textAlignment = .center
        label.snp.makeConstraints { make in
            make.edges.equalTo(contentView.safeAreaInsets)
        }
    }
    func configure(link: Link) {
        label.text = link.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




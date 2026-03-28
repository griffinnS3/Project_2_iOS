//
//  TableViewCell.swift
//  AdvancedTableViews
//
//  Created by Paul Igo on 3/16/25.
//

import UIKit
import SnapKit

class NotesTableViewCell: UITableViewCell {
    
    var label = UILabel()
    var imageV = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(imageV)
        imageV.contentMode = .scaleAspectFit
        imageV.clipsToBounds = true
        
        label.snp.makeConstraints {
            $0.right.bottom.top.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.75)
        }
        imageV.snp.makeConstraints { make in
            make.right.equalTo(label.snp.left)
            make.top.bottom.equalToSuperview()
           
            make.width.equalToSuperview().multipliedBy(0.25)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(note: Note) {
        label.text = note.title
        imageV.image = note.image
    }
    
    
}

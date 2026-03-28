//
//  FavoritesTableCell.swift
//  Project2
//
//  Created by Eddie Slobodow on 3/26/26.
//

import UIKit
import SnapKit

class FavoritesTableCell: UITableViewCell {
    let title = UILabel()
    let image = UIImageView()
    let content = UILabel()

    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        title.backgroundColor = .white
        title.textColor = .black
        contentView.addSubview(image)
        image.addSubview(title)
        
        if content.text != nil {
            image.addSubview(content)
        }
        
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
    func configure(vm: Favorite) {
        
        // I use this function to determain what type of object is being passed
        // and set the data accordingly
        title.text = vm.title
        
        if let destination = vm as? Destination {
            image.image = destination.image
        } else if vm is Tours {

        } else if let note = vm as? Note {
            content.text = note.content
        }
    }
}

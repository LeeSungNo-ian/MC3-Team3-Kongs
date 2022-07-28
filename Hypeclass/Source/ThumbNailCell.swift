//
//  ThumbnailCell.swift
//  Hypeclass
//
//  Created by 이성노 on 2022/07/28.
//

import UIKit

class ThumbNailCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    private lazy var youtubeThumbNail: UIImageView = {
        let imageView = UIImageView()
        let dancerProfileImage: UIImage = UIImage(systemName: "person")!
        imageView.image = dancerProfileImage
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let youtubeTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
        youtubeThumbNail.contentMode = .scaleToFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.youtubeThumbNail.image = UIImage(data: data)
            }
        }
    }
    
    private func setLayout() {
        contentView.addSubview(youtubeThumbNail)
        youtubeThumbNail.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        youtubeThumbNail.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        youtubeThumbNail.heightAnchor.constraint(equalToConstant: 50).isActive = true
        youtubeThumbNail.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        contentView.addSubview(youtubeTitle)
        youtubeTitle.topAnchor.constraint(equalTo: youtubeThumbNail.bottomAnchor, constant: 10).isActive = true
        youtubeTitle.leadingAnchor.constraint(equalTo: youtubeThumbNail.leadingAnchor).isActive = true
    }
}

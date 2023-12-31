//
//  CustomCollectionViewCell.swift
//  UICollectionView
//
//  Created by user on 11/5/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    static let identifier = "CustomCollectionViewCell"
    
    var likeButtonTapped: (() -> Void)?
    var movie: MovieDetails? {
        didSet {
            configure(with: movie)
        }
    }

    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.layer.cornerRadius = 8
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 255/255, green: 128/255, blue: 54/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 4
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let genreLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        setUpViews()
        setUpLikeButton()
        setupConstraints()
    }
    
    func setUpViews() {
        addSubview(myImageView)
        addSubview(ratingLabel)
        addSubview(titleLabel)
        addSubview(genreLabel)
        addSubview(heartButton)
    }
    
    func setUpLikeButton() {
        heartButton.addTarget(self, action: #selector(heartTapped), for: .touchUpInside)
    }
    
    @objc func heartTapped() {
        likeButtonTapped?()
        
       
        movie?.isLiked.toggle()
        
       
        configure(with: movie)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: 230),
            
            titleLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            genreLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            ratingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            ratingLabel.heightAnchor.constraint(equalToConstant: 23),
            ratingLabel.widthAnchor.constraint(equalToConstant: 33),
            
            heartButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            heartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = UIImage(systemName: "questionmark")
    }
    
    func configure(with movie: MovieDetails?) {
        guard let movie = movie else { return }
        myImageView.image = movie.image
        ratingLabel.text = "\(movie.rating)"
        titleLabel.text = movie.title
        genreLabel.text = movie.genre.rawValue
        
        let heartImageName = movie.isLiked ? "heart.fill" : "heart"
        heartButton.setImage(UIImage(systemName: heartImageName), for: .normal)
    }
}


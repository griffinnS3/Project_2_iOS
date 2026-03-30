//
//  NoteDetailView.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/27/26.
//
import UIKit
import SnapKit

class NoteDetailView: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let textBar = UITextField()
    let titleText = UITextField()
    let imageView = UIImageView()
    var selectedImage: UIImage?
    var vm: NotesViewModel
    var isNew: Bool
    var indexPath: IndexPath?
    let imagePicker = UIImagePickerController()
    var addFavorite = UIButton()
    
    init(title: String?, text: String?, viewModel: NotesViewModel, isNew: Bool, indexPath: IndexPath?) {
        self.vm = viewModel
        self.isNew = isNew
        self.indexPath = indexPath
        super.init(nibName: nil, bundle: nil)
        titleText.text = title
        textBar.text = text
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNote))
        titleText.placeholder = "Title"
        textBar.placeholder = "Add a note..."
        textBar.delegate = self
        titleText.delegate = self
        titleText.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.addSubview(titleText)
        view.addSubview(textBar)
        view.addSubview(imageView)
        view.addSubview(addFavorite)
       /**https://developer.apple.com/documentation/uikit/uiimagepickercontroller**/
        /**https://stackoverflow.com/questions/56825294/swiftui-image-clipstobounds**/
        imageView.contentMode = .scaleAspectFit
        imagePicker.delegate = self
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray6
        imagePicker.sourceType = .photoLibrary
        imageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(tap)
        addFavorite.setTitle("Add Favorite", for: .normal)
        addFavorite.translatesAutoresizingMaskIntoConstraints = false
        addFavorite.backgroundColor = .systemBlue
        addFavorite.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        if selectedImage == nil {
            let placeholder = UILabel()
            placeholder.text = "Tap to add photo"
            placeholder.textAlignment = .center
            imageView.addSubview(placeholder)
            placeholder.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        } else {
            imageView.addSubview(UIImageView(image: selectedImage))
        }
        
        titleText.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.05)
        }
        textBar.snp.makeConstraints { make in
            make.top.equalTo(titleText.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.05)
        }
        imageView.snp.makeConstraints { make in
            make.top.equalTo(textBar.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        addFavorite.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view).multipliedBy(0.2)
            make.height.equalTo(view.safeAreaLayoutGuide).dividedBy(13)
            make.trailing.equalTo(view.safeAreaLayoutGuide).multipliedBy(0.95)
        }
        addFavorite.addTarget(self, action: #selector(favoriteAdded), for: .touchUpInside)
    }
       
    @objc func saveNote() {
        let title = titleText.text ?? ""
        let content = textBar.text ?? ""
        let imageData = selectedImage?.jpegData(compressionQuality: 0.8)
        // I don't know if this is a really stupid way of doing this but it works
        if isNew == false {
            if let indexPath = indexPath {
                    vm.updateNote(at: indexPath, title: title, content: content, imageData: imageData)
                    navigationController?.popViewController(animated: true)
            }
        } else {
            vm.createNote(title: title, content: content, imageData: imageData)
            navigationController?.popViewController(animated: true)
        }
    }
    @objc func selectImage() {
        present(imagePicker, animated: true)
    }
    
    @objc func favoriteAdded() {
        print("Added to favorites")
        let thisNote = Note(title: titleText.text ?? "", content: textBar.text ?? "")
        favorites.append(thisNote)

    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[.originalImage] as? UIImage {
            selectedImage = image
            imageView.image = image
        }
        dismiss(animated: true)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}


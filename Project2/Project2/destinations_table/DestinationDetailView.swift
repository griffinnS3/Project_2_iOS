//
//  DestinationDetailView.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/21/26.
//
import UIKit
import SnapKit
import MapKit

class DestinationDetailView: UIViewController {
    
    var labelText: String
    var image = UIImageView()
    var label = UILabel()
    var mapView = MKMapView()
    var address : String
    var background = UILabel()
    var descriptionLabel = UILabel()
    var addFavorite = UIButton(type: .system)
    
    init(labelText: String, address: String) {
        self.labelText = labelText
        self.address = address
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.text = labelText
        label.textColor = .black
        if self.labelText == "Champlain College" {
            address = "246 South Willard Street, Burlington, VT 05401"
            addMapView(address: address)
            image = UIImageView(image: UIImage(named: "champlain"))
            descriptionLabel.text = "This is the home of Champlain College. It is a beautiful campus with a lot of history."
        }
        else if (self.labelText == "Kountry Kart Deli") {
            address = "155 Main St, Burlington, VT 05401"
            addMapView(address: address)
            image = UIImageView(image: UIImage(named: "KKD"))
            descriptionLabel.text = "This is a local favorite for breakfast and lunch. They have a great selection of sandwiches."
        }
        else {
                address = "149 Church St Burlington Vt 05401"
            addMapView(address: address)
            image = UIImageView(image: UIImage(named: "church_street"))
            descriptionLabel.text = "This is the heart and soul of Burlington with many shops and restaurants to enjoy."
            }
        
        addFavorite.setTitle("Add Favorite", for: .normal)
        addFavorite.setTitleColor(.white, for: .normal)
        addFavorite.translatesAutoresizingMaskIntoConstraints = false
        addFavorite.backgroundColor = .systemBlue
        addFavorite.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        descriptionLabel.textAlignment = .center
        view.addSubview(background)
        view.addSubview(label)
        view.addSubview(mapView)
        view.addSubview(image)
        view.addSubview(addFavorite)
       
       
        view.addSubview(descriptionLabel)
        /**https://www.google.com/search?q=How+do+i+get+my+text+to+fit+in+a+label+in+swift&sca_esv=111f151f5b064434&rlz=1C5GCEM_enUS1198US1199&biw=1268&bih=1243&sxsrf=ANbL-n6fpbDA8GHpXpWom8JB64rMhmzqJQ%3A1774122449253&ei=0fW-aaDuDsiu5NoP8ICDiAQ&ved=0ahUKEwjgmoCT4bGTAxVIF1kFHXDAAEEQ4dUDCBE&uact=5&oq=How+do+i+get+my+text+to+fit+in+a+label+in+swift&gs_lp=Egxnd3Mtd2l6LXNlcnAiL0hvdyBkbyBpIGdldCBteSB0ZXh0IHRvIGZpdCBpbiBhIGxhYmVsIGluIHN3aWZ0MgUQIRigATIFECEYoAEyBRAhGKsCSMh-UIQGWPl6cBt4AJABAZgBggGgAeYsqgEENjYuN7gBA8gBAPgBAZgCY6AC9y6oAgrCAhcQABiABBiRAhi0AhjnBhiKBRjqAtgBAcICEBAAGAMYtAIY6gIYjwHYAQHCAgsQABiABBiRAhiKBcICERAuGIAEGLEDGNEDGIMBGMcBwgILEC4YgAQY0QMYxwHCAgUQLhiABMICDhAuGIAEGLEDGNEDGMcBwgIOEAAYgAQYsQMYgwEYigXCAg4QLhiABBixAxiDARiKBcICCxAAGIAEGLEDGIMBwgIKEC4YgAQYQxiKBcICCxAuGIAEGLEDGIMBwgIEEAAYA8ICCxAAGIAEGLEDGIoFwgIIEC4YgAQYsQPCAgUQABiABMICCBAAGIAEGLEDwgIKEAAYgAQYQxiKBcICBhAAGBYYHsICBxAAGIAEGA3CAgsQABiABBiGAxiKBcICBRAAGO8FwgIIEAAYogQYiQXCAggQABiABBiiBMICBxAhGKABGAqYAwLxBV2pbnhFLN5ZugYECAEYB5IHBTg2LjEzoAeB-gOyBwU1OS4xM7gHmC7CBwczLjY5LjI3yAfpAYAIAA&sclient=gws-wiz-serp**/
        descriptionLabel.numberOfLines = 0
        label.textAlignment = .center
        background.backgroundColor = .systemBackground
        label.snp.makeConstraints { make in
            make.top.equalTo(view).offset(70)
            make.width.equalTo(view).multipliedBy(0.5)
            make.height.equalTo(view.safeAreaLayoutGuide).dividedBy(10)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        mapView.snp.makeConstraints { make in
            make.width.equalTo(400)
            make.height.equalTo(view.safeAreaLayoutGuide).dividedBy(4)
            make.top.equalTo(label.snp.bottom).offset(10)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        image.contentMode = .scaleAspectFit
        image.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.bottom).offset(50)
            //make.width.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view.safeAreaLayoutGuide).dividedBy(4)
        }
        background.snp.makeConstraints { make in
            make.top.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(descriptionLabel.snp.bottom).offset(50)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.height.equalTo(view.safeAreaLayoutGuide).dividedBy(10)
            make.width.equalTo(view)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(image.snp.bottom).offset(50)
        }
        addFavorite.snp.makeConstraints { make in
            make.top.equalTo(view).offset(70)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.width.equalTo(100)
            make.height.equalTo(44)
        }
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        addFavorite.addTarget(self, action: #selector(favoriteAdded), for: .touchDown)

        label.addGestureRecognizer(gesture)
        label.isUserInteractionEnabled = true
    }
    @objc func labelTapped() {
        dismiss(animated: true)
        navigationController?.popViewController(animated: true)
    }
    @objc func favoriteAdded() {
        let thisDestination = Destination(title: label.text ?? "", photo: image.image?.jpegData(compressionQuality: 0.8))
        favorites.append(thisDestination)

    }
    
    func addMapView(address: String) {
        let geoLocator = CLGeocoder()
        geoLocator.geocodeAddressString(address) {
            annotations, error in
            print(annotations?.first ?? "")
            let placemark = annotations?.first
            print(placemark?.location?.coordinate ?? "")
            let coordinate = MKPointAnnotation(coordinate: placemark?.location?.coordinate ?? CLLocationCoordinate2D())
            self.mapView.addAnnotation(coordinate)
            let areaCoordinate = placemark?.location?.coordinate ?? CLLocationCoordinate2D()
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            self.mapView.setRegion(MKCoordinateRegion(center: areaCoordinate, span: span), animated: true)
        }
        }
    func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
        typealias CompletionHandler = (CLPlacemark?) -> Void
    }
    }


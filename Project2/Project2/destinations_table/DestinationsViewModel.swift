//
//  DestinationsViewModel.swift
//  Project2
//
//  Created by Smith01, Griffin on 3/20/26.
//
import UIKit
struct Destination : Favorite, Codable {
    var title: String
    var photo: Data?
    // Same method I used for notes vm
    var image: UIImage? {
            get {
                guard let data = photo else { return nil }
                return UIImage(data: data)
            }
            set {
                photo = newValue?.jpegData(compressionQuality: 0.8)
            }
        }
}

class DestinationTableViewModel: NSObject {
    var churchStreet = UIImage(named: "church_street")
    var champlain = UIImage(named: "champlain")
    var KKD = UIImage(named: "KKD")
    var objects: [Destination] = []
    init(objects: [Destination]) {
        self.objects = objects
    }
   override init() {
       super.init()
        objects = createDestinations()
    }
    //I googled the method for passing image as data
    /**https://www.google.com/search?q=how+do+i+pass+data+as+an+image+in+swift&rlz=1C5GCEM_enUS1198US1199&oq=how+do+i+pass+data+as+an+image+in+swift&gs_lcrp=EgZjaHJvbWUyCQgAEEUYORigATIGCAEQRRhAMgYIAhBFGEDSAQoxMTg3N2owajE1qAIIsAIB8QVsyb_QL3hpFw&sourceid=chrome&ie=UTF-8**/
    func createDestinations() -> [Destination] {
        return [
            Destination(title: "Church Street", photo: churchStreet?.jpegData(compressionQuality: 0.8)),
            Destination(title: "Champlain College", photo: champlain?.jpegData(compressionQuality: 0.8)),
            Destination(title: "Kountry Kart Deli", photo: KKD?.jpegData(compressionQuality: 0.8))
        ]
    }
}



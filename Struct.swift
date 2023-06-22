//
//  Struct.swift
//  Wheelers
//
//  Created by Apprenant 79 on 28/04/2023.
//

import SwiftUI

struct Profil: Hashable {
    var pp: String  //Photo de profil
    var nom: String
    var prenom: String
    var age: Int
    var adresse: String
    var ville: String
    var zip: Int
    var theme: String
    var voiture: Bool = false
}

var maria = Profil(pp: "Maria", nom: "De La Croix", prenom: "Maria", age: 72, adresse: "42 avenue des gobelins", ville: "Montreuil", zip: 93100, theme: "Social",voiture: false)
var antoine = Profil(pp: "Antoine", nom: "", prenom: "Antoine", age: 30, adresse: "", ville: "", zip: 92, theme: "")
var kim = Profil(pp: "Kim", nom: "", prenom: "Kim", age: 24, adresse: "", ville: "", zip: 75, theme: "")
var thomas = Profil(pp: "Thomas", nom: "", prenom: "Thomas", age: 24, adresse: "", ville: "", zip: 75, theme: "")

struct Trajet {
    var logoAsso: String
    var nomAsso: String
    var date: Date = .now
    var villeAsso: String
    var zipAsso: Int
    var adresseDestination: String
    var places: Int
}

var trajets: [Trajet] = [
    Trajet(logoAsso: "", nomAsso: "Resto du coeur", date: Date(), villeAsso: "Paris", zipAsso: 75, adresseDestination: "tototo", places: 3),
    Trajet(logoAsso: "", nomAsso: "Resto du coeur", date: Date(), villeAsso: "Paris", zipAsso: 75, adresseDestination: "tototo", places: 3),
    Trajet(logoAsso: "", nomAsso: "Resto du coeur", date: Date(), villeAsso: "Paris", zipAsso: 75, adresseDestination: "tototo", places: 3),
]

struct ChatPreset: Identifiable, Hashable {
    var id: Int
    var utilisateur: Profil
    var text : String
    var heure : String
    var read: Bool
    var messages : [Message]
}

var chatProfil: [ChatPreset] = [
    ChatPreset(id: 1, utilisateur: antoine, text: "Salut je suis en bas", heure: "- 8H32", read: false, messages: [Message(user:"Antoine",heureReception:Date(timeIntervalSinceNow: -1000),msg:"Salut je suis en bas", orientation: 2)]),
    ChatPreset(id: 2, utilisateur: kim, text: "Merci maria", heure: "- Hier", read: false, messages: [
        Message(user:"Maria", heureReception: Date(timeIntervalSinceNow: -1000),msg:"Je serais au bout de la rue dans 10 minutes", orientation: 0),
        Message(user:"Kim", heureReception:Date(timeIntervalSinceNow: -1000),msg:"Merci Maria", orientation: 1),
    ]),
    ChatPreset(id: 3, utilisateur: thomas, text: "06.XX.XX.XX.XX", heure: "- Lundi", read: true, messages: [Message(user:"Thomas", heureReception:Date(timeIntervalSinceNow: -1000),msg:"06.XX.XX.XX.XX", orientation: 2)]),
    ChatPreset(id: 4, utilisateur: maria, text: "06.XX.XX.XX.XX", heure: "", read: true, messages: [Message(user:"Maria",heureReception: Date(timeIntervalSinceNow: -1000),msg:"Je serais au bout de la rue dans 10 minutes", orientation: 0)])
]


struct Message: Identifiable,Hashable {
    var id = UUID()
    var user : String
    var heureReception : Date
    var msg : String
    var orientation : Int
}

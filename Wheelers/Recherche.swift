//
//  Rercherche.swift
//  Wheelers
//
//  Created by Formation on 02/05/2023.
//

import SwiftUI

let colorBleu: Color = Color("Bleu")
let colorJaune: Color = Color("Jaune")


// Tableau des associations .....................................................................................
struct Assos: Identifiable, Hashable {
    var id = UUID()
    var nameAssos: String
    var imageAssos: String
    var villeAssos: String
    var distanceAssos: Int
}
var arrayAssos: [Assos] = [
    Assos(nameAssos: "Le Secours Populaire", imageAssos: "Secours Populaire", villeAssos: "Montreuil", distanceAssos: Int(1)),
    Assos(nameAssos: "Association culturelle de Montreuil", imageAssos: "ACAC", villeAssos: "Montreuil", distanceAssos: Int(1)),
    Assos(nameAssos: "SPA de Montreuil", imageAssos: "SPA", villeAssos: "Montreuil", distanceAssos: Int(1)),
    Assos(nameAssos: "Élan sportif de Montreuil", imageAssos: "Elan", villeAssos: "Montreuil", distanceAssos: Int(1)),
    Assos(nameAssos: "France Nature Environement", imageAssos: "FNE", villeAssos: "Vincennes", distanceAssos: Int(2)),
    Assos(nameAssos: "La Croix Rouge", imageAssos: "Croix Rouge", villeAssos: "Vincennes", distanceAssos: 2),
    Assos(nameAssos: "Le Secours Catholique", imageAssos: "Secours Catholique", villeAssos: "Paris 11ème", distanceAssos: Int(4)),
    Assos(nameAssos: "Réseaux de prévention des addictions", imageAssos: "RESPADD", villeAssos: "Paris 10ème", distanceAssos: Int(6)),
]

// Code changement couleur Placeholder ......................................................................
struct SuperTextField: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

struct Recherche: View {
    
    @State private var votreAdresse: String = ""
    @State private var votreDestination = Assos(nameAssos: "", imageAssos: "", villeAssos: "", distanceAssos: 0)
    @State private var votreDate = Date()
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path){
            VStack{
                ZStack{
                    colorBleu
                    VStack{
                        Image("Logo5")
                            .resizable()
                            .frame(width: 150, height: 150)
//                            .padding()
                            .padding(.top, -30)
                    
// Adresse --------------------------------------------------------------------------------------------------
                        ZStack{
                            Rectangle ()
                                .foregroundColor(.white)
                                .frame(width: 360, height: 88)
                                .cornerRadius(10)
                                
                            SuperTextField(placeholder: Text("Tapez votre adresse").font(.system(size: 27)).foregroundColor(.gray).italic(),text: $votreAdresse)
                                .font(.system(size: 27))
                                .padding(.leading, 30)
                                
                        }
                        .padding(.bottom, -0.1)
// Destination  ----------------------------------------------------------------------------------------------
                        NavigationLink(value: votreDestination){
                            ZStack{
                                Rectangle ()
                                    .foregroundColor(.white)
                                    .frame(width: 360, height: 88)
                                    .cornerRadius(10)
                                    .italic()
                                HStack{
                                    if votreDestination.imageAssos.isEmpty{
                                        HStack{
                                            Text("Choisissez votre association")
                                                .font(.system(size: 27))
                                                .italic()
                                                .foregroundColor(.gray)
                                                .frame(height: 0)
                                        }
                                    } else {
                                                HStack{
                                                    Spacer()
                                                    Image(votreDestination.imageAssos)
                                                        .resizable()
                                                        .frame(width: 70, height: 70)
                                                    VStack(alignment:.leading) {
                                                        Text(votreDestination.nameAssos)
                                                            .font(.system(size: 22))
                                                            .foregroundColor(.black)
                                                            .fontWeight(.bold)
                                                        
                                                        HStack{
                                                            Text(votreDestination.villeAssos)
                                                                .font(.system(size: 20))
                                                                .foregroundColor(.black)
                                                            Text("- \(votreDestination.distanceAssos) km")
                                                                .font(.system(size: 20))
                                                                .foregroundColor(.black)
                                                            
                                                            Spacer()
                                                        }
                                                    }
                                                }
                                                .frame(height: 0)
                                                .padding(.leading)
                                    }
                                }
                            }
                        }
                        .navigationDestination(for: Assos.self) { _ in
                            Associations(choixAssociation: $votreDestination, navPath: $path)
                        }
// Date -----------------------------------------------------------------------------------------------------
                        ZStack{
                            Rectangle ()
                                .foregroundColor(.white)
                                .frame(width: 360, height: 88)
                                .cornerRadius(10)
                                .italic()
                            DatePicker("", selection: $votreDate, displayedComponents: .date)
                                .frame(width: 150,height: 80)
                                .padding(.trailing, 237)
                        }
// Horaire --------------------------------------------------------------------------------------------------
                        ZStack{
                            Rectangle ()
                                .foregroundColor(.white)
                                .frame(width: 360, height: 88)
                                .cornerRadius(10)
                            DatePicker("", selection: $votreDate, displayedComponents: [.hourAndMinute])
                                .font(.system(size: 100))
                                .padding(.trailing, 260)
                        }
                        .padding(.bottom, 40)
// Bouton Rechercher ----------------------------------------------------------------------------------------
                        NavigationLink(destination: ResultatDeRecherche()){
                        Rectangle ()
                            .foregroundColor(colorJaune)
                            .frame(width: 360, height: 88)
                            .cornerRadius(10)
                            .overlay {
                                Text("Rechercher")
                                    .font(.system(size: 40))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            }
                    }
                }
            }
        }
    }
    struct Recherche_Previews: PreviewProvider {
        static var previews: some View {
            Recherche()
        }
    }
}

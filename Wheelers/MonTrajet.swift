//
//  SwiftUIView.swift
//  Wheelers
//
//  Created by Apprenant 79 on 26/04/2023.
//

import SwiftUI

struct MonTrajet: View {
    let dateFormatter = DateFormatter()
    var canPublish: Bool {
        !maDestination.nameAssos.isEmpty
    }
    @State private var maDestination = Assos(nameAssos: "", imageAssos: "", villeAssos: "", distanceAssos: 0)
    @State private var pathTrajet = NavigationPath()
    
    @State private var showModal = false
    @Binding var dismissModal : Bool
    @State private var statutTrajet: Bool = false
    @State private var secours = Trajet (logoAsso: "Secours", nomAsso: "Secours populaire de Montreuil", date: Date(), villeAsso: "Montreuil", zipAsso: 93100, adresseDestination: "Pierre Timbaud, 1 Sq. Jean Zay", places: 3)
    private let places = [1,2,3]
    
    var body: some View {
        NavigationStack(path: $pathTrajet){
            VStack{
//                Rectangle()
//                    .frame(height: 2.0)
//                    .foregroundColor(.gray)
                ZStack{
                    Rectangle()
                        .padding(.top, -8.0)
                        .foregroundColor(colorBleu)
//Image Association -------------------------------------------------------------------------
                    VStack{
                        Image(maDestination.imageAssos)
                            .resizable()
                            .frame(width: 120, height: 120)
                        
//Choisir une association -------------------------------------------------------------------------
                        NavigationLink(value: maDestination){
                            ZStack{
                                Rectangle ()
                                    .foregroundColor(.white)
                                    .frame(width: 360, height: 88)
                                    .cornerRadius(10)
                                    .italic()
                                HStack{
                                    if maDestination.imageAssos.isEmpty {
                                        HStack{
                                            HStack{
                                                Image(systemName: "signpost.right.and.left.fill")
                                                    .font(.system(size: 45))
                                                    .foregroundColor(.black)
                                                    .padding(.leading, 30)
                                                Spacer()
                                                ZStack{
                                                    Rectangle()
                                                        .frame(width: 280, height: 54)
                                                        .cornerRadius(10)
                                                        .foregroundColor(Color("lGray"))
                                                        .padding(.trailing, 30)
                                                    Text("Choisissez votre association")
                                                        .font(.system(size: 20))
                                                        .italic()
                                                        .padding(.trailing, 30)
                                                        .foregroundColor(.black)
                                                        .frame(height: 0)
                                                }
                                            }
                                        }
                                    } else {
                                        HStack{
                                            Spacer()
                                            VStack(alignment:.leading) {
                                                Text(maDestination.nameAssos)
                                                    .font(.system(size: 22))
                                                    .foregroundColor(.black)
                                                    .fontWeight(.bold)
                                                
                                                HStack{
                                                    Text(maDestination.villeAssos)
                                                        .font(.system(size: 20))
                                                        .foregroundColor(.black)
                                                    Text("- \(maDestination.distanceAssos) km")
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
                            Associations(choixAssociation: $maDestination, navPath: $pathTrajet)
                        }
//Choisir une date -------------------------------------------------------------------------
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 360,height: 88)
                                .foregroundColor(.white)
                                .overlay(
                                    HStack{
                                        Image(systemName: "calendar")
                                            .font(.system(size: 45))
                                        Spacer()
                                        
                                        DatePicker(selection: $secours.date, label: { Text("") })
                                            .labelsHidden()
                                            .frame(width:210, height: 90,alignment: .center)
                                            .clipped()
                                            .padding(.trailing, 30)
                                        
                                    }
                                        .padding(.horizontal)
                                )
                        }
//Choisir un nombre de place -------------------------------------------------------------------------
                        ZStack{
                            Rectangle()
                                .frame(width: 360,height: 100)
                                .foregroundColor(.white)
                                .overlay {
                                    HStack(){
                                        Image(systemName: "car.fill")
                                            .font(.system(size: 40))
                                        Spacer()
                                        VStack(){
                                            Text("Places disponibles :")
                                                .fontWeight(.semibold)
                                                .font(.system(size: 20))
                                            Picker("Places libres", selection: $secours.places) {
                                                ForEach(places, id: \.self) {
                                                    Text("\($0)")
                                                }
                                            }
                                        }
                                        .pickerStyle(.menu)
                                        .frame(width: 250,height: 90)
                                        .padding(.trailing, 7)
                                    }
                                    .padding(.horizontal)
                                }
                                .cornerRadius(10)
                        }
                        Spacer()
                        if canPublish {
                            ZStack {
                                Rectangle()
                                    .frame(width: 360, height: 88)
                                    .foregroundColor(statutTrajet ? Color("darkRed") : colorJaune)
                                    .cornerRadius(10)
                                
                                Button(action: {
                                    statutTrajet .toggle()
                                    
                                    if statutTrajet == false {
                                        maDestination = Assos(nameAssos: "", imageAssos: "", villeAssos: "", distanceAssos: 0)
                                    }
                                    
                                    
                                }, label: {
                                    Text(statutTrajet ? "Annuler" : "Publier")
                                        .foregroundColor(.black)
                                        .fontWeight(.semibold)
                                        .font(.system(size: 30))
                                        .frame(width: 360, height: 88)
                                })
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle("Mon trajet")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MonTrajet(dismissModal: .constant(false))
    }
}

//Choisir une association -------------------------------------------------------------------------
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .frame(width: 360,height: 88)
//                                .foregroundColor(.white)
//
//                                    HStack{
//                                        Image(systemName: "signpost.right.and.left.fill")
//                                            .font(.system(size: 45))
//                                        Spacer()
////Bouton
//
//                                            ZStack{
//                                                RoundedRectangle(cornerRadius: 10)
//                                                    .foregroundColor(Color("lGray"))
//                                                    .frame(width: 250,height: 60)
//                                                    Text(" Choisir une association")
//                                                        .foregroundColor(.black)
//                                                        .fontWeight(.semibold)
//                                                        .font(.system(size: 20))
//                                            }
//
//                                    }
//                                    .padding()
//                                    .padding(.horizontal)
//                        }
//Annuler ou publier -------------------------------------------------------------------------
//                        ZStack{
//                            Rectangle()
//                                .frame(width: 360,height: 88)
//                                .foregroundColor(statutTrajet ?  Color("darkRed") : colorJaune )
//                                .cornerRadius(10)
//                            Button {
//                                statutTrajet .toggle()
//                            } label: {
//                                Text(statutTrajet ? "Annuler" : "Publier")
//                                    .foregroundColor(.black)
//                                    .fontWeight(.semibold)
//                                    .font(.system(size: 30))
//                                    .frame(width: 360,height: 88)
//                            }
//                        }
//        .onAppear{
//            dateFormatter.locale = Locale(identifier: "fr_FR")
//        }

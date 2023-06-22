//
//  Inscription.swift
//  Wheelers
//
//  Created by Formation on 11/05/2023.
//

import SwiftUI
import PhotosUI

let colorBlue: Color = Color("Blue")
let colorYellow: Color = Color("Yellow")
let colorGreen: Color = Color("Green")
let colorRed: Color = Color("Red")

struct Inscription: View {
    @State private var nom: String = ""
    @State private var prenom: String = ""
    @State private var age = Date()
    @State private var phone: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
    @State private var zipAsso = ""
    @State private var association: String = ""
    @State   var voiture: Bool = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        
        NavigationStack{
        
                VStack{
//                    Text("Inscription")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .padding(.top, 20.0)
//                    Rectangle()
//                        .frame(height: 3.0)
//                        .foregroundColor(.gray)
                    ZStack{
                        colorBleu
                        ZStack{
                            
                            VStack(alignment: .center) {
                                ScrollView{
                                    VStack(spacing: 0.0){
                                        
                                        ///PHOTO
                                        
                                        
                                        ZStack {
                                            Circle()
                                                .foregroundColor(.white)
                                                .frame(width: 145, height: 145)
                                                
//                                                .padding(.bottom, 25)
//                                                .background(Color.gray)
//                                                .clipShape(Circle())
//                                            Spacer()
//
                                            ZStack{
                                                PhotosPicker(
                                                    selection: $selectedItem,
                                                    matching: .images,
                                                    photoLibrary: .shared()) {
                                                    Text("Ajouter une photo")
//                                                    .padding(.bottom, 30)
                                                    }
                                                    .onChange(of: selectedItem) { newItem in
                                                        Task {
                                                            // Retrieve selected asset in the form of Data
                                                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                                                selectedImageData = data
                                                            }
                                                        }
                                                    }
                                                if let selectedImageData,
                                                   let uiImage = UIImage(data: selectedImageData) {
                                                    Image(uiImage: uiImage)
                                                        .resizable()
                                                        .scaledToFit()
                                                        .clipShape(Circle())
                                                        .frame(width: 240, height: 240)
//                                                        .padding()
                                                }
                                            }
                                        }
                                        .padding()
                                    }
                                        ///NOM
                                        ZStack (alignment: .center) {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .frame(width: 360, height: 50)
                                                .cornerRadius(10)
                                            
                                            
                                            TextField("La Croix", text: $nom)
                                                .padding(.leading, 30)
                                                .font(.system(size: 25))
                                                .italic()
                                            
                                            ///Prénom
                                        }
                                        ZStack (alignment: .center) {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .frame(width: 360, height: 50)
                                                .cornerRadius(10)
                                            
                                            
                                            
                                            TextField("Maria", text: $prenom)
                                                .padding(.leading, 30)
                                                .font(.system(size: 25))
                                                .italic()
                                            
                                        }
                                        ///AGE
                                        ZStack (alignment: .center) {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .frame(width: 360, height: 50)
                                                .cornerRadius(10)
                                            
                                            DatePicker(
                                                "Date de naissance",
                                                selection: $age,
                                                displayedComponents: [.date]
                                                
                                            )
                                            .padding(.horizontal, 30)
                                            .padding(.leading, 1)
                                            .font(.system(size: 24))
                                            .italic()
                                            
                                        }
                                        //                                    TELEPHONE
                                        
                                        ZStack (alignment: .center) {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .frame(width: 360, height: 50)
                                                .cornerRadius(10)
                                            
                                            
                                            TextField("06 77 48 33 54", text: $phone)
                                                .padding(.leading, 30)
                                                .font(.system(size: 25))
                                                .italic()
                                            
                                        }
                                        ///ADRESSE
                                        ZStack (alignment: .center) {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .frame(width: 360, height: 50)
                                                .cornerRadius(10)
                                            
                                            
                                            TextField("42 avenue des Gobelins", text: $address)
                                                .padding(.leading, 30)
                                                .font(.system(size: 25))
                                                .italic()
                                            
                                        }
                                        ///ASSOCIATION
                                        ZStack (alignment: .center) {
                                            Rectangle()
                                                .foregroundColor(.white)
                                                .frame(width: 360, height: 50)
                                                .cornerRadius(10)
                                            
                                            
                                            //                                    Spacer()
                                            TextField("Le Secours Populaire", text:$association)
                                                .padding(.leading, 30)
                                                .font(.system(size: 25))
                                                .italic()
                                            
                                            
                                        }
                                        
                                        ///AVEZ-VOUS UNE VOITURE
                                        VStack {
                                            Text("Avez-vous une voiture?")
                                                .font(.system(size: 25))
                                                .italic()
                                                .padding(.top, 0.0)
                                            ///OUI
                                            ///
                                            HStack{
                                                
                                                Button(action: {
                                                    voiture = true
                                                }) {
                                                    Rectangle()
                                                        .padding(.top, 0.0)
                                                        .foregroundColor(colorGreen)
                                                        .frame(width: 176, height: 60)
                                                        .cornerRadius(20)
                                                        .overlay {
                                                            Text("Oui")
                                                                .fontWeight(.bold)
                                                                .font(.system(size: 25))
                                                                .foregroundColor(Color.black)
                                                                .italic()
                                                            
                                                            
                                                        }
                                                }
                                                
                                                ///NON
                                                
                                                HStack{
                                                    Button(action: {
                                                        voiture = false
                                                    }) {
                                                        Rectangle()
                                                            .foregroundColor(colorRed)
                                                            .frame(width: 176, height: 60)
                                                            .cornerRadius(20)
                                                            .overlay {
                                                                Text("Non")
                                                                    .fontWeight(.bold)
                                                                    .font(.system(size: 25))
                                                                    .foregroundColor(Color.black)
                                                                    .italic()
                                                                
                                                            }
                                                    }
                                                }
                                            }
                                        }
                                        ///CONTINUER
                                        ZStack {
                                            VStack{
                                                ZStack{
                                                    NavigationLink(destination: ProfileDuConducteur()) {
                                                        //                                                    Changer le "Profil" pour Rechercher ou quelques otre chose.
                                                        Rectangle()
                                                            .foregroundColor(colorJaune)
                                                            .frame(width: 360, height: 60)
                                                            .cornerRadius(10)
                                                            .padding(.bottom, 15)
                                                            .overlay{
                                                                
                                                                Text("Continuer")
                                                                    .fontWeight(.bold)
                                                                    .font(.system(size: 25))
                                                                    .foregroundColor(Color.black)
                                                                    .italic()
                                                                    .padding(.bottom)
                                                                
                                                                
                                                            }
                                                    }
                                                    
                                                }
                                            }
                                            
                                        }
                                    }
                                }
                                
                            }
                        }
                    }
                .navigationTitle("Inscription")
            }
        }
    }

    struct Inscription_Previews: PreviewProvider {
        static var previews: some View {
            Inscription()
        }
    }
    


    

        
        
                                               
    
        
        
        
        
        



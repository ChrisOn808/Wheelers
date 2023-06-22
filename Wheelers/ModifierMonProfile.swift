//
//  ModifierProfile.swift
//  Wheelers
//
//  Created by Alvaro Marciel Silveira dos Santos on 05/05/2023.
//

import SwiftUI
import PhotosUI

struct ModifierMonProfile: View {
    @State private var nom: String = ""
    @State private var prenom: String = ""
    @State private var age = Date()
    @State private var phone: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
    @State private var zipAsso = ""
    @State private var association: String = ""
    @State private var selectedImage: UIImage? = nil
    @State   var voiture: Bool = false
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        
        
//        TabView{
            NavigationStack{
                VStack{
//                    Text("Modifier mon profile")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .padding(.top, 20.0)
//                    Rectangle()
//                        .frame(height: 3.0)
//                        .foregroundColor(.gray)
                    ZStack{
                        Rectangle()
                            .foregroundColor(colorBleu)
                            .padding(.top, -8.0)
                        
                        ZStack{
                            
                            VStack(alignment: .center) {
                                ScrollView{
                                    VStack(spacing: 0.0){
// --------------------------------------------------------------------------------------------------------------
                                        ///PHOTO
                                        
                                        
                                        ZStack {
                                            Circle()
                                                .foregroundColor(.white)
                                                .frame(width: 135.0, height: 135.0)
                                                .padding(.bottom, 25)
                                            Spacer()
                                            ZStack{
                                                PhotosPicker(
                                                    selection: $selectedItem,
                                                    matching: .images,
                                                    photoLibrary: .shared()) {
                                                        Text("Changez la photo")
                                                            .padding(.bottom, 30)
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
                                                        .scaledToFill()
                                                        .clipShape(Circle())
                                                        .frame(width: 135.0, height: 135.0)
                                                        .padding(.bottom, 25)
                                                }
                                                
                                            }
                                        }
                                    }
// --------------------------------------------------------------------------------------------------------------

                                    ///NOM
                                    ZStack (alignment: .center) {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: 360, height: 50)
                                            .cornerRadius(10)
                                            .padding(0)
                                        
                                        
                                        TextField("Modifiez votre nom", text:$nom)
                                            .padding(.leading, 30)
                                            .font(.system(size: 25))
                                            .italic()
                                        
                                        
// --------------------------------------------------------------------------------------------------------------

                                        ///Prénom
                                    }
                                    ZStack (alignment: .center) {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: 360, height: 50)
                                            .cornerRadius(10)
                                            .padding(0)
                                        
                                        TextField("Modifiez votre prénom", text: $prenom)
                                            .padding(.leading, 30)
                                            .font(.system(size: 25))
                                            .italic()
                                        
                                    }
// --------------------------------------------------------------------------------------------------------------

                                    ///AGE
                                    ZStack (alignment: .center) {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: 360, height: 50)
                                            .cornerRadius(10)
                                            .padding(0)
                                        
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
// --------------------------------------------------------------------------------------------------------------

                                    //                                    TELEPHONE
                                    
                                    ZStack (alignment: .center) {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: 360, height: 50)
                                            .cornerRadius(10)
                                            .padding(0)
                                        
                                        TextField("Modifiez votre téléphone", text: $phone)
                                            .padding(.leading, 30)
                                            .font(.system(size: 25))
                                            .italic()
                                        
                                    }
// --------------------------------------------------------------------------------------------------------------

                                    ///ADRESSE
                                    ZStack (alignment: .center) {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: 360, height: 50)
                                            .cornerRadius(10)
                                            .padding(0)
                                        
                                        TextField("Modifiez votre adresse", text: $address)
                                            .padding(.leading, 30)
                                            .font(.system(size: 25))
                                            .italic()
                                        
                                    }
// --------------------------------------------------------------------------------------------------------------

                                    ///ASSOCIATION
                                    ZStack (alignment: .center) {
                                        Rectangle()
                                            .foregroundColor(.white)
                                            .frame(width: 360, height: 50)
                                            .cornerRadius(10)
                                            .padding(0)
                                        
                                        Spacer()
                                        TextField("Modifiez votre thème préféré", text: $association)
                                            .padding(.leading,30)
                                            .font(.system(size: 25))
                                            .italic()
                                        
                                        
                                    }
// --------------------------------------------------------------------------------------------------------------

                                    ///AVEZ-VOUS UNE VOITURE
                                    VStack {
                                        Text("Avez-vous une voiture?")
                                            .font(.system(size: 25))
                                            .italic()
                                            .padding(.top, 0.0)
// --------------------------------------------------------------------------------------------------------------
                                        ///OUI
                                      
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
// --------------------------------------------------------------------------------------------------------------

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
// --------------------------------------------------------------------------------------------------------------

                                                ///CONFIRMER
                                                ZStack {
                                                    NavigationLink(destination: MonProfile()) {
                                                        
                                                        VStack{
                                                            ZStack{
                                                                Rectangle()
                                                                    .foregroundColor(colorJaune)
                                                                    .frame(width: 360, height: 60)
                                                                    .cornerRadius(10)
                                                                    .padding(.bottom, 20)
                                                                
                                                                Text("Confirmer")
                                                                    .fontWeight(.bold)
                                                                    .foregroundColor(.black)
                                                                    .font(.system(size: 25))
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
                .navigationTitle("Modifier mon profile")
                        }
           
                    }
                }
                
//            }
        
    
    
    
    struct ModifierProfile_Previews: PreviewProvider {
        static var previews: some View {
            ModifierMonProfile()
        }
    }
    
    

    

        
        
                                               
    
        
        
        
        
        




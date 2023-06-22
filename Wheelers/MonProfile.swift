//
//  MonProfile.swift
//  Wheelers
//
//  Created by Formation on 11/05/2023.
//

import SwiftUI
import PhotosUI

struct MonProfile: View {
//    @State private var nom: String = ""
//    @State private var prenom: String = ""
//    @State private var age: String = ""
//    @State private var phone: String = ""
//    @State private var email: String = ""
//    @State private var address: String = ""
//    @State private  var ville: String = ""
//    @State private var zipAsso = ""
//    //    @State private var zip: Int = 75012
//    @State private var theme: String = ""
//    @State private var selectedItem: PhotosPickerItem? = nil
//    @State private var selectedImageData: Data? = nil
    
    //    var pp: String = "" //Photo de profil
    //        var nom: String = ""
    //        var prenom: String = ""
    //        var age: Int = 72
    //        var adresse: String = ""
    //        var ville: String = ""
    //        var zip: Int = 75012
    //        var theme: String = ""
    //        var voiture: Bool = false
    
    
    
    var body: some View {
        
//        TabView{
            NavigationStack{
                VStack{
//                    Text("Mon profile")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .padding(.top, 20.0)
//                    Rectangle()
//                        .frame(height: 3.0)
//                        .foregroundColor(.gray)
                    ZStack{
                        Rectangle()
                            .foregroundColor(colorBleu)
                            .padding(.top, -9.0)
                        
                        ZStack{
                            ScrollView{
                                VStack(alignment: .center) {
                                    
                                    VStack(spacing: 8){
                                        
                                        HStack {
                                            ZStack{
                                                Circle()
                                                    .foregroundColor(colorJaune)
                                                    .frame(width: 135.0, height: 135.0)
                                                    .padding(.trailing, 230)
                                                Image("Maria")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .clipShape(Circle())
                                                    .frame(width: 130, height: 190)
                                                    .padding(.leading, -180)
                                                
                                                
                                                
                                                VStack(alignment: .leading){
                                                    Text("Maria La Croix")
                                                        .font(.system(size: 30))
                                                        .fontWeight(.bold)
                                                        .padding(.leading, 120)
                                                    Text("72 ans")
                                                        .font(.system(size: 25))
                                                        .padding(.leading, 120)
//                                                        .fontWeight(.bold)
                                                }
                                            }
                                        }
// --------------------------------------------------------------------------------------------------------------
//Phone
                                        HStack{
                                            ZStack{
                                                Rectangle()
                                                    .foregroundColor(.white)
                                                    .frame(width:360, height: 350)
                                                    .cornerRadius(10)
                                                VStack (alignment: .leading){
                                                    VStack {
                                                        HStack {
                                                            Image(systemName: "phone")
                                                                .font(.system(size: 40))
                                                                .padding(.leading, 0)
                                                            Text("06 77 48 33 54")
                                                                .font(.title2)
                                                        }
                                                    }
// --------------------------------------------------------------------------------------------------------------
//Email
                                                    VStack (alignment: .center){
                                                        Rectangle()
                                                            .frame(width:330, height: 1)
                                                        VStack (alignment: .leading){
                                                            VStack {
                                                                HStack {
                                                                    Image(systemName: "envelope")
                                                                        .font(.system(size: 40))
                                                                        .padding(.leading, 0)
                                                                    Text("maria@gmail.com")
                                                                        .font(.system(size: 25))
                                                                }
                                                            }
// --------------------------------------------------------------------------------------------------------------
//Address
                                                            VStack (alignment: .leading){
                                                                Rectangle()
                                                                
                                                                    .frame(width:330, height: 1)
                                                                VStack (alignment: .leading){
                                                                    HStack {
                                                                        Image(systemName: "mappin.and.ellipse")
                                                                            .font(.system(size: 40))
                                                                            .padding(.leading, 0)
                                                                        VStack {
                                                                            Text("42 Avenue des Gobelins")
                                                                                .font(.title2)
                                                                            
                                                                            Text("93100 Montreuil")
                                                                                .font(.title2)
                                                                        }
                                                                    }
// --------------------------------------------------------------------------------------------------------------
//Thème
                                                                    VStack (alignment: .leading){
                                                                        Rectangle()
                                                                            .frame(width:330, height: 1)
                                                                        
                                                                        
                                                                        HStack{
                                                                            Image(systemName: "suit.heart.fill")
                                                                                .foregroundColor(.red)
                                                                                .font(.system(size: 40))
                                                                                .padding(.leading, 0)
                                                                            VStack{
                                                                                Text("Thème préféré : Action sociale")
                                                                                    .font(.system(size: 20))
                                                                            }
                                                                        }
// --------------------------------------------------------------------------------------------------------------
//Voiture
                                                                        VStack (alignment: .leading){
                                                                            Rectangle()
                                                                                .frame(width:330, height: 1)
                                                                            VStack(alignment: .leading) {
                                                                                HStack{
                                                                                    Image(systemName: "car")
                                                                                        .font(.system(size: 40))
                                                                                    VStack{
                                                                                        Text("Pas de voiture")
                                                                                            .font(.system(size: 25))
                                                                                    
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
                                            }
                                            .padding(.top, -30)
                                        }
                                    }
                                }
// --------------------------------------------------------------------------------------------------------------
//Modifier mon Profil
                                ZStack {
                                        VStack{
                                            ZStack{
                                                NavigationLink(destination: ModifierMonProfile()) {
                                                    
                                                
                                                    Rectangle()
                                                        .foregroundColor(colorJaune)
                                                        .frame(width: 360, height: 60)
                                                        .cornerRadius(10)
                                                        .padding(.bottom, 15)
                                                        .overlay{
                                                            
                                                            Text("Modifier mon profil")
                                                                .fontWeight(.bold)
                                                                .font(.system(size: 25))
                                                                .foregroundColor(Color.black)
                                                                .italic()
                                                                .padding(.bottom)
                                                           
//
                                                        
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Mon profile")
            }
        
        
           
        
    }
    struct Profile_Previews: PreviewProvider {
        static var previews: some View {
            MonProfile()
        }
    }
}
                        
                    


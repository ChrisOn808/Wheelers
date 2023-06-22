//
//  ProfilConducteur.swift
//  Wheelers
//
//  Created by Formation on 27/04/2023.
//

import SwiftUI

struct ProfileDuConducteur: View {
    var body: some View {
        
        ZStack{
            colorBleu
            VStack {
                //Informations profil
                ZStack{
                    Rectangle()
                        .frame(width: 360, height: 500)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                    
                    //Photo de profil
                    Circle()
                        .foregroundColor(colorJaune)
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 400)
                    Image("Antoine")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 145, height: 145)
                        .padding(.bottom, 400)
                    
                    
                    // Texte 1 (Nom, ville, position)
                    Text("Antoine")
                        .padding(.bottom, 200)
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                    Text("Montreuil")
                        .padding(.bottom, 120)
                        .font(.system(size: 30))
                    Text("Actuellement à 800 m de vous")
                        .padding(.bottom, 50)
                        .font(.system(size: 20))
                    Rectangle ()
                        .frame(width: 300, height: 1)
                    
                    // Texte 2 (Age, Identité vérifiée)
                    
                    Text("27 ans")
                        .padding(.top, 50)
                        .font(.system(size: 30))
                    HStack{
                        Text("Identité vérifiée")
                            .padding(.top, 130)
                            .font(.system(size: 30))
                        Image(systemName: "person.badge.shield.checkmark.fill")
                            .padding(.top, 130)
                            .foregroundColor(.green)
                            .font(.system(size: 30))
                    }
                    Rectangle ()
                        .frame(width: 300, height: 1)
                        .padding(.top, 200)
                }
                HStack{
                    ZStack{
                        Rectangle ()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                        Image("Secours Populaire")
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
               
                    Text("Secours Populaire de Montreuil")
                        .foregroundColor(.black)
                        .font(.system(size: 30))
                
            }
                .padding(.top, -160)
//Boutton appel
                HStack{
                    Rectangle()
                        .foregroundColor(colorJaune)
                        .frame(width: 160, height: 88)
                        .cornerRadius(10)
                        .overlay {
                            Image(systemName: "phone.fill")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
//Boutton messages
                    Rectangle()
                        .foregroundColor(colorJaune)
                        .frame(width: 160, height: 88)
                        .cornerRadius(10)
                        .overlay {
                            Image(systemName: "ellipsis.message.fill")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        }
                .padding(.top, -44)
                }
        }
    }
    
    struct ProfilConducteur_Previews: PreviewProvider {
        static var previews: some View {
            ProfileDuConducteur()
        }
    }
}

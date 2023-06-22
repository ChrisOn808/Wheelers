//
//  ResultatRecherche.swift
//  Wheelers
//
//  Created by Formation on 27/04/2023.
//

import SwiftUI

struct ResultatDeRecherche: View {
    var body: some View {
        VStack{
            ZStack{
                colorBleu
                
                VStack{
//Ils peuvent vous conduire
                    ZStack{
                        Text("Ils peuvent vous conduire")
                            .fontWeight(.bold)
                            .font(.system(size: 34))
                            .multilineTextAlignment(.center)
                        //                        .padding(.top, 50)
                    }
                    //Antoine
                    NavigationLink(destination: Inscription()) {
                    ZStack{
                        Rectangle ()
                            .foregroundColor(.white)
                            .frame(width: 360, height: 88)
                            .cornerRadius(10)
                        HStack{
                                ZStack(alignment:.leading){
                                    Circle ()
                                        .frame(width: 100, height: 80)
                                        .foregroundColor(colorJaune)
                                        .padding(EdgeInsets(top: 0, leading: -22, bottom: 0, trailing: 0))
                                    Image("Antoine")
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 75, height: 75)
                                        .padding(.leading, -9)
                                    VStack(alignment:.leading){
                                        Text("Antoine")
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                            .font(.system(size: 34))
                                            .multilineTextAlignment(.center)
                                            .padding(.leading, 75)
                                        Text("Actuellement à 800m de vous")
                                            .font(.system(size: 19))
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                            .padding(.leading, 75)
                                    }
                                }
                            }
                        }
                    }
                   
                    //Thomas
                    ZStack{
                        Rectangle ()
                            .foregroundColor(.white)
                            .frame(width: 360, height: 88)
                            .cornerRadius(10)
                        
                        HStack{
                            ZStack(alignment:.leading){
                                Circle ()
                                    .frame(width: 100, height: 80)
                                    .foregroundColor(colorJaune)
                                    .padding(.leading, -22)
                                Image("Thomas")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 75, height: 75)
                                    .padding(EdgeInsets(top: 0, leading: -9, bottom: 0, trailing: 0))
                                VStack(alignment:.leading){
                                    Text("Thomas")
                                        .fontWeight(.bold)
                                        .font(.system(size: 34))
                                        .multilineTextAlignment(.center)
                                        .padding(.leading, 75)
                                    
                                    Text("Actuellement à 1,5 km de vous")
                                        .font(.system(size: 19))
                                        .multilineTextAlignment(.center)
                                        .padding(.leading, 75)
                                }
                            }
                        }
                    }
                    .padding(.top, -6)
                    .padding(.bottom, -8)
               
                    //Kim
                    ZStack{
                        Rectangle ()
                            .foregroundColor(.white)
                            .frame(width: 360, height: 88)
                            .cornerRadius(10)
                        
                        HStack{
                            ZStack(alignment:.leading){
                                Circle ()
                                    .frame(width: 100, height: 80)
                                    .foregroundColor(colorJaune)
                                    .padding(.leading, -22)
                                Image("Kim")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 75, height: 75)
                                    .padding(.leading, -9)
                                VStack(alignment:.leading){
                                    Text("Kim")
                                        .fontWeight(.bold)
                                        .font(.system(size: 34))
                                        .multilineTextAlignment(.center)
                                        .padding(.leading, 75)
                                    
                                    Text("Actuellement à 2,2 km de vous")
                                        .font(.system(size: 19))
                                        .multilineTextAlignment(.center)
                                        .padding(.leading, 75)
                                }
                                
                            }
                            
                        }
                       
                    }
                        .padding(.bottom, 200)
                }
            }
        }
    }
}

struct ResultatRecherche_Previews: PreviewProvider {
    static var previews: some View {
        ResultatDeRecherche()
    }
}

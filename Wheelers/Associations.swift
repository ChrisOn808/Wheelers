//
//  AssociationsPlayground.swift
//  ExercicesString
//
//  Created by Formation on 05/05/2023.
//

import SwiftUI

struct Associations: View {
    
    @Binding var choixAssociation: Assos
//    @Binding var choixAssociationTrajet: Assos
    @Binding var navPath: NavigationPath
//    @Binding var navPathTrajet: NavigationPath
//    @Binding var choixTheme: Theme
    
    @State private var showFilterModal = false
    @State private var filterLabel = "Affinez votre recherche"

    var body: some View {
        ZStack{
            colorBleu
            VStack(alignment:.leading){
                Spacer()
                ScrollView{
                    ForEach(arrayAssos) { banana in
                        HStack {
                            Image(banana.imageAssos)
                                .resizable()
                                .frame(width: 80, height: 80)
                            VStack(alignment:.leading) {
                                Text(banana.nameAssos)
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                HStack{
                                    Text(banana.villeAssos)
                                        .font(.system(size: 20))
                                    Text("- \(banana.distanceAssos) km")
                                        .font(.system(size: 20))
                                    Spacer()
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            navPath.removeLast(navPath.count)
                            choixAssociation = banana
                        }
                    }
                }
//Bouton affiner recherche ----------------------------------------------------------------------------------------------
                    Button(action: {
                        showFilterModal = true
                    }, label: {
                        ZStack{
                            Rectangle()
                                .foregroundColor(colorJaune)
                                .frame(width: 365, height: 88)
                                .cornerRadius(10)
                            Spacer()
                            HStack{
                                Image(systemName: "slider.vertical.3")
                                    .font(.system(size: 60))
                                    .foregroundColor(.black)
                                    .padding(.trailing, 20)
                                Text(filterLabel)
                                    .foregroundColor(.black)
                                    .font(.system(size: 30))
                                    .fontWeight(.bold)
                            }
                            .padding(.trailing, 60)
                        }
                        .padding(.bottom)
                    })
                    .padding(.top, 10)
                    .sheet(isPresented: $showFilterModal) {
                        FilterModalView()
                    }
                
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("Choisissez votre association",  displayMode: .inline)
    }
}
// Menu dérroulant ------------------------------------------------------------------
struct FilterModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        
        VStack {
            Text("Affinez votre recherche")
                .font(.headline)
                .padding(.bottom, 0)
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(colorJaune)
                            .frame(width: 360, height: 50)
                            .cornerRadius(30)
                        Text("Appliquer")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                }
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .cornerRadius(30)
                        Text("Fermer")
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }
                }
            }
            .padding()
            .background(colorBleu)
            .cornerRadius(10)
            .shadow(radius: 0)
        }
    }
    
    
    
    struct Associations_Previews: PreviewProvider {
        static var previews: some View {
//            Associations(choixAssociation: .constant(Assos(nameAssos: "Titi", imageAssos: "toto", villeAssos: "toto sur marne", distanceAssos: 200)), navPath: .constant(NavigationPath()))
            Associations(choixAssociation: .constant(Assos(nameAssos: "Titi", imageAssos: "toto", villeAssos: "toto sur marne", distanceAssos: 200)), navPath: .constant(NavigationPath()))
        }
    }


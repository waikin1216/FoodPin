//
//  ContentView.swift
//  FoodPin
//
//  Created by Wai Kin Ng on 12/1/2024.
//

import SwiftUI

struct RestaurantListView: View {
    @State var restaurants = [
        Restaurant(showError:false, showOption:false,isFavorite: false, name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend"),
    Restaurant(showError:false, showOption:false,isFavorite: false, name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei"),
    Restaurant(showError:false, showOption:false,isFavorite: false, name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha"),
    Restaurant(showError:false, showOption:false,isFavorite: false, name: "Cafe Loisl", type: "Cafe", location: "Hong Kong", image: "cafeloisl"),
    Restaurant(showError:false, showOption:false,isFavorite: false, name: "Petite Oyster", type: "Cafe", location: "Hong Kong", image: "petiteoyster"),
    Restaurant(showError:false, showOption:false,isFavorite: false, name: "For Kee Restaurant", type: "Cafe", location: "Hong Kong", image: "forkeerestaurant"),
    Restaurant(showError:false, showOption:false,isFavorite: false, name: "Po's Atelier", type: "Cafe", location: "Hong Kong", image: "bourkestreetbakery"),
    Restaurant(showError:false, showOption:false,isFavorite: false, name: "Bourke Street Bakery", type: "Cafe", location: "Hong Kong", image: "grahamavenuemeats"),
    Restaurant(showError:false, showOption:false,isFavorite: false, name: "Gaigh's Chocolate", type: "Cafe", location: "Hong Kong", image: "palominoespresso"),
    Restaurant(showError:false, showOption:false,isFavorite: false, name: "Palomino Espresso", type: "Cafe", location: "Hong Kong", image: "upstate"),
    ]
    
//    @State var restaurants = [
//    Restaurant(isFavorite: false, name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend"),
//    Restaurant(isFavorite: false, name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei"),
//    Restaurant(isFavorite: false, name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha"),
//    Restaurant(isFavorite: false, name: "Cafe Loisl", type: "Cafe", location: "Hong Kong", image: "cafeloisl"),
//    Restaurant(isFavorite: false, name: "Petite Oyster", type: "Cafe", location: "Hong Kong", image: "petiteoyster"),
//    Restaurant(isFavorite: false, name: "For Kee Restaurant", type: "Cafe", location: "Hong Kong", image: "forkeerestaurant"),
//    Restaurant(isFavorite: false, name: "Po's Atelier", type: "Cafe", location: "Hong Kong", image: "bourkestreetbakery"),
//    Restaurant(isFavorite: false, name: "Bourke Street Bakery", type: "Cafe", location: "Hong Kong", image: "grahamavenuemeats"),
//    Restaurant(isFavorite: false, name: "Gaigh's Chocolate", type: "Cafe", location: "Hong Kong", image: "palominoespresso"),
//    Restaurant(isFavorite: false, name: "Palomino Espresso", type: "Cafe", location: "Hong Kong", image: "upstate"),
//    ]
//    @State var restaurantIsFavorites = Array(repeating: false, count: 21)
//    var restaurantNames=["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Gaigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats And Deli","Waffle & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","CASK Pub and Kitchen"]
//    
//    var restaurantImages=["cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","grahamavenuemeats","palominoespresso","upstate","traif","grahamavenuemeats","wafflewolf","fiveleaves","cafelore","confessional","barrafina","donostia","royaloak","caskpubkitchen"]
//    
//    var restaurantLocations=["Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong"]
//    
//    var restaurantTypes=["Coffee & Tea Shop","Cafe","Tea House","Coffee & Tea Shop","Cafe","Tea House","Coffee & Tea Shop","Cafe","Tea House","Coffee & Tea Shop","Cafe","Tea House","Coffee & Tea Shop","Cafe","Tea House","Coffee & Tea Shop","Cafe","Tea House","Coffee & Tea Shop","Cafe","Tea House"]
    
    var body: some View {
        
        NavigationStack {
            List{
                
                ForEach(restaurants.indices,id: \.self){
                    index in
                    
    //               FullImageText(isFavorite: $restaurants[index].isFavorite, image: restaurants[index].image, name: restaurants[index].name, type: restaurants[index].type, location: restaurants[index].location)
                    FullImageText(restaurant: $restaurants[index])
                        .swipeActions(edge: .leading, allowsFullSwipe: false, content: {
                            Button{
                                if restaurants[index].isFavorite{
                                    restaurants[index].isFavorite = false
                                }else{
                                    restaurants[index].isFavorite = true
                                }
                            }label: {
                                Image(systemName: "heart")
                            }
                            .tint(.blue)
                        })
                }
                .onDelete(perform: { indexSet in
                    restaurants.remove(atOffsets: indexSet)
                })
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
            .navigationTitle("FoodPin")
            .navigationBarTitleDisplayMode(.automatic)
        }
        
    }
}

#Preview {
    RestaurantListView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

struct BasicImageText: View {
    @State private var showOptions = false
    @State private var showError = false
    @Binding var isFavorite:Bool
    var image:String
    var name:String
    var type:String
    var location:String
    
    var body: some View {
        
        HStack(alignment:.top){
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 100)
                .cornerRadius(10)
            VStack(alignment: .leading){
                Text(name)
                
                    .font(.system(.title,design: .rounded))
                Text(type)
                
                    .font(.system(.body,design: .rounded))
                Text(location)
                    .font(.system(.subheadline,design: .rounded))
                
            }
            if isFavorite{
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        }
        .onTapGesture {
            showOptions.toggle()
        }
        .confirmationDialog("what do you want to do", isPresented: $showOptions, titleVisibility: .visible){
            Button("Reverse a table"){
                self.showError.toggle()
            }
            Button("Mark as favourite"){
                self.isFavorite.toggle()
            }
        }
        .alert("Not yet available",isPresented: $showError){
            Button("Ok"){}
        }message: {
            Text("please try again later")
        }
            
        }
        
    }

struct FullImageText: View {
//    @State private var showOptions = false
//    @State private var showError = false
    @Binding var restaurant : Restaurant
    @State var isShare : Bool = false
//    @Binding var isFavorite:Bool
//    var image:String
//    var name:String
//    var type:String
//    var location:String
   
    var body: some View {
        VStack(alignment:.leading){
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(10)
            HStack(alignment:.bottom){
                VStack(alignment: .leading){
                    Text(restaurant.name)
                    
                        .font(.system(.title,design: .rounded))
                    Text(restaurant.type)
                    
                        .font(.system(.body,design: .rounded))
                    Text(restaurant.location)
                        .font(.system(.subheadline,design: .rounded))
                    
                }
                if restaurant.isFavorite{
                    Spacer()
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                        
                }
            }
            
            
        }
        .contextMenu{
            Button(action:{
                restaurant.isFavorite.toggle()
            }){
                HStack{
                    restaurant.isFavorite ? Text("Remove from favorite") : Text("Mark as favorite")
                    Image(systemName: "heart")
                }
            }
        }
        .onTapGesture {
            restaurant.showOption.toggle()
        }
        .confirmationDialog("what do you want to do", isPresented: $restaurant.showOption, titleVisibility: .visible){
            Button("Reverse a table"){
                self.restaurant.showError.toggle()
            }
            if !restaurant.isFavorite{
                Button("Mark as favourite"){
                    self.restaurant.isFavorite.toggle()
                }
            }else{
                Button("Remove from favourite"){
                    self.restaurant.isFavorite.toggle()
                }
            }
            
        }
        Button(action:{
            self.isShare.toggle()
        }){
            HStack{
                Text("Share")
                Image(systemName:"square.and.arrow.up")
            }
        }
        .alert("Not yet available",isPresented: $restaurant.showError){
            Button("Ok"){}
        }message: {
            Text("please try again later")
        }
        .sheet(isPresented: $isShare, content: {
            let defaultText = "Just checking in at \(restaurant.name)"
            if let imageToShare = UIImage(named: restaurant.image){
                ActivityView(activityItems: [defaultText,imageToShare])
            }else{
                ActivityView(activityItems: [defaultText])
            }
        })
            
        }
        
    }

import SwiftUI



struct AppHelper {

    static func loadPetBreedsFromJSON() -> [PetModel] {

        //step 2- this part search for file data.json- find or not - else if not find [] means just get out

        guard let url = Bundle.main.url(forResource: "PetData", withExtension: "json") else {

            print("❌ pets.json not found in bundle")

            return []

        }

        print(url)

        do {

            //step 3 we extract data inside file url

            let data = try Data(contentsOf: url)

            let decoder = JSONDecoder()

            //decode convert json to swift obj

            let petsContainer = try decoder.decode(PetsContainer.self, from: data)

//            petsContainer.pets  - come fron petmodel name of struct

            //key name have to becareful need to match key (petss) on jason- and in pet modal and in function

            return petsContainer.petss

        } catch {

            print("❌ Failed to load or decode pets.json: \(error)")

            return []

        }

    }

}

struct SquareCompMapView: View {

    

    struct Pet: Identifiable{

        let name:String

        let imageName:String

        let id = UUID()

    }

    

//    let petArray: [Pet] = [

//        Pet(name: "cat", imageName: "dog3bg"),

//        Pet(name: "dog", imageName: "img2"),

//        Pet(name: "bird", imageName: "img1"),

//        Pet(name: "fish", imageName: "img2"),

//        Pet(name: "lizard", imageName: "img1"),

//    ]

 var petArrayOfPetModel : [PetModel]

    

    // Define 2 columns for vertical grid

    let columns = [

        GridItem(.flexible()),

        GridItem(.flexible())

    ]

    

    //  iphone 8 has width of 375 px

    // iphone 14 pro has width of 414 px

    var body: some View {

        ScrollView {

            LazyVGrid(columns: columns, spacing: 20) {

               //line 37 use petArrayOfPetModel

                ForEach(petArrayOfPetModel) {pet in

                    //pet represent each item of array

                    ZStack(alignment: .bottom) {

                        // Complete screen width (- leading - trailing) - spacing between two card and then dividing by 2



                        Rectangle()

                            .frame(width: (UIScreen.main.bounds.width - 32 - 20) / 2, height: 160)

                            .foregroundColor(Color(hex: "f1c40f"))

                            .cornerRadius(25)

                        // Complete screen width (- leading - trailing) - spacing between two card  and then dividing by 2 and -10 for image should be less than rectange width



                        Image(pet.image, bundle: nil)

                            .resizable()

                            .scaledToFit()

                            .frame(width: ((UIScreen.main.bounds.width - 32 - 20) / 2) - 10, height: 150)

                            .offset(x: 60, y: 20)

                        

//                         Heart icon in top left corner

                        Image(systemName: "heart")

                            .resizable()

                            .frame(width: 25, height: 25)

                            .foregroundColor(.red)

                            .offset(x: -50, y: -110)

                        

                        Text(pet.type)

                            .font(.title)

                            .fontWeight(.semibold)

                            .foregroundColor(.white)

                            .offset(x: 2, y: -105)

                        

                        Text(pet.distance ?? "Location is not available")

                            .font(.system(size: 16))

                            .fontWeight(.bold)

                            .foregroundColor(.white)

                            .offset(x: -20, y: -20)

                    }

                }

            }//close v stack by default 16 if not change anything

            .padding(10)

        }

    }

}



#Preview {

    SquareCompMapView(petArrayOfPetModel: AppHelper.loadPetBreedsFromJSON())

    

    

}


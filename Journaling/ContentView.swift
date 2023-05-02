import SwiftUI

struct ContentView: View {
    
    @ObservedObject var datas = ReadData()
    
    @State private var textInput = ""
    @State private var savedText = ""
    @State private var textStyle = UIFont.TextStyle.footnote
    
    var body: some View {
        List(datas.infos){ info in
                    VStack(alignment: .leading) {
                        Text(info.title)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.gray)
                            
                        HStack{
                            Text(info.body)
                                .font(.title3)
                                .foregroundColor(Color.red)
                        }
                    }
                }
        
//        VStack {
//            TextView(text: $textInput, textStyle: $textStyle)
//                .textFieldStyle(.roundedBorder)
//                .padding()
//
//            Button(action: {
//                writeTextToJSON(text: textInput)
//                savedText = textInput
//            }, label: {
//                Text("Save")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            })
//        }
//        .onAppear {
//            savedText = readTextFromJSON()
//        }
    }
    
    private func writeTextToJSON(text: String) {
        // Create a dictionary with the text input
        let dict: [String: String] = ["text": text]
        
        // Convert the dictionary to JSON data
        guard let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted) else {
            print("Failed to convert dictionary to JSON data")
            return
        }
        
        // Get the document directory path
        guard let documentDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Failed to get document directory path")
            return
        }
        
        // Set the file name
        let fileName = "text.json"
        
        // Set the file URL
        let fileURL = documentDirectoryPath.appendingPathComponent(fileName)
        
        do {
            // Write the JSON data to the file
            try jsonData.write(to: fileURL)
            print("Successfully wrote text to JSON file")
        } catch {
            print("Failed to write text to JSON file: \(error.localizedDescription)")
        }
    }
    
    private func readTextFromJSON() -> String {
        // Get the document directory path
        guard let documentDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Failed to get document directory path")
            return ""
        }
        
        // Set the file name
        let fileName = "text.json"
        
        // Set the file URL
        let fileURL = documentDirectoryPath.appendingPathComponent(fileName)
        
        do {
            // Read the contents of the file as JSON data
            let jsonData = try Data(contentsOf: fileURL)
            
            // Convert the JSON data to a dictionary
            guard let dict = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: String] else {
                print("Failed to convert JSON data to dictionary")
                return ""
            }
            
            // Return the text value from the dictionary
            return dict["text"] ?? ""
        } catch {
            print("Failed to read text from JSON file: \(error.localizedDescription)")
            return ""
        }
    }
}

struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
    }
}


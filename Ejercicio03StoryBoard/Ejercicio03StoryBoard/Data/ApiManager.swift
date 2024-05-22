

import Foundation

class ApiManager{
   let baseUrlString = "https://pokeapi.co/api/v2/pokemon/"
    func getPokemon(withId id:Int, completion: @escaping(_ pokemon: Pokemon?) -> Void){
        guard let url = URL(string: "\(baseUrlString)\(id)") else{
            completion(nil)
            return
        }
        let urlSesion = URLSession(configuration: .default)
        let task = urlSesion.dataTask(with: url){ data, response , error in
            if error == nil , let data = data {
                let pokemon = Pokemon(withJSONData: data)
                completion(pokemon)
            }else{
                completion(nil)
            }
        }
        task.resume()
    }
    func getSprite(withUrlString urlString:String, completion: @escaping(_ image:Data?) -> Void){
        
        guard let url = URL(string: urlString) else{
            completion(nil)
            return
        }
        let urlSesion = URLSession(configuration: .default)
        let task = urlSesion.dataTask(with: url){ data, response , error in
            if let data = data {
                completion(data)
            }else{
                completion(nil)
            }
        }
        task.resume()
    }
}

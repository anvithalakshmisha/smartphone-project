//
//  AppDelegate.swift
//  EmptyApp
//
//  Created by rab on 02/15/24.
//  Copyright © 2024 rab. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            
            window.backgroundColor = UIColor.lightGray
            window.rootViewController = UIViewController()
            window.makeKeyAndVisible()
            
    //            Main View
        let mainView = MainView(frame: UIScreen.main.bounds)
    // Add the artist view to the window or another existing view
        window.addSubview(mainView)
        }

        return true
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

var artist1 = Artist(id: 1, name: "Anvitha")
var artist2 = Artist(id: 2, name: "Ankitha")
// Global variables
var artists: [Artist] = [artist1, artist2]
var albums: [Album] = []
var songs: [Song] = []
var genres: [Genre] = []



extension UIButton {
    static func styledButton(frame: CGRect, title: String) -> UIButton {
        let button = UIButton(frame: frame)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.isUserInteractionEnabled = true
        button.isEnabled = true
        button.backgroundColor = .purple
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 2
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }
}


class MainView: UIView {
    var heading: UILabel!
    var manageArtist: UIButton!
    var manageAlbum: UIButton!
    var manageSong: UIButton!
    var manageGenre: UIButton!
    var searchViewBtn: UIButton!
    
    var artistView: ArtistView?
    var albumView: AlbumView?
    var songView: SongView?
    var genreView: GenreView?
    
    var searchView: SearchView?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
                heading = UILabel(frame: CGRect(x: 140, y: 50, width: frame.width - 40, height: 50))
                heading.textColor = .black
                heading.font = UIFont.boldSystemFont(ofSize: 20)
                heading.text = "MAIN VIEW"
                addSubview(heading)
        
                manageArtist = UIButton.styledButton(frame: CGRect(x: 20, y: 100, width: frame.width - 40, height: 50), title: "Manage artists")
        manageArtist.addTarget(self, action: #selector(setupArtistView), for: .touchUpInside)
                manageAlbum = UIButton.styledButton(frame: CGRect(x: 20, y: 200, width: frame.width - 40, height: 50), title: "Manage albums")
        manageAlbum.addTarget(self, action: #selector(setupAlbumView), for: .touchUpInside)
                manageSong = UIButton.styledButton(frame: CGRect(x: 20, y: 300, width: frame.width - 40, height: 50), title: "Manage songs")
        manageSong.addTarget(self, action: #selector(setupSongView), for: .touchUpInside)
                manageGenre = UIButton.styledButton(frame: CGRect(x: 20, y: 400, width: frame.width - 40, height: 50), title: "Manage genre")
        manageGenre.addTarget(self, action: #selector(setupGenreView), for: .touchUpInside)
        
        searchViewBtn = UIButton.styledButton(frame: CGRect(x: 20, y: 500, width: frame.width - 40, height: 50), title: "Search")
        searchViewBtn.addTarget(self, action: #selector(setupSearchView), for: .touchUpInside)
        
                addSubview(manageArtist)
                addSubview(manageAlbum)
                addSubview(manageSong)
                addSubview(manageGenre)
        addSubview(searchViewBtn)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc private func setupArtistView() {
        artistView = ArtistView(frame: UIScreen.main.bounds)
        artistView?.backgroundColor = .white
        addSubview(artistView!)
    }
    
    
    @objc private func setupAlbumView() {
        print("Manage albums action")
        albumView = AlbumView(frame: UIScreen.main.bounds)
        albumView?.backgroundColor = .white
        addSubview(albumView!)
    }
    
    @objc private func setupSongView() {
        print("Manage songs action")
        songView = SongView(frame: UIScreen.main.bounds)
        songView?.backgroundColor = .white
        addSubview(songView!)
    }
    
    @objc private func setupGenreView() {
        print("Manage genres action")
        genreView = GenreView(frame: UIScreen.main.bounds)
        genreView?.backgroundColor = .white
        addSubview(genreView!)
        
    }
    
    @objc func setupSearchView() {
        searchView = SearchView(frame: UIScreen.main.bounds)
        searchView?.backgroundColor = .white
        addSubview(searchView!)
    }
    
}

class SearchView: UIView {
    let searchArtist =  UITextField()
    let searchArtistButton =  UIButton(type: .system)
    let searchAlbum = UITextField()
    let searchAlbumButton =  UIButton(type: .system)
    let searchSong = UITextField()
    let searchSongButton =  UIButton(type: .system)
    let searchGenre = UITextField()
    let searchGenreButton =  UIButton(type: .system)
    
    let backButton = UIButton(type: .system)
    let popup = PopupView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        searchArtist.placeholder = "Enter the artist name you want to search"
        searchArtist.borderStyle = .roundedRect
        searchArtist.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 2
        searchAlbum.placeholder = "Enter album title you want to search"
        searchAlbum.borderStyle = .roundedRect
        searchAlbum.translatesAutoresizingMaskIntoConstraints = false
        
        searchSong.placeholder = "Enter song title you want to search"
        searchSong.borderStyle = .roundedRect
        searchSong.translatesAutoresizingMaskIntoConstraints = false
        
        searchGenre.placeholder = "Enter genre name you want to search"
        searchGenre.borderStyle = .roundedRect
        searchGenre.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // Configure submit button
        searchArtistButton.setTitle("Search artist", for: .normal)
        searchArtistButton.translatesAutoresizingMaskIntoConstraints = false
        searchArtistButton.addTarget(self, action: #selector(searchForArtistButtonTapped), for: .touchUpInside)
        
        // Configure submit button
        searchAlbumButton.setTitle("Search album", for: .normal)
        searchAlbumButton.translatesAutoresizingMaskIntoConstraints = false
        searchAlbumButton.addTarget(self, action: #selector(searchForAlbumButtonTapped), for: .touchUpInside)
        
        // Configure submit button
        searchSongButton.setTitle("Search song", for: .normal)
        searchSongButton.translatesAutoresizingMaskIntoConstraints = false
        searchSongButton.addTarget(self, action: #selector(searchForSongButtonTapped), for: .touchUpInside)
        
        // Configure submit button
        searchGenreButton.setTitle("Search genre", for: .normal)
        searchGenreButton.translatesAutoresizingMaskIntoConstraints = false
        searchGenreButton.addTarget(self, action: #selector(searchForGenreButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(searchArtist)
        addSubview(searchAlbum)
        addSubview(searchSong)
        addSubview(searchGenre)
        addSubview(searchArtistButton)
        addSubview(searchAlbumButton)
        addSubview(searchSongButton)
        addSubview(searchGenreButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
            
            
            searchArtist.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            searchArtist.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchArtist.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                            
            searchArtistButton.topAnchor.constraint(equalTo: searchArtist.bottomAnchor, constant: 10),
            searchArtistButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            searchAlbum.topAnchor.constraint(equalTo: searchArtistButton.bottomAnchor, constant: 20),
            searchAlbum.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchAlbum.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                            
            searchAlbumButton.topAnchor.constraint(equalTo: searchAlbum.bottomAnchor, constant: 10),
            searchAlbumButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            searchSong.topAnchor.constraint(equalTo: searchAlbumButton.bottomAnchor, constant: 20),
            searchSong.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchSong.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                            
            searchSongButton.topAnchor.constraint(equalTo: searchSong.bottomAnchor, constant: 10),
            searchSongButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            searchGenre.topAnchor.constraint(equalTo: searchSongButton.bottomAnchor, constant: 20),
            searchGenre.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchGenre.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                            
            searchGenreButton.topAnchor.constraint(equalTo: searchGenre.bottomAnchor, constant: 10),
            searchGenreButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: searchGenreButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func searchForArtistButtonTapped() {
        if let query = searchArtist.text, !query.isEmpty {
            let artistResults = artists.filter { $0.name.contains(query) }
            if !artistResults.isEmpty {
                for artist in artistResults {
                    popup.show(title: "Found it!", message: "Found artist with id: \(artist.id) \nname: \(artist.name)")
                    print("Present \(artist.name)")
                }
            } else {
                popup.show(title: "No Match", message: "No artist found matching the query.")
                print("No matching artist found")
            }
        } else {
            popup.show(title: "Error", message: "Search query is empty.")
            print("Search query is empty")
        }
    }
    
    @objc func searchForAlbumButtonTapped() {
        if let query = searchAlbum.text, !query.isEmpty {
            let albumResults = albums.filter { $0.title.contains(query) }
            if !albumResults.isEmpty {
                for album in albumResults {
                    popup.show(title: "Found it!", message: "Found album with id: \(album.id) \ntitle: \(album.title) \nartist id: \(album.artist_id) \nrelease date: \(album.release_date) \n")
                    print("Present \(album.title)")
                }
            }   else {
                    popup.show(title: "No Match", message: "No albums found matching the query.")
                    print("No matching albums found")
                }
        } else {
            popup.show(title: "Error", message: "Search query is empty.")
            print("Search query is empty")
        }
    }
    
    @objc func searchForSongButtonTapped() {
        if let query = searchSong.text, !query.isEmpty {
            print (query)
            let songResults = songs.filter { $0.title.contains(query) }
            if !songResults.isEmpty {
                for song in songResults {
                    popup.show(title: "Found it!", message: "Found song with id: \(song.id) \ntitle: \(song.title) \nartist id: \(song.artist_id) \nalbum id: \(song.album_id) \ngenre id: \(song.genre_id) \nduration: \(song.duration) \nis it a favorite: \(song.favorite)")
                    print("Present \(song.title)")
                }
            } else {
                popup.show(title: "No Match", message: "No songs found matching the query.")
                print("No matching song found")
            }
        } else {
            popup.show(title: "Error", message: "Search query is empty.")
            print("Search query is empty")
        }
    }
    
    @objc func searchForGenreButtonTapped() {
        if let query = searchGenre.text, !query.isEmpty {
            print (query)
            let genreResults = genres.filter { $0.name.contains(query) }
            if !genreResults.isEmpty {
                for genre in genreResults {
                    popup.show(title: "Found it!", message: "Found genre with id: \(genre.id) \nname \(genre.name) \n")
                    print("Present \(genre.name)")
                }
            } else {
                popup.show(title: "No Match", message: "No genre found matching the query.")
                print("No matching genre found")
            }
        }else {
            popup.show(title: "Error", message: "Search query is empty.")
            print("Search query is empty")
        }
    }
    
    @objc func backButtonTapped() {
        self.isHidden = true
    }
}


class ArtistView: UIView {
    var heading: UILabel!
    var addArtist: UIButton!
    var updateArtist: UIButton!
    var deleteArtist: UIButton!
    var displayArtist: UIButton!
    
    var backButton: UIButton!
    
    var addArtistView: AddArtistView?
    var updateArtistView: UpdateArtistView?
    var deleteArtistView: DeleteArtistView?
    var displayArtistView: DisplayArtistView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heading = UILabel(frame: CGRect(x: 140, y: 50, width: frame.width - 40, height: 50))
        heading.textColor = .black
        heading.font = UIFont.boldSystemFont(ofSize: 20)
        heading.text = "ARTIST VIEW"
        addSubview(heading)
        
        addArtist = UIButton.styledButton(frame: CGRect(x: 20, y: 100, width: frame.width - 40, height: 50), title: "Add artist")
        addArtist.addTarget(self, action: #selector(addArtistAction), for: .touchUpInside)
        
        updateArtist = UIButton.styledButton(frame: CGRect(x: 20, y: 200, width: frame.width - 40, height: 50), title: "Update artist")
        updateArtist.addTarget(self, action: #selector(updateArtistAction), for: .touchUpInside)
        
        deleteArtist = UIButton.styledButton(frame: CGRect(x: 20, y: 300, width: frame.width - 40, height: 50), title: "Delete artist")
        deleteArtist.addTarget(self, action: #selector(deleteArtistAction), for: .touchUpInside)
        
        displayArtist = UIButton.styledButton(frame: CGRect(x: 20, y: 400, width: frame.width - 40, height: 50), title: "Display artist")
        displayArtist.addTarget(self, action: #selector(displayArtistAction), for: .touchUpInside)
        
        backButton = UIButton.styledButton(frame: CGRect(x: 20, y: 500, width: frame.width - 40, height: 50), title: "Back to main menu")
        backButton.addTarget(self, action: #selector(backToMainMenu), for: .touchUpInside)
        
        addSubview(addArtist)
        addSubview(updateArtist)
        addSubview(deleteArtist)
        addSubview(displayArtist)
        addSubview(backButton)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addArtistAction() {
        addArtistView = AddArtistView(frame: UIScreen.main.bounds)
        addArtistView?.backgroundColor = .white
        addSubview(addArtistView!)
        print("Add artist action")
        }
        
        @objc private func updateArtistAction() {
            print("Update artist action")
            updateArtistView = UpdateArtistView(frame: UIScreen.main.bounds)
            updateArtistView?.backgroundColor = .white
            addSubview(updateArtistView!)
        }
        
        @objc private func deleteArtistAction() {
            print("Delete artist action")
            deleteArtistView = DeleteArtistView(frame: UIScreen.main.bounds)
            deleteArtistView?.backgroundColor = .white
            addSubview(deleteArtistView!)
        }
        
        @objc private func displayArtistAction() {
            print("Display artist action")
            displayArtistView = DisplayArtistView(frame: UIScreen.main.bounds)
            displayArtistView?.backgroundColor = .white
            addSubview(displayArtistView!)
        }
    
    @objc private func backToMainMenu() {
        print("Back to main menu")
        self.isHidden = true
    }
    
}

class Artist {
    var id: Int
    var name: String
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
}

class ArtistManager {
    let popup = PopupView()
    
    func addArtist(id: Int, name: String) {
        if artists.contains(where: { $0.id == id }) {
                print("An artist with ID \(id) already exists.")
            popup.show(title: "Error", message: "An artist with ID \(id) already exists.")
                return
            }
        let newArtist = Artist(id: id, name: name)
        artists.append(newArtist)
        print("Artist created: \(newArtist.name) and \(newArtist.id)" )
        popup.show(title: "Confirmation", message: "Artist created: \(newArtist.name) and \(newArtist.id)")
        print(artists.count)
    }
    
    func updateArtist(id: Int, newName: String) {
        if let index = artists.firstIndex(where: { $0.id == id }) {
            artists[index].name = newName
            print("Artist updated: \(artists[index].name)")
            popup.show(title: "Confirmation", message: "Artist updated: \(artists[index].name)")
        } else {
            print("Artist with ID \(id) not found.")
            popup.show(title: "Error", message: "An artist with ID \(id) not found.")
        }
    }
    
    func deleteArtist(id: Int) {
        guard let index = artists.firstIndex(where: { $0.id == id }) else {
            print("Artist with ID \(id) not found.")
            popup.show(title: "Error", message: "Artist with ID \(id) not found.")
            return
        }
        
    // Check if any album references the artist
            if albums.contains(where: { $0.artist_id == id }) {
                print("Cannot delete artist with associated albums.")
                popup.show(title: "Error", message: "Cannot delete artist with associated albums.")
                return
            }
    
    artists.remove(at: index)
            print("Artist deleted.")
        popup.show(title: "Confirmation", message: "Artist deleted")
    }
    
    func viewAllArtists() -> [Artist] {
        return artists
    }
    
    // Additional methods as needed
}


class AddArtistView: UIView {
    // Text fields
    let textField1 = UITextField()
    let textField2 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the artist id"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 2
        textField2.placeholder = "Enter artist name"
        textField2.borderStyle = .roundedRect
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(textField1)
        addSubview(textField2)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    textField2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    submitButton.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
                    submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        let popup = PopupView()
        print("Submit button tapped")
        let manageArtist = ArtistManager();
        if let idText = textField1.text, !idText.isEmpty,
           let nameText = textField2.text, !nameText.isEmpty {
            
            // Attempt to convert idText to Int
            if let id = Int(idText) {
                // Conversion succeeded, add the artist
                manageArtist.addArtist(id: id, name: nameText)
            } else {
                // Conversion failed for idText
                popup.show(title: "Error", message: "Invalid input type for id")
            }
            
        } else {
            // One or both fields are empty
            popup.show(title: "Error", message: "Both fields should have a value to create an artist")
            print("Both fields should have a value")
        }

    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}

class UpdateArtistView: UIView {
    // Text fields
    let textField1 = UITextField()
    let textField2 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the artist id"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 2
        textField2.placeholder = "Enter artist new name"
        textField2.borderStyle = .roundedRect
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(textField1)
        addSubview(textField2)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    textField2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    submitButton.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
                    submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let popUp = PopupView()
        let manageArtist = ArtistManager();
        if let idText = textField1.text, !idText.isEmpty,
           let nameText = textField2.text, !nameText.isEmpty {
            if let id = Int(idText) {
                manageArtist.updateArtist(id: id, newName: nameText)
            } else {
                popUp.show(title: "Error", message: "Invalid input type for id")
            }
        } else {
            popUp.show(title: "Error", message: "Both the field must have a value/ artist could not be updated")
            print("Both the field should have a value")
        }
    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}

class DeleteArtistView: UIView {
    // Text fields
    let textField1 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the artist id you want to delete"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(textField1)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    
                    submitButton.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let popup = PopupView()
        let manageArtist = ArtistManager();
        if let idText = textField1.text, !idText.isEmpty {
            if let id = Int(idText) {
                manageArtist.deleteArtist(id: id)
            } else {
                popup.show(title: "Error", message: "Invalid input type for id")
            }
        } else {
            print("Both the field should have a value")
                popup.show(title: "Error", message: "The field cant be empty")
        }
    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}


class DisplayArtistView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    // Table view
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    back button
       let backButton = UIButton(type: .system)
    // MARK: - Private Methods
    
    private func setupTableView() {
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        addSubview(tableView)
        addSubview(backButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            
            backButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = artists[indexPath.row]
        cell.textLabel?.text = " Id: \(item.id), Name: \(item.name)"
        return cell
    }
    
    @objc private func backButtonTapped() {
        self.isHidden = true
    }
}

    
    

class Album {
    var id: Int
    var artist_id: Int
    var title: String
    var release_date: String
    
    var artist: Artist?
    
    init(id: Int, artist_id: Int, title: String, release_date: String) {
        self.id = id
        self.artist_id = artist_id
        self.title = title
        self.release_date = release_date
    }
}

class AlbumManager {
    let popup = PopupView()
    // Add a new album
        func addAlbum(id: Int, artistId: Int, title: String, releaseDate: String) {
            // Check if the artist exists
            guard let _ = artists.first(where: { $0.id == artistId }) else {
                print("Artist with ID \(artistId) not found.")
                popup.show(title: "Error", message:"Artist with ID \(artistId) not found.")
                return
            }
            
            if albums.contains(where: { $0.id == id }) {
                    print("An Album with ID \(id) already exists.")
                popup.show(title: "Error", message: "An album with ID \(id) already exists.")
                    return
                }
            
            let newAlbum = Album(id: id, artist_id: artistId, title: title, release_date: releaseDate)
            albums.append(newAlbum)
            print("Album added: \(newAlbum.title)")
            popup.show(title: "Confirmation", message: "Album added: \(newAlbum.title)")
        }
    
    func updateAlbum(id: Int, title: String, releaseDate: String) {
            if let index = albums.firstIndex(where: { $0.id == id }) {
                albums[index].title = title
                albums[index].release_date = releaseDate
                print("Album updated: \(albums[index].title)")
                popup.show(title: "Confirmation", message: "Album updated: \(albums[index].title)")
            } else {
                print("Album with ID \(id) not found.")
                popup.show(title: "Error", message: "Album with ID \(id) not found.")
            }
        }
    
    func deleteAlbum(id: Int) {
            guard let index = albums.firstIndex(where: { $0.id == id }) else {
                print("Album with ID \(id) not found.")
                popup.show(title: "Error", message: "Album with ID \(id) not found.")
                return
            }
            
        // Check if any song references the album
                if songs.contains(where: { $0.album_id == id }) {
                    print("Cannot delete album with associated songs.")
                    popup.show(title: "Error", message: "Cannot delete album with associated songs.")
                    return
                }
        
        albums.remove(at: index)
                print("Album deleted.")
        popup.show(title: "Confirmation", message: "Album deleted")
        }
    
    func viewAllAlbums() -> [Album] {
        return albums
    }
    
    // Additional methods as needed
}

class AlbumView: UIView {
    var heading: UILabel!
    var addAlbum: UIButton!
    var updateAlbum: UIButton!
    var deleteAlbum: UIButton!
    var displayAlbum: UIButton!
    
    var backButton: UIButton!
    
    
    var addAlbumView: AddAlbumView?
    var updateAlbumView: UpdateAlbumView?
    var deleteAlbumView: DeleteAlbumView?
    var displayAlbumView: DisplayAlbumView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heading = UILabel(frame: CGRect(x: 140, y: 50, width: frame.width - 40, height: 50))
        heading.textColor = .black
        heading.font = UIFont.boldSystemFont(ofSize: 20)
        heading.text = "ALBUM VIEW"
        addSubview(heading)
        addAlbum = UIButton.styledButton(frame: CGRect(x: 20, y: 100, width: frame.width - 40, height: 50), title: "Add album")
        addAlbum.addTarget(self, action: #selector(addAlbumAction), for: .touchUpInside)
        
        updateAlbum = UIButton.styledButton(frame: CGRect(x: 20, y: 200, width: frame.width - 40, height: 50), title: "Update album")
        updateAlbum.addTarget(self, action: #selector(updateAlbumAction), for: .touchUpInside)
        
        deleteAlbum = UIButton.styledButton(frame: CGRect(x: 20, y: 300, width: frame.width - 40, height: 50), title: "Delete album")
        deleteAlbum.addTarget(self, action: #selector(deleteAlbumAction), for: .touchUpInside)
        
        displayAlbum = UIButton.styledButton(frame: CGRect(x: 20, y: 400, width: frame.width - 40, height: 50), title: "Display album")
        displayAlbum.addTarget(self, action: #selector(displayAlbumAction), for: .touchUpInside)
        
        backButton = UIButton.styledButton(frame: CGRect(x: 20, y: 500, width: frame.width - 40, height: 50), title: "Back to main menu")
        backButton.addTarget(self, action: #selector(backToMainMenu), for: .touchUpInside)
        
        addSubview(addAlbum)
        addSubview(updateAlbum)
        addSubview(deleteAlbum)
        addSubview(displayAlbum)
        addSubview(backButton)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addAlbumAction() {
            print("Add album action")
        addAlbumView = AddAlbumView(frame: UIScreen.main.bounds)
        addAlbumView?.backgroundColor = .white
        addSubview(addAlbumView!)
        }
        
    @objc private func updateAlbumAction() {
            print("Update album action")
        updateAlbumView = UpdateAlbumView(frame: UIScreen.main.bounds)
        updateAlbumView?.backgroundColor = .white
        addSubview(updateAlbumView!)
        }
        
        @objc private func deleteAlbumAction() {
            print("Delete album action")
            deleteAlbumView = DeleteAlbumView(frame: UIScreen.main.bounds)
            deleteAlbumView?.backgroundColor = .white
            addSubview(deleteAlbumView!)
        }
        
        @objc private func displayAlbumAction() {
            print("Display album action")
            displayAlbumView = DisplayAlbumView(frame: UIScreen.main.bounds)
            displayAlbumView?.backgroundColor = .white
            addSubview(displayAlbumView!)
        }
    
    @objc private func backToMainMenu() {
        print("Back to main menu")
        self.isHidden = true
    }
}

class AddAlbumView: UIView {
    // Text fields
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    let textField4 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the album id"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 2
        textField2.placeholder = "Enter artist id"
        textField2.borderStyle = .roundedRect
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 3
        textField3.placeholder = "Enter title"
        textField3.borderStyle = .roundedRect
        textField3.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 4
        textField4.placeholder = "Enter release date"
        textField4.borderStyle = .roundedRect
        textField4.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        
        // Add subviews
        addSubview(textField1)
        addSubview(textField2)
        addSubview(textField3)
        addSubview(textField4)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    textField2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
                    textField3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField4.topAnchor.constraint(equalTo: textField3.bottomAnchor, constant: 20),
                    textField4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    submitButton.topAnchor.constraint(equalTo: textField4.bottomAnchor, constant: 20),
                    submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    submitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let popup = PopupView()
        let manageAlbum = AlbumManager();
        if let idText = textField1.text, !idText.isEmpty,
           let artistIdText = textField2.text, !artistIdText.isEmpty,
           let titleText = textField3.text, !titleText.isEmpty,
           let releaseDateText = textField4.text, !releaseDateText.isEmpty {
            
            // Validate and convert to appropriate types
            if let id = Int(idText),
               let artistId = Int(artistIdText) {
                
                // All conversions succeeded and fields are not empty
                manageAlbum.addAlbum(id: id, artistId: artistId, title: titleText, releaseDate: releaseDateText)
                
            } else {
                // Conversion failed for id or artistId
                print("Invalid input format for id or artistId")
                popup.show(title: "Error", message: "Invalid input format for id or artistId")
            }
            
        } else {
            // One or more fields are empty
            print("All fields should have a value")
            popup.show(title: "Error", message: "All fields should have a value")
        }

    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}

class UpdateAlbumView: UIView {
    // Text fields
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the album id"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 2
        textField2.placeholder = "Enter album new name"
        textField2.borderStyle = .roundedRect
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 2
        textField3.placeholder = "Enter album new release date"
        textField3.borderStyle = .roundedRect
        textField3.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(textField1)
        addSubview(textField2)
        addSubview(textField3)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    textField2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
                    textField3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    submitButton.topAnchor.constraint(equalTo: textField3.bottomAnchor, constant: 20),
                    submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let popup = PopupView()
        let manageAlbum = AlbumManager();
        if let idText = textField1.text, !idText.isEmpty,
           let titleText = textField2.text, !titleText.isEmpty,
           let releaseDateText = textField3.text, !releaseDateText.isEmpty {
            
            // Validate and convert to appropriate types
            if let id = Int(idText) {
                
                // All conversions succeeded and fields are not empty
                manageAlbum.updateAlbum(id: id, title: titleText, releaseDate: releaseDateText)
                
            } else {
                // Conversion failed for id
                print("Invalid input format for id")
                popup.show(title: "Error", message: "Invalid input format for id")
            }
            
        } else {
            // One or more fields are empty
            print("All fields should have a value")
            popup.show(title: "Error", message: "All fields should have a value")
        }

    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}

class DeleteAlbumView: UIView {
    // Text fields
    let textField1 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the album id you want to delete"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(textField1)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    
                    submitButton.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let popup = PopupView()
        let manageAlbum = AlbumManager();
        if let idText = textField1.text, !idText.isEmpty {
            if let id = Int(idText) {
                manageAlbum.deleteAlbum(id: id)
            } else {
                popup.show(title: "Eror", message: "Invalid input type for id")
            }
        } else {
            print("The field should have a value")
            popup.show(title: "Error", message: "The field should have a value")
        }
    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}


class DisplayAlbumView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    // Table view
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initialization
    let backButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        addSubview(tableView)
        addSubview(backButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            
            backButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = albums[indexPath.row]
        cell.textLabel?.text = "Id: \(item.id)\nArtist Id: \(item.artist_id)\nTitle: \(item.title)\nRelease date: \(item.release_date)"
        cell.textLabel?.numberOfLines = 0 // Allow multiple lines
        return cell
    }
    
    @objc private func backButtonTapped() {
        self.isHidden = true
    }
}




class Song {
    var id: Int
    var artist_id: Int
    var album_id: Int
    var genre_id: Int
    var title: String
    var duration: Double
    var favorite: Bool
    
    var artist: Artist?
    var album: Album?
    var genre: Genre?
    init(id: Int, artist_id: Int, album_id: Int, genre_id: Int, title: String, duration: Double, favorite: Bool) {
        self.id = id
        self.artist_id = artist_id
        self.album_id = album_id
        self.genre_id = genre_id
        self.title = title
        self.duration = duration
        self.favorite = favorite
    }
}


class SongManager {
    
    let popup = PopupView()
    
    // Add a new song
    func addSong(id: Int, artist_id: Int, album_id: Int, genre_id: Int, title: String, duration: Double, favorite: Bool) {
            // Check if the artist exists
            guard let _ = artists.first(where: { $0.id == artist_id }) else {
                print("Artist with ID \(artist_id) not found.")
                popup.show(title: "Error", message: "Artist with ID \(artist_id) not found.")
                return
            }
            
            // Check if the album exists
            guard let _ = albums.first(where: { $0.id == album_id }) else {
                print("Album with ID \(album_id) not found.")
                popup.show(title: "Error", message: "Album with ID \(album_id) not found.")
                return
            }
            
            // Check if the genre exists
            guard let _ = genres.first(where: { $0.id == genre_id }) else {
                print("Genre with ID \(genre_id) not found.")
                popup.show(title: "Error", message: "Genre with ID \(genre_id) not found.")
                return
            }
        
        if songs.contains(where: { $0.id == id }) {
                print("A song with ID \(id) already exists.")
            popup.show(title: "Error", message: "A song with ID \(id) already exists.")
                return
            }
            
            let newSong = Song(id: id, artist_id: artist_id,  album_id: album_id, genre_id: genre_id, title: title, duration: duration, favorite: favorite)
            songs.append(newSong)
            print("Song added: \(newSong.title)")
        popup.show(title: "Confirmation", message: "Song added: \(newSong.title)")
        }
    
    // Update a song's title, duration, and favorite fields
    func updateSong(id: Int, title: String, duration: Double, favorite: Bool) {
        if let index = songs.firstIndex(where: { $0.id == id }) {
            songs[index].title = title
            songs[index].duration = duration
            songs[index].favorite = favorite
            print("Song updated: \(songs[index].title)")
            popup.show(title: "Confirmation", message: "Song updated: \(songs[index].title)")
        } else {
            print("Song with ID \(id) not found.")
            popup.show(title: "Error", message: "Song with ID \(id) not found.")
        }
    }
    
    // Delete a song
    func deleteSong(id: Int) {
        if let index = songs.firstIndex(where: { $0.id == id }) {
            songs.remove(at: index)
            print("Song deleted.")
            popup.show(title: "Confirmation", message: "Song deleted.")
        } else {
            print("Song with ID \(id) not found.")
            popup.show(title: "Error", message: "Song with ID \(id) not found.")
        }
    }
    
    // View all songs
    func viewAllSongs() {
        print("All Songs:")
        for song in songs {
            print("ID: \(song.id), Album ID: \(song.album_id), Artist ID: \(song.artist_id), Genre ID: \(song.genre_id), Title: \(song.title), Duration: \(song.duration), Favorite: \(song.favorite ? "Yes" : "No")")
        }
    }
}

class SongView: UIView {
    var heading: UILabel!
    var addSong: UIButton!
    var updateSong: UIButton!
    var deleteSong: UIButton!
    var displaySong: UIButton!
    
    var backButton: UIButton!
    
    var addSongView: AddSongView?
    var updateSongView: UpdateSongView?
    var deleteSongView: DeleteSongView?
    var displaySongView: DisplaySongView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heading = UILabel(frame: CGRect(x: 140, y: 50, width: frame.width - 40, height: 50))
        heading.textColor = .black
        heading.font = UIFont.boldSystemFont(ofSize: 20)
        heading.text = "SONG VIEW"
        addSubview(heading)
        addSong = UIButton.styledButton(frame: CGRect(x: 20, y: 100, width: frame.width - 40, height: 50), title: "Add song")
        addSong.addTarget(self, action: #selector(addSongAction), for: .touchUpInside)
        
        updateSong = UIButton.styledButton(frame: CGRect(x: 20, y: 200, width: frame.width - 40, height: 50), title: "Update song")
        updateSong.addTarget(self, action: #selector(updateSongAction), for: .touchUpInside)
        
        deleteSong = UIButton.styledButton(frame: CGRect(x: 20, y: 300, width: frame.width - 40, height: 50), title: "Delete song")
        deleteSong.addTarget(self, action: #selector(deleteSongAction), for: .touchUpInside)
        
        displaySong = UIButton.styledButton(frame: CGRect(x: 20, y: 400, width: frame.width - 40, height: 50), title: "Display song")
        displaySong.addTarget(self, action: #selector(displaySongAction), for: .touchUpInside)
        
        backButton = UIButton.styledButton(frame: CGRect(x: 20, y: 500, width: frame.width - 40, height: 50), title: "Back to main menu")
        backButton.addTarget(self, action: #selector(backToMainMenu), for: .touchUpInside)
        
        addSubview(addSong)
        addSubview(updateSong)
        addSubview(deleteSong)
        addSubview(displaySong)
        addSubview(backButton)
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addSongAction() {
            print("Add song action")
        addSongView = AddSongView(frame: UIScreen.main.bounds)
        addSongView?.backgroundColor = .white
        addSubview(addSongView!)
        
        }
        
    @objc private func updateSongAction() {
            print("Update song action")
        updateSongView = UpdateSongView(frame: UIScreen.main.bounds)
        updateSongView?.backgroundColor = .white
        addSubview(updateSongView!)
        }
        
        @objc private func deleteSongAction() {
            print("Delete song action")
            deleteSongView = DeleteSongView(frame: UIScreen.main.bounds)
            deleteSongView?.backgroundColor = .white
            addSubview(deleteSongView!)
        }
        
        @objc private func displaySongAction() {
            print("Display song action")
            displaySongView = DisplaySongView(frame: UIScreen.main.bounds)
            displaySongView?.backgroundColor = .white
            addSubview(displaySongView!)
        }
    
    @objc private func backToMainMenu() {
        print("Back to main menu")
        self.isHidden = true
    }
    
}

class AddSongView: UIView {
    // Text fields
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    let textField4 = UITextField()
    let textField5 = UITextField()
    let textField6 = UITextField()
    let textField7 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the song id"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 2
        textField2.placeholder = "Enter artist id"
        textField2.borderStyle = .roundedRect
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 3
        textField3.placeholder = "Enter album id"
        textField3.borderStyle = .roundedRect
        textField3.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 4
        textField4.placeholder = "Enter genre id"
        textField4.borderStyle = .roundedRect
        textField4.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 5
        textField5.placeholder = "Enter title"
        textField5.borderStyle = .roundedRect
        textField5.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 6
        textField6.placeholder = "Enter duration"
        textField6.borderStyle = .roundedRect
        textField6.translatesAutoresizingMaskIntoConstraints = false
    
        // Configure text field 7
        textField7.placeholder = "Enter favorite"
        textField7.borderStyle = .roundedRect
        textField7.translatesAutoresizingMaskIntoConstraints = false
        // Assuming textField is your UITextField instance
        textField7.autocapitalizationType = .none

        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        
        // Add subviews
        addSubview(textField1)
        addSubview(textField2)
        addSubview(textField3)
        addSubview(textField4)
        addSubview(textField5)
        addSubview(textField6)
        addSubview(textField7)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    textField2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
                    textField3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField4.topAnchor.constraint(equalTo: textField3.bottomAnchor, constant: 20),
                    textField4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField5.topAnchor.constraint(equalTo: textField4.bottomAnchor, constant: 20),
                    textField5.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField5.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField6.topAnchor.constraint(equalTo: textField5.bottomAnchor, constant: 20),
                    textField6.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField6.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField7.topAnchor.constraint(equalTo: textField6.bottomAnchor, constant: 20),
                    textField7.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField7.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    submitButton.topAnchor.constraint(equalTo: textField7.bottomAnchor, constant: 20),
                    submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    submitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let popup = PopupView()
        let manageSong = SongManager();
        
        if let idText = textField1.text, !idText.isEmpty,
           let artistIdText = textField2.text, !artistIdText.isEmpty,
           let albumIdText = textField3.text, !albumIdText.isEmpty,
           let genreIdText = textField4.text, !genreIdText.isEmpty,
           let titleText = textField5.text, !titleText.isEmpty,
           let durationText = textField6.text, !durationText.isEmpty,
           let favoriteText = textField7.text, !favoriteText.isEmpty {
            
            // Validate and convert to appropriate types
            if let id = Int(idText),
               let artistId = Int(artistIdText),
               let albumId = Int(albumIdText),
               let genreId = Int(genreIdText),
               let duration = Double(durationText),
               let favorite = Bool(favoriteText) {
                
                // All conversions succeeded and fields are not empty
                manageSong.addSong(id: id, artist_id: artistId, album_id: albumId, genre_id: genreId, title: titleText, duration: duration, favorite: favorite)
                
            } else {
                // Conversion failed for Double or Bool
                print("Invalid input format for duration or favorite")
                popup.show(title: "Error", message: "Invalid input format for duration or favorite")
            }
            
        } else {
            // One or more fields are empty
            print("All fields should have a value")
            popup.show(title: "Error", message: "All fields should have a value")
        }

    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}

class UpdateSongView: UIView {
    // Text fields
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    let textField4 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the song id"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 2
        textField2.placeholder = "Enter song new title"
        textField2.borderStyle = .roundedRect
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 3
        textField3.placeholder = "Enter song new duration"
        textField3.borderStyle = .roundedRect
        textField3.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 4
        textField4.placeholder = "Enter if song is favorite or not(true/false)"
        textField4.borderStyle = .roundedRect
        textField4.translatesAutoresizingMaskIntoConstraints = false
        textField4.autocapitalizationType = .none
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(textField1)
        addSubview(textField2)
        addSubview(textField3)
        addSubview(textField4)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    textField2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField3.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
                    textField3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField4.topAnchor.constraint(equalTo: textField3.bottomAnchor, constant: 20),
                    textField4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    submitButton.topAnchor.constraint(equalTo: textField4.bottomAnchor, constant: 20),
                    submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let popup = PopupView()
        let manageSong = SongManager();
        if let idText = textField1.text, !idText.isEmpty,
           let titleText = textField2.text, !titleText.isEmpty,
           let durationText = textField3.text, !durationText.isEmpty,
           let favortieText = textField4.text, !favortieText.isEmpty {
            
            // Validate and convert to appropriate types
            if let id = Int(idText),
               let duration = Double(durationText),
               let favorite = Bool(favortieText) {
                
                // All conversions succeeded and fields are not empty
                manageSong.updateSong(id: id, title: titleText, duration: duration, favorite: favorite)
                
            } else {
                // Conversion failed for Double or Bool
                print("Invalid input format for duration or favorite")
                popup.show(title: "Error", message: "Invalid input format for duration or favorite")
            }
            
        } else {
            // One or more fields are empty
            print("All fields should have a value")
            popup.show(title: "Error", message: "All fields should have a value")
        }

    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}

class DeleteSongView: UIView {
    // Text fields
    let textField1 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the song id you want to delete"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(textField1)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    
                    submitButton.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let manageSong = SongManager();
        let popup = PopupView()
        if let idText = textField1.text, !idText.isEmpty {
            if let id = Int(idText) {
                manageSong.deleteSong(id: id)
            }else {
                // Conversion failed for Double or Bool
                print("Invalid input format for id")
                popup.show(title: "Error", message: "Invalid input format for id")
            }
        } else {
            print("Both the field should have a value")
            popup.show(title: "Error", message: "The field should have a value")
        }
    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}


class DisplaySongView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    // Table view
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initialization
    let backButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        addSubview(tableView)
        addSubview(backButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            
            backButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = songs[indexPath.row]
        cell.textLabel?.text = "Id: \(item.id)\nArtist Id: \(item.artist_id)\nTitle: \(item.title)\nAlbum Id: \(item.album_id)\nGenre Id: \(item.genre_id)\nDuration: \(item.duration)\nFavorite?: \(item.favorite)"
        cell.textLabel?.numberOfLines = 0 // Allow multiple lines
        return cell
    }
    
    @objc private func backButtonTapped() {
        self.isHidden = true
    }
}


class Genre {
    var id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}


class GenreManager {
    
    let popup = PopupView()
    
    // Add a new genre
    func addGenre(id: Int, name: String) {
        if genres.contains(where: { $0.id == id }) {
                print("A genre with ID \(id) already exists.")
            popup.show(title: "Error", message: "A genre with ID \(id) already exists.")
                return
            }
        let newGenre = Genre(id: id, name: name)
        genres.append(newGenre)
        print("Genre added: \(newGenre.name)")
        popup.show(title: "Confirmation", message: "Genre added: \(newGenre.name)")
    }
    
    // Update a genre's name
    func updateGenre(id: Int, name: String) {
        if let index = genres.firstIndex(where: { $0.id == id }) {
            genres[index].name = name
            print("Genre updated: \(genres[index].name)")
            popup.show(title: "Confirmation", message: "Genre updated: \(genres[index].name)")
        } else {
            print("Genre with ID \(id) not found.")
            popup.show(title: "Error", message: "Genre with ID \(id) not found.")
        }
    }
    
    // Delete a genre
    func deleteGenre(id: Int) {
        if let index = genres.firstIndex(where: { $0.id == id }) {
            // Check if any song references the genre
            if songs.contains(where: { $0.genre_id == id }) {
                print("Cannot delete genre with associated songs.")
                popup.show(title: "Error", message: "Cannot delete genre with associated songs.")
                return
            }
            
            genres.remove(at: index)
            print("Genre deleted.")
            popup.show(title: "Confirmation", message: "Genre deleted.")
        } else {
            print("Genre with ID \(id) not found.")
            popup.show(title: "Error", message: "Genre with ID \(id) not found.")
        }
    }
    
    // View all genres
    func viewAllGenres() {
        print("All Genres:")
        for genre in genres {
            print("ID: \(genre.id), Name: \(genre.name)")
        }
    }
}

class GenreView: UIView {
    var heading: UILabel!
    var addGenre: UIButton!
    var updateGenre: UIButton!
    var deleteGenre: UIButton!
    var displayGenre: UIButton!
    
    var backButton: UIButton!
    
    var addGenreView: AddGenreView?
    var updateGenreView: UpdateGenreView?
    var deleteGenreView: DeleteGenreView?
    var displayGenreView: DisplayGenreView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        heading = UILabel(frame: CGRect(x: 140, y: 50, width: frame.width - 40, height: 50))
        heading.textColor = .black
        heading.font = UIFont.boldSystemFont(ofSize: 20)
        heading.text = "GENRE VIEW"
        addSubview(heading)
        
        addGenre = UIButton.styledButton(frame: CGRect(x: 20, y: 100, width: frame.width - 40, height: 50), title: "Add genre")
        addGenre.addTarget(self, action: #selector(addGenreAction), for: .touchUpInside)
        
        updateGenre = UIButton.styledButton(frame: CGRect(x: 20, y: 200, width: frame.width - 40, height: 50), title: "Update genre")
        updateGenre.addTarget(self, action: #selector(updateGenreAction), for: .touchUpInside)
        
        deleteGenre = UIButton.styledButton(frame: CGRect(x: 20, y: 300, width: frame.width - 40, height: 50), title: "Delete genre")
        deleteGenre.addTarget(self, action: #selector(deleteGenreAction), for: .touchUpInside)
        
        displayGenre = UIButton.styledButton(frame: CGRect(x: 20, y: 400, width: frame.width - 40, height: 50), title: "Display genre")
        displayGenre.addTarget(self, action: #selector(displayGenreAction), for: .touchUpInside)
        
        backButton = UIButton.styledButton(frame: CGRect(x: 20, y: 500, width: frame.width - 40, height: 50), title: "Back to main menu")
        backButton.addTarget(self, action: #selector(backToMainMenu), for: .touchUpInside)
        
        addSubview(addGenre)
        addSubview(updateGenre)
        addSubview(deleteGenre)
        addSubview(displayGenre)
        addSubview(backButton)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addGenreAction() {
            print("Add genre action")
        addGenreView = AddGenreView(frame: UIScreen.main.bounds)
        addGenreView?.backgroundColor = .white
        addSubview(addGenreView!)
        }
        
    @objc private func updateGenreAction() {
            print("Update genre action")
        updateGenreView = UpdateGenreView(frame: UIScreen.main.bounds)
        updateGenreView?.backgroundColor = .white
        addSubview(updateGenreView!)
        }
        
        @objc private func deleteGenreAction() {
            print("Delete genre action")
            deleteGenreView = DeleteGenreView(frame: UIScreen.main.bounds)
            deleteGenreView?.backgroundColor = .white
            addSubview(deleteGenreView!)
        }
        
        @objc private func displayGenreAction() {
            print("Display genre action")
            displayGenreView = DisplayGenreView(frame: UIScreen.main.bounds)
            displayGenreView?.backgroundColor = .white
            addSubview(displayGenreView!)
        }
    
    @objc private func backToMainMenu() {
        print("Back to main menu")
        self.isHidden = true
    }
    
}

class AddGenreView: UIView {
    // Text fields
    let textField1 = UITextField()
    let textField2 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the genre id"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 2
        textField2.placeholder = "Enter genre name"
        textField2.borderStyle = .roundedRect
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(textField1)
        addSubview(textField2)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    textField2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    submitButton.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
                    submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let popup = PopupView()
        let manageGenre = GenreManager();
        if let idText = textField1.text, !idText.isEmpty, let nameText = textField2.text, !nameText.isEmpty {
            if let id = Int(idText) {
                manageGenre.addGenre(id:id, name: nameText) }
            else {
                popup.show(title: "Error", message: "Invalid type for id")
            }
        } else {
            print("Both the field should have a value")
            popup.show(title: "Error", message: "Both the field should have a value")
        }
    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}

class UpdateGenreView: UIView {
    // Text fields
    let textField1 = UITextField()
    let textField2 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the genre id"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure text field 2
        textField2.placeholder = "Enter genre new name"
        textField2.borderStyle = .roundedRect
        textField2.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(textField1)
        addSubview(textField2)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    textField2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    submitButton.topAnchor.constraint(equalTo: textField2.bottomAnchor, constant: 20),
                    submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let manageGenre = GenreManager();
        let popup = PopupView()
        if let idText = textField1.text, !idText.isEmpty, let nameText = textField2.text, !nameText.isEmpty {
            if let id = Int(idText) {
                manageGenre.updateGenre(id: id, name: nameText)
            } else {
                popup.show(title: "Error", message: "Invalid input format for id")
            }
        } else {
            print("Both the field should have a value")
            popup.show(title: "Error", message: "Both the field should have a value")
        }
    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}

class DeleteGenreView: UIView {
    // Text fields
    let textField1 = UITextField()
    
    // Submit button
    let submitButton = UIButton(type: .system)
    
//    back button
    let backButton = UIButton(type: .system)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
//        configure the back button
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configure text field 1
        textField1.placeholder = "Enter the genre id you want to delete"
        textField1.borderStyle = .roundedRect
        textField1.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure submit button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        // Add subviews
        addSubview(textField1)
        addSubview(submitButton)
        addSubview(backButton)
        
        
        // Set constraints
        NSLayoutConstraint.activate([
                    textField1.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                    textField1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                    textField1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                    
                    
                    submitButton.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
                    submitButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                    
                    backButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
                    backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func submitButtonTapped() {
        print("Submit button tapped")
        let manageGenre = GenreManager();
        let popup = PopupView()
        if let idText = textField1.text, !idText.isEmpty {
            if let id = Int(idText) {
                manageGenre.deleteGenre(id: id)
            } else {
                popup.show(title: "Error", message: "Invalid input for id")
            }
        } else {
            print("Both the field should have a value")
            popup.show(title: "Error", message: "The field should have a value")
        }
    }
    
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.isHidden = true
    }
}


class DisplayGenreView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    // Table view
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    back button
       let backButton = UIButton(type: .system)
    // MARK: - Private Methods
    
    private func setupTableView() {
        backButton.setTitle("Back", for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        addSubview(tableView)
        addSubview(backButton)
        
        // Set up constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            
            backButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            backButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = genres[indexPath.row]
        cell.textLabel?.text = "Id: \(item.id), Name: \(item.name)"
        return cell
    }
    
    @objc private func backButtonTapped() {
        self.isHidden = true
    }
}


class PopupView: UIView {
    
    let titleLabel = UILabel()
    
    let messageLabel = UILabel()
    
    let confirmButton = UIButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        confirmButton.setTitle("OK", for: .normal)
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        confirmButton.translatesAutoresizingMaskIntoConstraints = false

        
        backgroundColor = .white
        layer.cornerRadius = 10
        
        addSubview(titleLabel)
        addSubview(messageLabel)
        addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            confirmButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20),
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 100),
            confirmButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    func show(title: String, message: String) {
        self.titleLabel.text = title
        self.messageLabel.text = message
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let window = appDelegate.window!
        
        self.translatesAutoresizingMaskIntoConstraints = false
        window.addSubview(self)
        
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            self.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc private func confirmButtonTapped() {
        removeFromSuperview()
    }
}

//
//  Assignment5.swift
//  
//
//  Created by Anvitha Lakshmisha on 2/12/24.
//

import Foundation

// MARK: - User Class

class User {
    let email: String
    let password: String

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

// MARK: - Playlist Class

class Playlist {
    var name: String
    var songs: [Song]

    init(name: String, songs: [Song]) {
        self.name = name
        self.songs = songs
    }
}

// MARK: - Song Class

class Song {
    var title: String
    var genre: String
    var favorite: Bool
    var duration: Float
    var uploadedDate: Date

    init(title: String, genre: String, favorite: Bool, duration: Float, uploadedDate: Date) {
            self.title = title
            self.genre = genre
            self.favorite = favorite
            self.duration = duration
            self.uploadedDate = uploadedDate
        }}

// MARK: - All the song instances

let song1 = Song(title: "title1", genre: "pop", favorite: false, duration: 12.22, uploadedDate: Date())
let song2 = Song(title: "title2", genre: "rock", favorite: true, duration: 1.22, uploadedDate: Date())

let song3 = Song(title: "title3", genre: "rnb", favorite: false, duration: 4.22, uploadedDate: Date())

let song4 = Song(title: "title4", genre: "indie", favorite: true, duration: 5.22, uploadedDate: Date())

let song5 = Song(title: "title5", genre: "pop", favorite: false, duration: 2.22, uploadedDate: Date())
let song6 = Song(title: "title6", genre: "country", favorite: true, duration: 5.7, uploadedDate: Date())
let song7 = Song(title: "title7", genre: "country", favorite: false, duration: 22, uploadedDate: Date())

// MARK: - All the playlist instances
let playlist1 = Playlist(name: "pop", songs: [song1, song2])

let playlist2 = Playlist(name: "rock", songs: [song3, song4])

let playlist3 = Playlist(name: "travel", songs: [song5, song6, song7])

// MARK: - Main Menu

enum MainMenuOption: Int {
    case login = 1
    case quit

    static func allOptions() -> [MainMenuOption] {
        return [.login, .quit]
    }
}

// MARK: - Manage Playlist Menu

enum ManagePlaylistOption: Int {
    case display = 1
    case create
    case update
    case delete
    case select
    case logout

    static func allOptions() -> [ManagePlaylistOption] {
        return [.display, .create, .update, .delete, .select, .logout]
    }
}

// MARK: - Manage Song Menu

enum ManageSongOption: Int {
    case add = 1
    case update
    case delete
    case select
    case back
    case logout

    static func allOptions() -> [ManageSongOption] {
        return [.add, .update, .delete, .select, .back, .logout]
    }
}

enum ManageIndividualSongOption: Int {
    case display = 1
    case update
    case delete
    case add
    case back
    case logout

    static func allOptions() -> [ManageIndividualSongOption] {
        return [.display, .update, .delete, .add, .back, .logout]
    }
}

// MARK: - Helper Functions

func getUserInput(prompt: String) -> String {
    print(prompt, terminator: "")
    return readLine() ?? ""
}

func login(users: [User]) -> User? {
    let email = getUserInput(prompt: "Enter your email: ")
    let password = getUserInput(prompt: "Enter your password: ")

    if let user = users.first(where: { $0.email == email && $0.password == password }) {
        print("Login successful!")
        return user
    } else {
        print("Invalid email or password.")
        return nil
    }
}

func findPlaylist(byName name: String) -> Playlist? {
    return playlists.first(where: { $0.name == name })
}

func findSong(byName name: String) -> Song? {
    return allSongs.first(where: { $0.title == name })
}

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"

let users = [
    User(email: "user1@example.com", password: "password1"),
    User(email: "user2@example.com", password: "password2")
]

// MARK: - global variables to handle the program execution

var currentUser: User? = nil
var playlists: [Playlist] = [playlist1, playlist2, playlist3]
var allSongs: [Song] = [song1, song2, song3, song4, song5, song6, song7]
var currentPlaylist: Playlist? = nil
var currentSong: Song? = nil

// MARK: - Main Program

while true {
//    MARK: - the conditions which determines what options to show to the user
    if currentUser == nil {
        print("Main Menu:")
        print("1. Login")
        print("2. Quit")
    } else if( currentPlaylist != nil && currentSong == nil) {
        print("Manage Songs in playlist:")
        print("1. Add song")
        print("2. Update song in playlist")
        print("3. Delete song in playlist")
        print("4. Select a song in playlist")
        print("5. Go back to main options")
        print("6. Logout")
    } else if(currentSong != nil && currentPlaylist != nil) {
        print("Manage a Song:")
        print("1. Display all info of song")
        print("2. Update any info")
        print("3. Delete any info")
        print("4. Add any info")
        print("5. Go back to playlists")
        print("6. Logout")
    }
    else {
        print("Manage Playlist:")
        print("1. Display Playlist")
        print("2. Create Playlist")
        print("3. Update Playlist")
        print("4. Delete Playlist")
        print("5. Select Playlist")
        print("6. Logout")
    }
    
//    MARK: - this is for login

    if let choice = Int(getUserInput(prompt: "Enter your choice: ")) {
        if currentUser == nil {
            guard let option = MainMenuOption(rawValue: choice) else {
                print("Invalid input. Please enter a number corresponding to the options.")
                continue
            }

            switch option {
            case .login:
                if currentUser == nil {
                    currentUser = login(users: users)
                } else {
                    print("Already logged in as \(currentUser!.email).")
                }
            case .quit:
                print("Exiting...")
                exit(0)
            }
        } else if currentPlaylist == nil {
            guard let option = ManagePlaylistOption(rawValue: choice) else {
                print("Invalid input. Please enter a number corresponding to the options.")
                continue
            }
            
//            MARK: - this is when the user is logged in

            switch option {
            case .display:
                print("Display Playlist:")
                // display playlist functionality
                for pl in playlists {
                    print(pl.name)
                }
                //                MARK: - Create playlist options
            case .create:
                print("Create Playlist:")
                // create playlist functionality
                let newPlayListName = String(getUserInput(prompt: "Enter playlist name: "))
                playlists.append(Playlist(name: newPlayListName, songs: []))
                print("Playlist \(newPlayListName) created successfully.")
                //                MARK: - Update playlist name options
            case .update:
                print("Update Playlist:")
                // update playlist functionality
                let updatePlaylistName = String(getUserInput(prompt: "Enter playlist name you want to update: "))
                let newUpdatePlaylist = String(getUserInput(prompt: "Enter playlist name you want to update it to: "))
                func updatePlaylist(currentName: String, newName: String) {
                    for playlist in playlists {
                            if playlist.name == currentName {
                                playlist.name = newName
                                print("Playlist name updated successfully.")
                                return
                            }
                        }
                        print("Playlist not found.")
                }
                updatePlaylist(currentName: updatePlaylistName, newName: newUpdatePlaylist)
                //                MARK: - Delete playlist options
            case .delete:
                print("Delete Playlist:")
                // delete playlist functionality
                let deletePlaylistName = String(getUserInput(prompt: "Enter playlist name you want to delete: "))
                func deletePlaylist(withName: String) {
                    for (index, playlist) in playlists.enumerated() {
                        if playlist.name == withName && playlist.songs.count <= 1 {
                            playlists.remove(at: index)
                            print("Playlist \(withName) deleted successfully.")
                            return
                        }
                    }
                    print("Playlist \(withName) not found or cannot be deleted since the playlist has more than 1 song.")
                }
                deletePlaylist(withName: deletePlaylistName)
                //                MARK: - Select Songs in playlist options functionality
            case .select:
                print("Select a Playlist:")
                // select playlist functionality
                let selectedPlaylist = String(getUserInput(prompt: "Enter playlist name you want to select: "))
                func selectPlaylist(withName: String) {
                    for playlist in playlists {
                        if playlist.name == withName {
                            for song in playlist.songs {
                                print(song.title)
                            }
                            return
                        }
                    }
                    print("Playlist not found.")
                }
                selectPlaylist(withName: selectedPlaylist)
                currentPlaylist = findPlaylist(byName: selectedPlaylist)
            case .logout:
                print("Logging out...")
                currentUser = nil
                currentSong = nil
                currentPlaylist = nil
            }
//            MARK: - this is when there is a playlist selected and CRUD operations on playlist
        } else if currentSong == nil && currentPlaylist != nil {
            guard let currentPlaylistSelected = findPlaylist(byName: currentPlaylist?.name ?? "") else {
                print("No selected playlist at the min")
                continue
            }
            
                //                MARK: - Song options functionality
                guard let songOption = ManageSongOption(rawValue: choice) else {
                    print("Invalid input. Please enter a number corresponding to the options.")
                    continue
                }
                
                switch songOption {
                    //                MARK: - Add a new song in playlist option
                case .add:
                        let newSongAdded = createNewSong()
                    allSongs.append(newSongAdded)
                        currentPlaylistSelected.songs.append(newSongAdded)
                        print("Song added to \(currentPlaylistSelected.name).")

                    func createNewSong() -> Song {
                        print("Enter details for the new song:")
                        print("Title:")
                        guard let newTitle = readLine(), !newTitle.isEmpty else {
                            print("Invalid title input.")
                            // Return a default Song or handle the error as needed
                            return Song(title: "", genre: "", favorite: false, duration: 0.0, uploadedDate: Date())
                        }

                        print("Genre:")
                        guard let newGenre = readLine(), !newGenre.isEmpty else {
                            print("Invalid genre input.")
                            // Return a default Song or handle the error as needed
                            return Song(title: "", genre: "", favorite: false, duration: 0.0, uploadedDate: Date())
                        }

                        print("Is the song a favorite? (true/false):")
                        guard let favoriteInput = readLine(), let newFav = Bool(favoriteInput) else {
                            print("Invalid favorite input.")
                            // Return a default Song or handle the error as needed
                            return Song(title: "", genre: "", favorite: false, duration: 0.0, uploadedDate: Date())
                        }

                        print("Enter duration:")
                        guard let durationInput = readLine(), let newDuration = Float(durationInput) else {
                            print("Invalid duration input.")
                            // Return a default Song or handle the error as needed
                            return Song(title: "", genre: "", favorite: false, duration: 0.0, uploadedDate: Date())
                        }

                        // Create and return a new Song object with unwrapped values
                        return Song(title: newTitle, genre: newGenre, favorite: newFav, duration: newDuration, uploadedDate: Date())
                    }

                    
                    
                    //                MARK: - Update song in playlist option
                case .update:
                    print("Update a song:")
                    let songtitle = String(getUserInput(prompt: "Enter the song title you want to edit"))
                    // display playlist functionality
                    guard let currentSongSelectedInPlaylist = findSong(byName: songtitle) else {
                        print("No selected song at the min")
                        continue
                    }
                    func updateSongInformation() {
                        print("Select the information you want to update:")
                        print("1. Title (current: \(currentSongSelectedInPlaylist.title))")
                        print("2. Genre (current: \(currentSongSelectedInPlaylist.genre))")
                        print("3. Is Favorite (current: \(currentSongSelectedInPlaylist.favorite))")
                        print("4. Duration (current: \(currentSongSelectedInPlaylist.duration))")
                        print("5. Uploaded Date (current: \(currentSongSelectedInPlaylist.uploadedDate))")
                        print("Enter the number corresponding to the option:")

                        guard let userInput = readLine(),
                              let option = Int(userInput) else {
                            print("Invalid input.")
                            return
                        }

                        switch option {
                        case 1:
                            print("Enter new title:")
                            if let newTitle = readLine(), !newTitle.isEmpty {
                                currentSongSelectedInPlaylist.title = newTitle
                            }
                        case 2:
                            print("Enter new genre:")
                            if let newGenre = readLine(), !newGenre.isEmpty {
                                currentSongSelectedInPlaylist.genre = newGenre
                            }
                        case 3:
                            print("Is the song a favorite? (true/false):")
                            if let favoriteInput = readLine(), let newIsFavorite = Bool(favoriteInput) {
                                currentSongSelectedInPlaylist.favorite = newIsFavorite
                            }
                        case 4:
                            print("Enter new duration:")
                            if let durationInput = readLine(), let newDuration = Float(durationInput) {
                                currentSongSelectedInPlaylist.duration = newDuration
                            }
                        case 5:
                            print("Enter new uploaded date (YYYY-MM-DD):")
                            if let dateString = readLine(), let newDate = dateFormatter.date(from: dateString) {
                                currentSongSelectedInPlaylist.uploadedDate = newDate
                            }
                        default:
                            print("Invalid option.")
                        }
                    }
                    
                    updateSongInformation()
                    
                    //                MARK: - Delete a new song in playlist option
                case .delete:
                    print("Delete a song from playlist:")
                    // delete song in playlist functionality
                    let deleteSongName = String(getUserInput(prompt: "Enter song title: "))
                    func deleteSongInPlaylist(withName: String) {
                        for (index, song) in currentPlaylistSelected.songs.enumerated() {
                            if song.title == withName {
                                currentPlaylistSelected.songs.remove(at: index)
                                print("Song \(withName) deleted successfully.")
                                return
                            }
                        }
                        print("Song \(withName) not found")
                    }
                    deleteSongInPlaylist(withName: deleteSongName)
                    //                MARK: - Select songs in playlist option
                case .select:
                    print("Select a new song:")
                    // display playlist functionality
                    let currentSongSelected = String(getUserInput(prompt: "Enter song name you want to select: "))
                    func selectSong(withName: String) {
                        for song in currentPlaylistSelected.songs  {
                            if song.title == withName {
                                    print("Selected song \(song.title)")
                                return
                            }
                        }
                        print("Song not found.")
                    }
                    selectSong(withName: currentSongSelected)
                    currentSong = findSong(byName: currentSongSelected)
                    
                    //                MARK: - Go back to choosing playlist options
                case .back:
                    print("Go back to managing playlists:")
                    // display playlist functionality
                    currentPlaylist = nil
                    
                    //                MARK: - Directly logout if you need
                case .logout:
                    print("Logging out...")
                    currentUser = nil
                    currentSong = nil
                    currentPlaylist = nil
            }
        } else {
//            MARK: - this is when a particular song in the playlist is selected, CRUD operations on selected song
            guard let currentSongSelected = findSong(byName: currentSong?.title ?? "") else {
                print("No selected song at the min")
                continue
            }
            
                //                MARK: - Individual Song options functionality
                guard let songOption = ManageIndividualSongOption(rawValue: choice) else {
                    print("Invalid input. Please enter a number corresponding to the options.")
                    continue
                }
                
                switch songOption {
                    //                MARK: - Display all the info about song selected
                case .display:
                    print("All the information about the song:")
                    // display playlist functionality
                    print("The title of the song is \(currentSongSelected.title)\nthe genre is \(currentSongSelected.genre)\nthe duration of the song is \(currentSongSelected.duration)\nthe uploaded date is \(currentSongSelected.uploadedDate)\nis the song marked as favorite \(currentSongSelected.favorite)")
                    
                    //                MARK: - Update a new song in playlist option
                case .update:
                    
                    // Function to update song information based on user-selected options
                    func updateInformation() {
                        print("Select the information you want to update:")
                        print("1. Title (current: \(currentSongSelected.title))")
                        print("2. Genre (current: \(currentSongSelected.genre))")
                        print("3. Is Favorite (current: \(currentSongSelected.favorite))")
                        print("4. Duration (current: \(currentSongSelected.duration))")
                        print("5. Uploaded Date (current: \(currentSongSelected.uploadedDate))")
                        print("Enter the number corresponding to the option:")

                        guard let userInput = readLine(),
                              let option = Int(userInput) else {
                            print("Invalid input.")
                            return
                        }

                        switch option {
                        case 1:
                            print("Enter new title:")
                            if let newTitle = readLine(), !newTitle.isEmpty {
                                currentSongSelected.title = newTitle
                            }
                        case 2:
                            print("Enter new genre:")
                            if let newGenre = readLine(), !newGenre.isEmpty {
                                currentSongSelected.genre = newGenre
                            }
                        case 3:
                            print("Is the song a favorite? (true/false):")
                            if let favoriteInput = readLine(), let newIsFavorite = Bool(favoriteInput) {
                                currentSongSelected.favorite = newIsFavorite
                            }
                        case 4:
                            print("Enter new duration:")
                            if let durationInput = readLine(), let newDuration = Float(durationInput) {
                                currentSongSelected.duration = newDuration
                            }
                        case 5:
                            print("Enter new uploaded date (YYYY-MM-DD):")
                            if let dateString = readLine(), let newDate = dateFormatter.date(from: dateString) {
                                currentSongSelected.uploadedDate = newDate
                            }
                        default:
                            print("Invalid option.")
                        }
                    }
                    
                    updateInformation()

                    
                    //                MARK: - Delete a new song in playlist option
                case .delete:
                    func deleteInformation() {
                        if(currentSongSelected.favorite == false) {
                            print("Select the information you want to delete:")
                            print("1. Title (current: \(currentSongSelected.title))")
                            print("2. Genre (current: \(currentSongSelected.genre))")
                            print("3. Is Favorite (current: \(currentSongSelected.favorite))")
                            print("4. Duration (current: \(currentSongSelected.duration))")
                            print("5. Uploaded Date (current: \(currentSongSelected.uploadedDate))")
                            print("Enter the number corresponding to the option:")
                            
                            guard let userInput = readLine(),
                                  let option = Int(userInput) else {
                                print("Invalid input.")
                                return
                            }
                            
                            switch option {
                            case 1:
                                currentSongSelected.title = ""
                            case 2:
                                currentSongSelected.genre = ""
                            case 3:
                                currentSongSelected.favorite = false
                            case 4:
                                currentSongSelected.duration = 0.0
                            case 5:
                                currentSongSelected.uploadedDate = Date()
                            default:
                                print("Invalid option.")
                            }
                        } else {
                            print("The current selected song is a favorite and can't be deleted!")
                        }
                    }
                    
                    deleteInformation()
                    
                case .add:
                    
                    func addInformation() {
                        print("Select the information you want to add:")
                        print("1. Title (current: \(currentSongSelected.title))")
                        print("2. Genre (current: \(currentSongSelected.genre))")
                        print("3. Is Favorite (current: \(currentSongSelected.favorite))")
                        print("4. Duration (current: \(currentSongSelected.duration))")
                        print("5. Uploaded Date (current: \(currentSongSelected.uploadedDate))")
                        print("Enter the number corresponding to the option:")

                        guard let userInput = readLine(),
                              let option = Int(userInput) else {
                            print("Invalid input.")
                            return
                        }

                        switch option {
                        case 1:
                            print("Enter new title:")
                            if let newTitle = readLine(), !newTitle.isEmpty {
                                currentSongSelected.title = newTitle
                            }
                        case 2:
                            print("Enter new genre:")
                            if let newGenre = readLine(), !newGenre.isEmpty {
                                currentSongSelected.genre = newGenre
                            }
                        case 3:
                            print("Is the song a favorite? (true/false):")
                            if let favoriteInput = readLine(), let newIsFavorite = Bool(favoriteInput) {
                                currentSongSelected.favorite = newIsFavorite
                            }
                        case 4:
                            print("Enter new duration:")
                            if let durationInput = readLine(), let newDuration = Float(durationInput) {
                                currentSongSelected.duration = newDuration
                            }
                        case 5:
                            print("Enter new uploaded date (YYYY-MM-DD):")
                            if let dateString = readLine(), let newDate = dateFormatter.date(from: dateString) {
                                currentSongSelected.uploadedDate = newDate
                            }
                        default:
                            print("Invalid option.")
                        }
                    }
                    
                    addInformation()
                    
                    //                MARK: - Go back to choosing playlist options
                case .back:
                    print("Go back to managing playlists:")
                    // display playlist functionality
                    currentSong = nil
                    
                    //                MARK: - Directly logout if you need
                case .logout:
                    print("Logging out...")
                    currentUser = nil
                    currentSong = nil
                    currentPlaylist = nil
            }
            
        }
    } else {
        print("Invalid input. Please enter a number corresponding to the options.")
    }
}

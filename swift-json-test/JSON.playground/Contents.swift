func printUser(_ user: User) {
    var msg = "\(user.name ?? user.id.description)"
    if let latitude = user.address?.coordinates?.latitude,
        let longitude = user.address?.coordinates?.longitude {
        msg += " at coordinates \(latitude), \(longitude)"
    }
    print(msg)
}

UserAPI.getUsers { (result) in
    switch result {
    case .success(let users):
        guard let users = users else {
            print("No users were returned.")
            return
        }
        users.forEach({ (user) in
            printUser(user)
        })
        
        var modifiedUser = users[0]
        modifiedUser.company?.name = "Apple Inc."
        modifiedUser.company?.catchPhrase = "We make iThings"
        modifiedUser.address?.street = "1 Infinite Loop"
        modifiedUser.address?.suite = nil
        modifiedUser.address?.city = "Cupertino"
        modifiedUser.address?.zipcode = "95014"
        modifiedUser.address?.coordinates?.latitude = "37.331586"
        modifiedUser.address?.coordinates?.longitude = "-122.029895"
        modifiedUser.website = "apple.com"
        printUser(modifiedUser)
        UserAPI.saveUser(modifiedUser)
        
    case .failure(let error):
        print(error.localizedDescription)
    }
}

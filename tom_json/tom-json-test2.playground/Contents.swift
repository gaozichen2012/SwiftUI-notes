//此方法将以更简洁的方式打印我们的用户数据
func printUser(_ user: User) {
    var msg = "\(user.name ?? user.id.description)"
    if let latitude = user.address?.geo?.lat,
        let longitude = user.address?.geo?.lng {
        msg += "at coordinates \(latitude), \(longitude)"
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
        modifiedUser.address?.geo?.lat = "37.331586"
        modifiedUser.address?.geo?.lng = "-122.029895"
        modifiedUser.website = "apple.com"
        printUser(modifiedUser)
        UserAPI.saveUser(modifiedUser)
    case .failure(let error):
        print(error.localizedDescription)
    }
}

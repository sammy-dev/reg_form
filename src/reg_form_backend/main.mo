actor {
  public query func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
};

module {
  // Define a record to store user data (username and password)
  type UserData = {
    username: Text;
    password: Text;
  };

  // Define a service to manage user registration and login
  public type UserService = {
    // Register a new user
    registerUser: (Text, Text) -> async ();

    // Check if a user with given credentials exists
    canUserLogin: (Text, Text) -> async Bool;
  };

  // Implement the UserService
  public let userService : UserService = {
    // In-memory storage for registered users
    var users : [UserData] = [];

    // Register a new user with the given username and password
    public func registerUser(username : Text, password : Text) : async () {
      // Check if the username is already registered
      if (Array.find(users, func(u) { u.username == username }) != null) {
       
      }
      // If the username is not taken, add the user to the list of registered users
      users := Array.append(users, { username = username; password = password });
    };

    // Check if a user with the given credentials exists
    public func canUserLogin(username : Text, password : Text) : async Bool {
      // Find the user with the given username and password
      let user = Array.find(users, func(u) { u.username == username && u.password == password });
      switch (user) {
        // If user is found, return true, else return false
        case (null) { true };
        case (_) { false };
      };
    };
  };
};
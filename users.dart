class Users {
  String name;
  String password;
  int balance;

  Users(this.name, this.password, this.balance);

  String getName() {
    return name;
  }

  String getPassword() {
    return password;
  }

  int getBalance() {
    return balance;
  }

  setBalance(int balance) {
    this.balance = balance;
  }
}

import 'dart:io';

import 'users.dart';

//note Jenis Motor dan Harga dengan Map {Nama:Pin}
var productMap = {
  "Supra": 20000,
  "Jupyter": 30000,
  "Safu": 35000,
  "Megapro": 40000
};

var menuMap = {
  "Sewa Motor": 1,
  "Cek Saldo": 2,
  "Isi Saldo": 3,
};

List<Users> users = [
  Users('Eudeka', "mamasuka123", 10000),
  Users('Eureka', "micinalkali123", 40000),
  Users('Merdeka', "roykoayam123", 70000),
];

late Users user;

bool checkAccount() {
  bool isLogin = false;
  print("\n Silahkan Masukan Password Anda");
  var pass = stdin.readLineSync();
  for (Users usr in users) {
    if (pass == usr.getPassword()) {
      user = usr;
      isLogin = true;
    }
  }
  return isLogin;
}

void checkLogin() {
  if (checkAccount()) {
    home();
  } else {
    main();
  }
}

void home() {
  String name = user.getName();
  print("Selamat Datang ${name}");

  menuMap.forEach((name, num) {
    print("${num}. ${name} \n");
  });
  print("Silahkan Masukan Pilihan Anda :");
  inputOption();
}

void inputOption() {
  int input = int.parse(stdin.readLineSync()!);
  switch (input) {
    case 1:
      break;
    case 2:
      break;
    case 3:
      break;

    default:
      print("Harap Masukan yang benar Bambank");
      inputOption();
  }
}

void sewaMotor() {
  print("Silahkan pilih motor yang anda inginkan\n");
  int numbers = 0;
  productMap.forEach((name, price) {
    numbers++;
    print("${numbers}. ${name} Biaya sewa Rp ${price} /jam \n");
  });
}

late int price;

void main() {
  print("Selamat Datang Di Peminjaman Motor");
  print("Silahkan Melakukan Login Account terlebih dahulu");
}

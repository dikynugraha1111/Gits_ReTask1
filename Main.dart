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
  "Ganti Akun": 4,
  "Keluar": 5,
};

List<Users> users = [
  Users('Eudeka', "mamasuka123", 10000),
  Users('Eureka', "micinalkali123", 40000),
  Users('Merdeka', "roykoayam123", 70000),
];

Users? user;

void checkAccount() {
  print("\n Silahkan Masukan Password Anda");
  var pass = stdin.readLineSync();

  users.forEach((Users userFun) {
    if (userFun.getPassword() == pass) user = userFun;
  });

  if (user != null) {
    home();
  } else {
    checkAccount();
  }
}

void home() {
  String name = user!.getName();
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
      sewaMotor();
      break;
    case 2:
      checkBalance();
      break;
    case 3:
      addSaldo();
      break;
    case 4:
      user = null;
      checkAccount();
      break;
    case 5:
    default:
      print("Harap Masukan yang benar Bambank");
      exit(0);
  }
}

void inputMotor() {
  int input = int.parse(stdin.readLineSync()!);
  switch (input) {
    case 1:
      rentMotor("Supra", 20000);
      break;
    case 2:
      rentMotor("Jupyter", 30000);
      break;
    case 3:
      rentMotor("Safu", 35000);
      break;
    case 4:
      rentMotor("Megapro", 40000);
      break;
    default:
      print("Harap Masukan yang benar Bambank");
      inputMotor();
  }
}

void rentMotor(String name, int price) {
  if (user!.getBalance() > price) {
    updateBalance(-price);
    print("Selamat Transaksi Berhasil \n");
    print(
        "Anda Menyewa Motor ${name} \n sisa saldo anda saat ini adalah ${user!.getBalance()}");
  } else {
    print("Maaf Saldo Anda Tidak Mencukupi");
  }
  home();
}

void sewaMotor() {
  print("Silahkan pilih motor yang anda inginkan\n");
  int numbers = 0;
  productMap.forEach((name, price) {
    numbers++;
    print("${numbers}. ${name} Biaya sewa Rp ${price} /jam \n");
  });
  inputMotor();
}

void checkBalance() {
  var balanceNow = user!.getBalance();
  print("\n Your Balance is ${balanceNow}");
  home();
}

void addSaldo() {
  print("Silahkan Masukan Nominal Inputan Saldo");
  int addSaldo = int.parse(stdin.readLineSync()!);
  updateBalance(addSaldo);
  print("Saldo anda Sekarang adalah ${user!.getBalance()}");
  home();
}

void updateBalance(int nominal) {
  var balance = user!.getBalance() + nominal;
  user!.setBalance(balance);
}

late int price;

void main() {
  print("Selamat Datang Di Peminjaman Motor");
  print("Silahkan Melakukan Login Account terlebih dahulu");
  checkAccount();
}

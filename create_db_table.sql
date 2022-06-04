IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Perpustakaan')
BEGIN
  CREATE DATABASE Perpustakaan;
END
GO

USE Perpustakaan

--DROP TABLE Artikel_Kategori, Transaksi_Keanggotaan, Membaca, Favorit, Review, Artikel, Kategori, Member, Keanggotaan, Administrator, Pengguna, Kota, Negara

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Negara')
BEGIN
	 CREATE TABLE Negara
	 (
		  id_negara INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  nama_negara VARCHAR(255) NOT NULL
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Kota')
BEGIN
	 CREATE TABLE Kota
	 (
		  id_kota INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  nama_kota VARCHAR(255) NOT NULL,
		  id_negara INT FOREIGN KEY REFERENCES Negara(id_negara)
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Pengguna')
BEGIN
	 CREATE TABLE Pengguna
	 (
		  id_pengguna INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  username VARCHAR (255) NOT NULL,
		  pass VARCHAR (255) NOT NULL
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Administrator')
BEGIN
	 CREATE TABLE Administrator
	 (
		  id_admin INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  nama VARCHAR(255) NOT NULL,
		  id_pengguna INT FOREIGN KEY REFERENCES Pengguna(id_pengguna)
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Keanggotaan')
BEGIN
	 CREATE TABLE Keanggotaan
	 (
		  id_keanggotaan INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  nama_keanggotaan VARCHAR(255) NOT NULL,
		  harga INT NOT NULL,
		  durasi_hari INT NOT NULL,
		  tanggal_berlaku DATE NOT NULL,
		  id_admin INT FOREIGN KEY REFERENCES Administrator(id_admin)
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Member')
BEGIN
	 CREATE TABLE Member
	 (
		  id_member INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  nama VARCHAR(255) NOT NULL,
		  email VARCHAR(255) NOT NULL,
		  telp VARCHAR(255) NOT NULL,
		  alamat VARCHAR(255) NOT NULL,
		  status_keanggotaan INT FOREIGN KEY REFERENCES Keanggotaan(id_keanggotaan),
		  id_kota INT FOREIGN KEY REFERENCES Kota(id_kota),
		  id_pengguna INT FOREIGN KEY REFERENCES Pengguna(id_pengguna)
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Kategori')
BEGIN
	 CREATE TABLE Kategori
	 (
		  id_kategori INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  nama_kategori VARCHAR(255) NOT NULL
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Artikel')
BEGIN
	 CREATE TABLE Artikel
	 (
		  id_artikel INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  is_premium INT NOT NULL,
		  nama_artikel VARCHAR(255) NOT NULL,
		  path_artikel VARCHAR(500) NOT NULL,
		  status_validasi INT NOT NULL,
		  tanggal_tulis DATE NOT NULL,
		  id_penulis INT FOREIGN KEY REFERENCES Member(id_member),
		  id_admin INT FOREIGN KEY REFERENCES Administrator(id_admin)
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Review')
BEGIN
	 CREATE TABLE Review
	 (
		  id_review INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  komentar VARCHAR(2000) NOT NULL,
		  rating INT NOT NULL,
		  tanggal_review DATE NOT NULL,
		  id_member INT FOREIGN KEY REFERENCES Member(id_member),
		  id_artikel INT FOREIGN KEY REFERENCES Artikel(id_artikel)
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Favorit')
BEGIN
	 CREATE TABLE Favorit
	 (
		  id_favorit INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  tanggal_favorit DATE NOT NULL,
		  id_member INT FOREIGN KEY REFERENCES Member(id_member),
		  id_artikel INT FOREIGN KEY REFERENCES Artikel(id_artikel)
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Membaca')
BEGIN
	 CREATE TABLE Membaca
	 (
		  id_baca INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  tanggal_baca DATE NOT NULL,
		  id_member INT FOREIGN KEY REFERENCES Member(id_member),
		  id_artikel INT FOREIGN KEY REFERENCES Artikel(id_artikel)
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Transaksi_Keanggotaan')
BEGIN
	 CREATE TABLE Transaksi_Keanggotaan
	 (
		  id_transaksi INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
		  harga_transaksi INT NOT NULL,
		  tanggal_transaksi DATE NOT NULL,
		  id_member INT FOREIGN KEY REFERENCES Member(id_member),
		  id_admin INT FOREIGN KEY REFERENCES Administrator(id_admin), 
		  id_keanggotaan INT FOREIGN KEY REFERENCES Keanggotaan(id_keanggotaan)
	 )
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Artikel_Kategori')
BEGIN
	 CREATE TABLE Artikel_Kategori
	 (
		  id_artikel INT FOREIGN KEY REFERENCES Artikel(id_artikel),
		  id_kategori INT FOREIGN KEY REFERENCES Kategori(id_kategori)
	 )
END
GO
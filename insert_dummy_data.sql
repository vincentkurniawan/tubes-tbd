--negara
INSERT INTO Negara (nama_negara) 
VALUES 
	('Indonesia'),
	('Singapura'),
	('Jepang'),
	('Australia'),
	('Amerika')

--kota
INSERT INTO Kota (nama_kota, id_negara)
VALUES
	('Bandung', 1),
	('Jakarta', 1),
	('Rochor', 2),
	('Tokyo', 3),
	('Osaka', 3),
	('Sydney', 4),
	('Newyork', 5),
	('California', 5)

--pengguna
INSERT INTO Pengguna (username, pass)
VALUES 
	('admin1', 'admin1x'),
	('admin2', 'admin2x'),
	('admin3', 'admin3x'),
	('member1', 'member1x'),
	('member2', 'member2x'),
	('member3', 'member3x')

--administrator
INSERT INTO Administrator (nama, id_pengguna)
VALUES 
	('Admin haha', 1),
	('Admin hihi', 2),
	('Admin huhu', 3)

--keanggotaan 
INSERT INTO Keanggotaan ()
VALUES
	
--member
INSERT INTO Member (nama, email, telp, alamat, status_keanggotaan, id_kota, id_pengguna)
VALUES
	('Nadia Clarissa H', 'nadiacx@gmail.com', '02138921323', 'Jl. Suatu hari 1', -1, ),
	(),
	()

--kategori
INSERT INTO Kategori (nama_kategori)
VALUES
	(),
	(),
	(),
	(),
	()

--artikel
INSERT INTO Artikel (is_premium, path_artikel, status_validasi, tanggal_tulis, id_penulis, id_admin)
	(),
	(),
	(),
	(),
	(),
	()

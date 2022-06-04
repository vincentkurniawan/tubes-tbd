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
INSERT INTO Keanggotaan (nama_keanggotaan, harga, durasi_hari, tanggal_berlaku, id_admin)
VALUES
	('Free', 0, 2147483647, '20220604', 1),
	('VIP', 30000, 30, '20220604', 2),
	('VIP+', 50000, 365, '20220604', 3)
	
	
--member
INSERT INTO Member (nama, email, telp, alamat, status_keanggotaan, id_kota, id_pengguna)
VALUES
	('Nadia Clarissa H', 'nadiacx@gmail.com', '02138921323', 'Jl. Suatu hari 1', 1, 1, 4),
	('Vincent Kurniwawan', 'awan@gmail.com', '37347993243', 'Jl. Lancay no 12', 2, 3, 5),
	('Ali Baba expresso', 'kopisejuk@yahoo.com', '3279432793', 'Komplek Kentut no 2', 3, 5, 6)

--kategori
INSERT INTO Kategori (nama_kategori)
VALUES
	('Romance'),
	('Action'),
	('Comedy'),
	('Fantasy'),
	('Crime'),
	('Horror'),
	('Thriller')

--artikel
INSERT INTO Artikel (is_premium, path_artikel, status_validasi, tanggal_tulis, id_penulis, id_admin)
	(0, 'Penjelajahan Pulau X', 'C:\Users\LENOVO\Downloads\TubesTBD\1.pdf', 1, '20220601', 4, 1),
	(0, 'Teka-teki Cinta'),
	(0, 'Rusak Buku Ini'),
	(1, 'Chicken Soup'),
	(1, 'The Secret History of The World'),
	(1, '101 How to Cook')

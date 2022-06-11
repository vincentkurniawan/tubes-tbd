USE Perpustakaan


--member jangan lupa insert pengguna jg
INSERT INTO Member (nama, email, telp, alamat, status_keanggotaan, id_kota, id_pengguna)
VALUES
	('Nadia Clarissa H', 'nadiacx@gmail.com', '02138921323', 'Jl. Suatu hari 1', 1, 1, 4),
	('Vincent Kurniwawan', 'awan@gmail.com', '37347993243', 'Jl. Lancay no 12', 2, 3, 5),
	('Ali Baba expresso', 'kopisejuk@yahoo.com', '3279432793', 'Komplek Kentut no 2', 3, 5, 6)

--artikel (is_premium 2 --> VIP, 3 --> VIP+)
INSERT INTO Artikel (is_premium, nama_artikel, path_artikel, status_validasi, tanggal_tulis, id_penulis, id_admin)
VALUES
	(1, 'Penjelajahan Pulau X', 'C:\Users\LENOVO\Downloads\TubesTBD\1.pdf', 1, '20220601', 1, 1),
	(1, 'Teka-teki Cinta', 'C:\Users\LENOVO\Downloads\TubesTBD\2.pdf', 0, '20220603', 2, 1),
	(1, 'Rusak Buku Ini', 'C:\Users\LENOVO\Downloads\TubesTBD\3.pdf', 1, '20220602', 3, 2),
	(2, 'Chicken Soup', 'C:\Users\LENOVO\Downloads\TubesTBD\4.pdf', 1, '20220401', 2, 3),
	(3, 'The Secret History of The World', 'C:\Users\LENOVO\Downloads\TubesTBD\5.pdf', 1, '20220402', 2, 2),
	(3, '101 How to Cook', 'C:\Users\LENOVO\Downloads\TubesTBD\6.pdf', 0, '20220523', 1, 3)

--artikel_kategori
INSERT INTO Artikel_Kategori (id_artikel, id_kategori)
VALUES 
	(1, 2),
	(1, 4),
	(1, 7),
	(2, 1),
	(2, 3),
	(3, 3),
	(4, 1),
	(4, 3), 
	(5, 6),
	(5, 7),
	(6, 3)

--review
INSERT INTO Review (komentar, rating, tanggal_review, id_member, id_artikel) 
VALUES
	('Artikel ini memiliki konten yang menarik dan cukup berbobot.', 4, '20220602', 2, 1),
	('Tidak jelas, masa buku disuruh dirusak sih :(', 1, '20220604', 1, 3),
	('Terharu saia bacanya hiks :" emejing', 5, '20220602', 3, 4)

--favorit
INSERT INTO Favorit (tanggal_favorit, id_member, id_artikel)
VALUES
	('20220602', 2, 1),
	('20220604', 3, 1),
	('20220602', 3, 4),
	('20220603', 2, 4)

--membaca
INSERT INTO Membaca (tanggal_baca, id_member, id_artikel) 
VALUES
	('20220602', 2, 1),
	('20220603', 2, 4),
	('20220604', 1, 3),
	('20220604', 3, 1),
	('20220602', 3, 4)

--transaksi_keanggotaan
INSERT INTO Transaksi_Keanggotaan (harga_transaksi, tanggal_transaksi, status_validasi, id_member, id_admin, id_keanggotaan)
VALUES 
	(30000, '20220524', 0, 2, 2, 2),
	(80000, '20220526', 1, 3, 3, 3)
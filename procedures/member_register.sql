--Member_Register 
--param : uname, pass, nama, email, no telp, alamat, kota. 
--todo  : cek apakah uname, email sdh prnh digunakan sblmnya. if belum pernah, insert data ke tabel Pengguna lalu ke tabel Member baru 
--return: true (0) jika blm prnh digunakan, false (1) jika sudah.
GO
USE Perpustakaan

GO
CREATE PROCEDURE register (
	@username VARCHAR(255), 
	@pass VARCHAR(255), 
	@nama VARCHAR(255), 
	@email VARCHAR(255), 
	@telp VARCHAR(255), 
	@alamat VARCHAR(255),
	@nama_kota VARCHAR(255)
)
AS
	DECLARE
	@id_pengguna INT,
	@id_kota INT,
	@keanggotaan INT = 1 --Default keanggotaan Free -> 1

        IF EXISTS (SELECT * FROM Pengguna WHERE username = @username)
        BEGIN
            RETURN 1
        END
		ELSE IF EXISTS (SELECT * FROM Member WHERE email = @email)
		BEGIN
            RETURN 1
        END
		ELSE 
		BEGIN 
			INSERT INTO Pengguna(username, pass) 
			VALUES (@username, @pass)

			--ambil id pengguna
			SELECT @id_pengguna = id_pengguna
			FROM Pengguna
			WHERE username = @username

			--ambil id kota
			SELECT @id_kota = id_kota
			FROM Kota
			WHERE nama_kota = @nama_kota

			INSERT INTO Member(nama, email, telp, alamat, status_keanggotaan, id_kota, id_pengguna)
			VALUES (@nama, @email, @telp, @alamat, @keanggotaan, @id_kota, @id_pengguna)
		END
        RETURN 0

GO
EXEC register 'icepandabear', 'abcd123', 'tasha', 'tasha@gmail.com', '0721 257750', 'Jl. jalan santai', 'Tokyo'
EXEC register 'icepandabear', 'abcd123', 'tasha', 'kopisejuk@yahoo.com', '0721 257750', 'Jl. jalan santai', 'Tokyo'
EXEC register 'icepandabear', 'abcd123', 'Nadia Clarissa H', 'kopisejuk@yahoo.com', '0721 257750', 'Jl. jalan santai', 'Tokyo'
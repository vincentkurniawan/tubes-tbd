--Member_Register 
--param : uname, pass, nama, email, no telp, alamat. 
--todo  : cek apakah uname, email sdh prnh digunakan sblmnya. if belum pernah, insert data ke tabel Pengguna lalu ke tabel Member baru 
--return: true (0) jika blm prnh digunakan, false (1) jika sudah.

USE Perpustakaan

GO
CREATE FUNCTION register (@username VARCHAR(255), @pass VARCHAR(255), @nama VARCHAR(255), @email VARCHAR(255), @telp VARCHAR(255), @alamat VARCHAR(255))
    RETURNS BIT
        BEGIN
            IF EXISTS (SELECT * FROM Pengguna WHERE username = @username)
            BEGIN
                RETURN 1
            END
			ELSE IF EXISTS (SELECT * FROM Member WHERE email = @email)
			BEGIN
                RETURN 1
            END
            RETURN 0
        END

-- EXAMPLE INPUT

GO
PRINT dbo.register('icepandabear', 'abcd123', 'tasha', 'tasha@gmail.com', '0721 257750', 'Bandarlampung')

GO
PRINT dbo.register('icepandabear', 'abcd123', 'tasha', 'kopisejuk@yahoo.com', '0721 257750', 'Bandarlampung')

GO
PRINT dbo.register('icepandabear', 'abcd123', 'Nadia Clarissa H', 'kopisejuk@yahoo.com', '0721 257750', 'Bandarlampung')
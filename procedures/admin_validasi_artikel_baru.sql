/**
- Admin_Validasi_Artikel_Baru 
param : id_artikel yang divalidasi, id_admin, status_validasi yang diterima dari interface (bayangin aja ada)
todo  : cari artikel berdasarkan id yang dimaksud, update value id admin & status validasinya berdasarkan parameter yg diterima.
return: -
**/
GO
USE Perpustakaan

GO
CREATE PROCEDURE validasi_artikel_baru(
	@id_artikel INT,
	@id_admin INT,
	@status_validasi INT
)
AS
	--assert count(id_artikel) FROM Artikel = 1
	--assert count(id_pengguna) FROM Administrator = 1
	UPDATE
		Artikel
	SET
		id_admin = @id_admin,
		status_validasi =  @status_validasi
	WHERE
		id_artikel = @id_artikel
GO

--tes doang, jangan lupa ganti param sesuai isi db masing-masing.
EXEC validasi_artikel_baru 1, 5, 1
EXEC validasi_artikel_baru 2, 10, 0
EXEC validasi_artikel_baru 3, 4, 1
EXEC validasi_artikel_baru 4, 1, 0
EXEC validasi_artikel_baru 5, 9, 1
EXEC validasi_artikel_baru 6, 8, 0
EXEC validasi_artikel_baru 7, 7, 1
EXEC validasi_artikel_baru 8, 1, 0
EXEC validasi_artikel_baru 9, 2, 1
EXEC validasi_artikel_baru 10, 8, 0
EXEC validasi_artikel_baru 11, 5, 1
EXEC validasi_artikel_baru 12, 7, 1
EXEC validasi_artikel_baru 13, 2, 1
EXEC validasi_artikel_baru 14, 1, 0
EXEC validasi_artikel_baru 15, 6, 1
EXEC validasi_artikel_baru 16, 5, 1
EXEC validasi_artikel_baru 17, 4, 0
EXEC validasi_artikel_baru 18, 10, 1
EXEC validasi_artikel_baru 19, 8, 1
EXEC validasi_artikel_baru 20, 4, 1
EXEC validasi_artikel_baru 21, 5, 0
EXEC validasi_artikel_baru 22, 7, 1
EXEC validasi_artikel_baru 23, 4, 0
EXEC validasi_artikel_baru 24, 2, 0
EXEC validasi_artikel_baru 25, 1, 0
EXEC validasi_artikel_baru 26, 2, 1
EXEC validasi_artikel_baru 27, 6, 0
EXEC validasi_artikel_baru 28, 7, 1
EXEC validasi_artikel_baru 29, 9, 0
EXEC validasi_artikel_baru 30, 10, 0
EXEC validasi_artikel_baru 31, 5, 1
EXEC validasi_artikel_baru 32, 9, 0
EXEC validasi_artikel_baru 33, 6, 1
EXEC validasi_artikel_baru 34, 2, 1
EXEC validasi_artikel_baru 35, 9, 1
EXEC validasi_artikel_baru 36, 3, 1
EXEC validasi_artikel_baru 37, 10, 0
EXEC validasi_artikel_baru 38, 10, 0
EXEC validasi_artikel_baru 39, 3, 0
EXEC validasi_artikel_baru 40, 1, 0
EXEC validasi_artikel_baru 41, 3, 0
EXEC validasi_artikel_baru 42, 3, 0
EXEC validasi_artikel_baru 43, 1, 1
EXEC validasi_artikel_baru 44, 7, 0
EXEC validasi_artikel_baru 45, 9, 1
EXEC validasi_artikel_baru 46, 6, 0
EXEC validasi_artikel_baru 47, 4, 1
EXEC validasi_artikel_baru 48, 7, 1
EXEC validasi_artikel_baru 49, 10, 1
EXEC validasi_artikel_baru 50, 10, 1
EXEC validasi_artikel_baru 51, 4, 1
EXEC validasi_artikel_baru 52, 4, 0
EXEC validasi_artikel_baru 53, 9, 0
EXEC validasi_artikel_baru 54, 10, 0
EXEC validasi_artikel_baru 55, 5, 0
EXEC validasi_artikel_baru 56, 7, 1
EXEC validasi_artikel_baru 57, 3, 1
EXEC validasi_artikel_baru 58, 7, 1
EXEC validasi_artikel_baru 59, 3, 0
EXEC validasi_artikel_baru 60, 8, 1
EXEC validasi_artikel_baru 61, 6, 1
EXEC validasi_artikel_baru 62, 6, 1
EXEC validasi_artikel_baru 63, 4, 0
EXEC validasi_artikel_baru 64, 4, 0
EXEC validasi_artikel_baru 65, 6, 0
EXEC validasi_artikel_baru 66, 3, 0
EXEC validasi_artikel_baru 67, 4, 0
EXEC validasi_artikel_baru 68, 2, 0
EXEC validasi_artikel_baru 69, 8, 1
EXEC validasi_artikel_baru 70, 3, 1
EXEC validasi_artikel_baru 71, 7, 1
EXEC validasi_artikel_baru 72, 4, 1
EXEC validasi_artikel_baru 73, 9, 1
EXEC validasi_artikel_baru 74, 10, 1
EXEC validasi_artikel_baru 75, 8, 0
EXEC validasi_artikel_baru 76, 8, 0
EXEC validasi_artikel_baru 77, 1, 0
EXEC validasi_artikel_baru 78, 7, 1
EXEC validasi_artikel_baru 79, 5, 0
EXEC validasi_artikel_baru 80, 3, 0
EXEC validasi_artikel_baru 81, 2, 0
EXEC validasi_artikel_baru 82, 8, 1
EXEC validasi_artikel_baru 83, 1, 1
EXEC validasi_artikel_baru 84, 8, 0
EXEC validasi_artikel_baru 85, 5, 1
EXEC validasi_artikel_baru 86, 7, 0
EXEC validasi_artikel_baru 87, 1, 0
EXEC validasi_artikel_baru 88, 1, 1
EXEC validasi_artikel_baru 89, 9, 1
EXEC validasi_artikel_baru 90, 10, 1
EXEC validasi_artikel_baru 91, 3, 0
EXEC validasi_artikel_baru 92, 7, 1
EXEC validasi_artikel_baru 93, 7, 0
EXEC validasi_artikel_baru 94, 7, 1
EXEC validasi_artikel_baru 95, 10, 1
EXEC validasi_artikel_baru 96, 3, 0
EXEC validasi_artikel_baru 97, 4, 0
EXEC validasi_artikel_baru 98, 9, 0
EXEC validasi_artikel_baru 99, 10, 0
EXEC validasi_artikel_baru 100, 6, 0

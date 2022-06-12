/**
admin mengupdate status validasi pada suatu artikel terpilih 
**/

GO
USE Perpustakaan

GO
CREATE PROCEDURE admin_validasi_artikel_baru(
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

EXEC admin_validasi_artikel_baru 1, 5, 1
EXEC admin_validasi_artikel_baru 2, 1, 1
EXEC admin_validasi_artikel_baru 3, 1, 0
EXEC admin_validasi_artikel_baru 4, 9, 0
EXEC admin_validasi_artikel_baru 5, 3, 1
EXEC admin_validasi_artikel_baru 6, 7, 1
EXEC admin_validasi_artikel_baru 7, 7, 0
EXEC admin_validasi_artikel_baru 8, 5, 0
EXEC admin_validasi_artikel_baru 9, 1, 0
EXEC admin_validasi_artikel_baru 10, 5, 1
EXEC admin_validasi_artikel_baru 11, 4, 1
EXEC admin_validasi_artikel_baru 12, 4, 1
EXEC admin_validasi_artikel_baru 13, 9, 0
EXEC admin_validasi_artikel_baru 14, 1, 1
EXEC admin_validasi_artikel_baru 15, 2, 0
EXEC admin_validasi_artikel_baru 16, 4, 0
EXEC admin_validasi_artikel_baru 17, 2, 1
EXEC admin_validasi_artikel_baru 18, 7, 1
EXEC admin_validasi_artikel_baru 19, 6, 1
EXEC admin_validasi_artikel_baru 20, 3, 1
EXEC admin_validasi_artikel_baru 21, 1, 0
EXEC admin_validasi_artikel_baru 22, 9, 0
EXEC admin_validasi_artikel_baru 23, 6, 1
EXEC admin_validasi_artikel_baru 24, 7, 1
EXEC admin_validasi_artikel_baru 25, 5, 1
EXEC admin_validasi_artikel_baru 26, 1, 0
EXEC admin_validasi_artikel_baru 27, 9, 0
EXEC admin_validasi_artikel_baru 28, 8, 0
EXEC admin_validasi_artikel_baru 29, 10, 0
EXEC admin_validasi_artikel_baru 30, 8, 1
EXEC admin_validasi_artikel_baru 31, 4, 0
EXEC admin_validasi_artikel_baru 32, 1, 1
EXEC admin_validasi_artikel_baru 33, 1, 0
EXEC admin_validasi_artikel_baru 34, 7, 0
EXEC admin_validasi_artikel_baru 35, 5, 1
EXEC admin_validasi_artikel_baru 36, 6, 1
EXEC admin_validasi_artikel_baru 37, 2, 1
EXEC admin_validasi_artikel_baru 38, 9, 1
EXEC admin_validasi_artikel_baru 39, 10, 1
EXEC admin_validasi_artikel_baru 40, 10, 0
EXEC admin_validasi_artikel_baru 41, 3, 0
EXEC admin_validasi_artikel_baru 42, 6, 1
EXEC admin_validasi_artikel_baru 43, 8, 0
EXEC admin_validasi_artikel_baru 44, 5, 0
EXEC admin_validasi_artikel_baru 45, 3, 1
EXEC admin_validasi_artikel_baru 46, 10, 0
EXEC admin_validasi_artikel_baru 47, 3, 1
EXEC admin_validasi_artikel_baru 48, 7, 1
EXEC admin_validasi_artikel_baru 49, 4, 0
EXEC admin_validasi_artikel_baru 50, 5, 1
EXEC admin_validasi_artikel_baru 51, 4, 0
EXEC admin_validasi_artikel_baru 52, 7, 1
EXEC admin_validasi_artikel_baru 53, 10, 0
EXEC admin_validasi_artikel_baru 54, 2, 0
EXEC admin_validasi_artikel_baru 55, 2, 0
EXEC admin_validasi_artikel_baru 56, 4, 1
EXEC admin_validasi_artikel_baru 57, 10, 0
EXEC admin_validasi_artikel_baru 58, 10, 0
EXEC admin_validasi_artikel_baru 59, 2, 1
EXEC admin_validasi_artikel_baru 60, 5, 1
EXEC admin_validasi_artikel_baru 61, 9, 1
EXEC admin_validasi_artikel_baru 62, 7, 0
EXEC admin_validasi_artikel_baru 63, 8, 0
EXEC admin_validasi_artikel_baru 64, 8, 1
EXEC admin_validasi_artikel_baru 65, 9, 0
EXEC admin_validasi_artikel_baru 66, 2, 1
EXEC admin_validasi_artikel_baru 67, 7, 0
EXEC admin_validasi_artikel_baru 68, 10, 0
EXEC admin_validasi_artikel_baru 69, 7, 1
EXEC admin_validasi_artikel_baru 70, 3, 1
EXEC admin_validasi_artikel_baru 71, 5, 1
EXEC admin_validasi_artikel_baru 72, 3, 1
EXEC admin_validasi_artikel_baru 73, 10, 1
EXEC admin_validasi_artikel_baru 74, 2, 0
EXEC admin_validasi_artikel_baru 75, 3, 1
EXEC admin_validasi_artikel_baru 76, 9, 1
EXEC admin_validasi_artikel_baru 77, 4, 0
EXEC admin_validasi_artikel_baru 78, 7, 1
EXEC admin_validasi_artikel_baru 79, 9, 0
EXEC admin_validasi_artikel_baru 80, 6, 0
EXEC admin_validasi_artikel_baru 81, 9, 0
EXEC admin_validasi_artikel_baru 82, 10, 1
EXEC admin_validasi_artikel_baru 83, 8, 0
EXEC admin_validasi_artikel_baru 84, 7, 1
EXEC admin_validasi_artikel_baru 85, 5, 1
EXEC admin_validasi_artikel_baru 86, 4, 1
EXEC admin_validasi_artikel_baru 87, 8, 1
EXEC admin_validasi_artikel_baru 88, 8, 0
EXEC admin_validasi_artikel_baru 89, 2, 1
EXEC admin_validasi_artikel_baru 90, 5, 0
EXEC admin_validasi_artikel_baru 91, 4, 0
EXEC admin_validasi_artikel_baru 92, 10, 0
EXEC admin_validasi_artikel_baru 93, 2, 1
EXEC admin_validasi_artikel_baru 94, 10, 0
EXEC admin_validasi_artikel_baru 95, 6, 1
EXEC admin_validasi_artikel_baru 96, 7, 0
EXEC admin_validasi_artikel_baru 97, 4, 0
EXEC admin_validasi_artikel_baru 98, 7, 0
EXEC admin_validasi_artikel_baru 99, 1, 0
EXEC admin_validasi_artikel_baru 100, 9, 0

SELECT *
FROM Artikel
/* Admin validasi transaksi keanggotaan yang sudah terjadi */

GO
USE Perpustakaan

GO
CREATE PROCEDURE admin_validasi_transaksi_keanggotaan (
	@id_transaksi INT, 
	@id_admin INT, 
	@status_validasi INT
)
AS
	-- update tabel transaksi
	UPDATE Transaksi_Keanggotaan
	SET status_validasi = @status_validasi, id_admin = @id_admin
	WHERE id_transaksi = @id_transaksi

	UPDATE Member
	SET status_keanggotaan = (SELECT id_keanggotaan FROM Transaksi_Keanggotaan WHERE id_transaksi = @id_transaksi)
	WHERE id_member = (SELECT id_member FROM Transaksi_Keanggotaan WHERE id_transaksi = @id_transaksi)

GO
EXEC admin_validasi_transaksi_keanggotaan 1, 1, 0
EXEC admin_validasi_transaksi_keanggotaan 2, 9, 1
EXEC admin_validasi_transaksi_keanggotaan 3, 2, 0
EXEC admin_validasi_transaksi_keanggotaan 4, 3, 1
EXEC admin_validasi_transaksi_keanggotaan 5, 5, 1
EXEC admin_validasi_transaksi_keanggotaan 6, 8, 0
EXEC admin_validasi_transaksi_keanggotaan 7, 2, 0
EXEC admin_validasi_transaksi_keanggotaan 8, 5, 0
EXEC admin_validasi_transaksi_keanggotaan 9, 2, 1
EXEC admin_validasi_transaksi_keanggotaan 10, 9, 0
EXEC admin_validasi_transaksi_keanggotaan 11, 6, 1
EXEC admin_validasi_transaksi_keanggotaan 12, 5, 1
EXEC admin_validasi_transaksi_keanggotaan 13, 6, 0
EXEC admin_validasi_transaksi_keanggotaan 14, 7, 1
EXEC admin_validasi_transaksi_keanggotaan 15, 3, 1
EXEC admin_validasi_transaksi_keanggotaan 16, 10, 0
EXEC admin_validasi_transaksi_keanggotaan 17, 7, 1
EXEC admin_validasi_transaksi_keanggotaan 18, 1, 1
EXEC admin_validasi_transaksi_keanggotaan 19, 4, 1
EXEC admin_validasi_transaksi_keanggotaan 20, 3, 0
EXEC admin_validasi_transaksi_keanggotaan 21, 4, 0
EXEC admin_validasi_transaksi_keanggotaan 22, 3, 1
EXEC admin_validasi_transaksi_keanggotaan 23, 5, 0
EXEC admin_validasi_transaksi_keanggotaan 24, 5, 1
EXEC admin_validasi_transaksi_keanggotaan 25, 7, 1
EXEC admin_validasi_transaksi_keanggotaan 26, 5, 1
EXEC admin_validasi_transaksi_keanggotaan 27, 1, 1
EXEC admin_validasi_transaksi_keanggotaan 28, 2, 1
EXEC admin_validasi_transaksi_keanggotaan 29, 8, 1
EXEC admin_validasi_transaksi_keanggotaan 30, 1, 1
EXEC admin_validasi_transaksi_keanggotaan 31, 8, 1
EXEC admin_validasi_transaksi_keanggotaan 32, 4, 0
EXEC admin_validasi_transaksi_keanggotaan 33, 7, 0
EXEC admin_validasi_transaksi_keanggotaan 34, 10, 0
EXEC admin_validasi_transaksi_keanggotaan 35, 10, 1
EXEC admin_validasi_transaksi_keanggotaan 36, 3, 1
EXEC admin_validasi_transaksi_keanggotaan 37, 5, 0
EXEC admin_validasi_transaksi_keanggotaan 38, 7, 0
EXEC admin_validasi_transaksi_keanggotaan 39, 7, 1
EXEC admin_validasi_transaksi_keanggotaan 40, 5, 0
EXEC admin_validasi_transaksi_keanggotaan 41, 5, 0
EXEC admin_validasi_transaksi_keanggotaan 42, 1, 0
EXEC admin_validasi_transaksi_keanggotaan 43, 5, 1
EXEC admin_validasi_transaksi_keanggotaan 44, 4, 0
EXEC admin_validasi_transaksi_keanggotaan 45, 10, 0
EXEC admin_validasi_transaksi_keanggotaan 46, 5, 0
EXEC admin_validasi_transaksi_keanggotaan 47, 3, 1
EXEC admin_validasi_transaksi_keanggotaan 48, 7, 1
EXEC admin_validasi_transaksi_keanggotaan 49, 5, 0
EXEC admin_validasi_transaksi_keanggotaan 50, 1, 1
EXEC admin_validasi_transaksi_keanggotaan 51, 7, 1
EXEC admin_validasi_transaksi_keanggotaan 52, 5, 1
EXEC admin_validasi_transaksi_keanggotaan 53, 1, 0
EXEC admin_validasi_transaksi_keanggotaan 54, 10, 0
EXEC admin_validasi_transaksi_keanggotaan 55, 9, 0
EXEC admin_validasi_transaksi_keanggotaan 56, 8, 0
EXEC admin_validasi_transaksi_keanggotaan 57, 2, 1
EXEC admin_validasi_transaksi_keanggotaan 58, 1, 1
EXEC admin_validasi_transaksi_keanggotaan 59, 10, 1
EXEC admin_validasi_transaksi_keanggotaan 60, 5, 1
EXEC admin_validasi_transaksi_keanggotaan 61, 2, 1
EXEC admin_validasi_transaksi_keanggotaan 62, 4, 0
EXEC admin_validasi_transaksi_keanggotaan 63, 6, 1
EXEC admin_validasi_transaksi_keanggotaan 64, 8, 0
EXEC admin_validasi_transaksi_keanggotaan 65, 4, 0
EXEC admin_validasi_transaksi_keanggotaan 66, 3, 1
EXEC admin_validasi_transaksi_keanggotaan 67, 1, 0
EXEC admin_validasi_transaksi_keanggotaan 68, 5, 1
EXEC admin_validasi_transaksi_keanggotaan 69, 3, 1
EXEC admin_validasi_transaksi_keanggotaan 70, 6, 0
EXEC admin_validasi_transaksi_keanggotaan 71, 2, 0
EXEC admin_validasi_transaksi_keanggotaan 72, 1, 1
EXEC admin_validasi_transaksi_keanggotaan 73, 8, 0
EXEC admin_validasi_transaksi_keanggotaan 74, 3, 0
EXEC admin_validasi_transaksi_keanggotaan 75, 3, 1
EXEC admin_validasi_transaksi_keanggotaan 76, 3, 1
EXEC admin_validasi_transaksi_keanggotaan 77, 9, 1
EXEC admin_validasi_transaksi_keanggotaan 78, 10, 0
EXEC admin_validasi_transaksi_keanggotaan 79, 2, 1
EXEC admin_validasi_transaksi_keanggotaan 80, 2, 1
EXEC admin_validasi_transaksi_keanggotaan 81, 6, 0
EXEC admin_validasi_transaksi_keanggotaan 82, 4, 1
EXEC admin_validasi_transaksi_keanggotaan 83, 5, 0
EXEC admin_validasi_transaksi_keanggotaan 84, 7, 1
EXEC admin_validasi_transaksi_keanggotaan 85, 8, 1
EXEC admin_validasi_transaksi_keanggotaan 86, 6, 1
EXEC admin_validasi_transaksi_keanggotaan 87, 3, 1
EXEC admin_validasi_transaksi_keanggotaan 88, 9, 0
EXEC admin_validasi_transaksi_keanggotaan 89, 10, 0
EXEC admin_validasi_transaksi_keanggotaan 90, 1, 1
EXEC admin_validasi_transaksi_keanggotaan 91, 7, 1
EXEC admin_validasi_transaksi_keanggotaan 92, 7, 1
EXEC admin_validasi_transaksi_keanggotaan 93, 10, 1
EXEC admin_validasi_transaksi_keanggotaan 94, 9, 1
EXEC admin_validasi_transaksi_keanggotaan 95, 8, 0
EXEC admin_validasi_transaksi_keanggotaan 96, 8, 0
EXEC admin_validasi_transaksi_keanggotaan 97, 5, 0
EXEC admin_validasi_transaksi_keanggotaan 98, 2, 0
EXEC admin_validasi_transaksi_keanggotaan 99, 8, 1
EXEC admin_validasi_transaksi_keanggotaan 100, 8, 1

SELECT *
FROM Member
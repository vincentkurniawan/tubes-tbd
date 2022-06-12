/*
memasukan data transaksi yang dilakukan oleh member saat membeli keanggotaan
*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_transaksi_keanggotaan(
	@id_member INT,
	@id_keanggotaan INT,
	@tanggal_transaksi DATE
)
AS
	--cek ada tanggal nya ga
	IF (@tanggal_transaksi IS NULL) BEGIN
		SET @tanggal_transaksi = CONVERT(VARCHAR(8), GETDATE(), 112)
	END

	DECLARE @harga INT = (SELECT TOP 1 harga FROM Keanggotaan WHERE id_keanggotaan = @id_keanggotaan)
	INSERT INTO 
		Transaksi_Keanggotaan(harga_transaksi, tanggal_transaksi, status_validasi, id_member, id_admin, id_keanggotaan)
	VALUES
		(@harga, @tanggal_transaksi, 0, @id_member, NULL, @id_keanggotaan)


--kalau tanggal transaksi = NULL, artinya TODAY!
--EXEC member_transaksi_keanggotaan @id_member=3, @id_keanggotaan=3, @tanggal_transaksi=NULL

GO
EXEC member_transaksi_keanggotaan 1, 2, NULL
EXEC member_transaksi_keanggotaan 2, 2, NULL
EXEC member_transaksi_keanggotaan 3, 3, NULL
EXEC member_transaksi_keanggotaan 4, 3, NULL
EXEC member_transaksi_keanggotaan 5, 2, NULL
EXEC member_transaksi_keanggotaan 6, 2, NULL
EXEC member_transaksi_keanggotaan 7, 2, NULL
EXEC member_transaksi_keanggotaan 8, 2, NULL
EXEC member_transaksi_keanggotaan 9, 3, NULL
EXEC member_transaksi_keanggotaan 10, 2, NULL
EXEC member_transaksi_keanggotaan 11, 3, NULL
EXEC member_transaksi_keanggotaan 12, 3, NULL
EXEC member_transaksi_keanggotaan 13, 2, NULL
EXEC member_transaksi_keanggotaan 14, 2, NULL
EXEC member_transaksi_keanggotaan 15, 2, NULL
EXEC member_transaksi_keanggotaan 16, 2, NULL
EXEC member_transaksi_keanggotaan 17, 2, NULL
EXEC member_transaksi_keanggotaan 18, 2, NULL
EXEC member_transaksi_keanggotaan 19, 2, NULL
EXEC member_transaksi_keanggotaan 20, 3, NULL
EXEC member_transaksi_keanggotaan 21, 2, NULL
EXEC member_transaksi_keanggotaan 22, 2, NULL
EXEC member_transaksi_keanggotaan 23, 2, NULL
EXEC member_transaksi_keanggotaan 24, 3, NULL
EXEC member_transaksi_keanggotaan 25, 2, NULL
EXEC member_transaksi_keanggotaan 26, 2, NULL
EXEC member_transaksi_keanggotaan 27, 2, NULL
EXEC member_transaksi_keanggotaan 28, 2, NULL
EXEC member_transaksi_keanggotaan 29, 2, NULL
EXEC member_transaksi_keanggotaan 30, 3, NULL
EXEC member_transaksi_keanggotaan 31, 2, NULL
EXEC member_transaksi_keanggotaan 32, 2, NULL
EXEC member_transaksi_keanggotaan 33, 2, NULL
EXEC member_transaksi_keanggotaan 34, 3, NULL
EXEC member_transaksi_keanggotaan 35, 2, NULL
EXEC member_transaksi_keanggotaan 36, 2, NULL
EXEC member_transaksi_keanggotaan 37, 3, NULL
EXEC member_transaksi_keanggotaan 38, 2, NULL
EXEC member_transaksi_keanggotaan 39, 2, NULL
EXEC member_transaksi_keanggotaan 40, 3, NULL
EXEC member_transaksi_keanggotaan 41, 3, NULL
EXEC member_transaksi_keanggotaan 42, 3, NULL
EXEC member_transaksi_keanggotaan 43, 2, NULL
EXEC member_transaksi_keanggotaan 44, 3, NULL
EXEC member_transaksi_keanggotaan 45, 2, NULL
EXEC member_transaksi_keanggotaan 46, 2, NULL
EXEC member_transaksi_keanggotaan 47, 2, NULL
EXEC member_transaksi_keanggotaan 48, 3, NULL
EXEC member_transaksi_keanggotaan 49, 3, NULL
EXEC member_transaksi_keanggotaan 50, 3, NULL
EXEC member_transaksi_keanggotaan 51, 3, NULL
EXEC member_transaksi_keanggotaan 52, 2, NULL
EXEC member_transaksi_keanggotaan 53, 2, NULL
EXEC member_transaksi_keanggotaan 54, 3, NULL
EXEC member_transaksi_keanggotaan 55, 3, NULL
EXEC member_transaksi_keanggotaan 56, 3, NULL
EXEC member_transaksi_keanggotaan 57, 3, NULL
EXEC member_transaksi_keanggotaan 58, 3, NULL
EXEC member_transaksi_keanggotaan 59, 2, NULL
EXEC member_transaksi_keanggotaan 60, 3, NULL
EXEC member_transaksi_keanggotaan 61, 2, NULL
EXEC member_transaksi_keanggotaan 62, 3, NULL
EXEC member_transaksi_keanggotaan 63, 2, NULL
EXEC member_transaksi_keanggotaan 64, 2, NULL
EXEC member_transaksi_keanggotaan 65, 3, NULL
EXEC member_transaksi_keanggotaan 66, 2, NULL
EXEC member_transaksi_keanggotaan 67, 2, NULL
EXEC member_transaksi_keanggotaan 68, 3, NULL
EXEC member_transaksi_keanggotaan 69, 2, NULL
EXEC member_transaksi_keanggotaan 70, 2, NULL
EXEC member_transaksi_keanggotaan 71, 2, NULL
EXEC member_transaksi_keanggotaan 72, 2, NULL
EXEC member_transaksi_keanggotaan 73, 2, NULL
EXEC member_transaksi_keanggotaan 74, 2, NULL
EXEC member_transaksi_keanggotaan 75, 3, NULL
EXEC member_transaksi_keanggotaan 76, 2, NULL
EXEC member_transaksi_keanggotaan 77, 3, NULL
EXEC member_transaksi_keanggotaan 78, 3, NULL
EXEC member_transaksi_keanggotaan 79, 3, NULL
EXEC member_transaksi_keanggotaan 80, 2, NULL
EXEC member_transaksi_keanggotaan 1, 2, '20210101'
EXEC member_transaksi_keanggotaan 2, 2, '20210101'
EXEC member_transaksi_keanggotaan 3, 3, '20210101'
EXEC member_transaksi_keanggotaan 4, 3, '20210101'
EXEC member_transaksi_keanggotaan 5, 2, '20210101'
EXEC member_transaksi_keanggotaan 6, 2, '20210101'
EXEC member_transaksi_keanggotaan 7, 2, '20210101'
EXEC member_transaksi_keanggotaan 8, 2, '20210101'
EXEC member_transaksi_keanggotaan 9, 3, '20210101'
EXEC member_transaksi_keanggotaan 10, 2, '20210101'
EXEC member_transaksi_keanggotaan 11, 3, '20210101'
EXEC member_transaksi_keanggotaan 12, 3, '20210101'
EXEC member_transaksi_keanggotaan 13, 2, '20210101'
EXEC member_transaksi_keanggotaan 14, 2, '20210101'
EXEC member_transaksi_keanggotaan 15, 2, '20210101'
EXEC member_transaksi_keanggotaan 16, 2, '20210101'
EXEC member_transaksi_keanggotaan 17, 2, '20210101'
EXEC member_transaksi_keanggotaan 18, 2, '20210101'
EXEC member_transaksi_keanggotaan 19, 2, '20210101'
EXEC member_transaksi_keanggotaan 20, 3, '20210101'

SELECT *
FROM Transaksi_Keanggotaan
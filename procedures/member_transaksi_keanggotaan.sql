/**
- Member_Transaksi_Keanggotaan
param : id_member, id_keanggotaan, tanggal_transaksi
todo  : insert ke tabel Transaksi, dengan id admin yg memvalidasi di set default 0 (nantinya akan diupdate saat divalidasi) dan status validasi = 0. 
return: -
**note : tabel ini akan terlihat tidak normal krn mencatat harga yg dibayarkan ,
tapi akan mempercepat operasi analisis (jadi gabutuh join" lagi buat cek harga keanggotaannya)
**/
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
GO

--kalau tanggal transaksi = NULL, artinya TODAY!
--EXEC member_transaksi_keanggotaan @id_member=3, @id_keanggotaan=3, @tanggal_transaksi=NULL
SELECT * FROM Transaksi_Keanggotaan 
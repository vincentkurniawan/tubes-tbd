-- - Member_Transaksi_Keanggotaan
-- param : id_member, id_keanggotaan, tanggal_transaksi
-- todo  : insert ke tabel Transaksi, dengan id admin yg memvalidasi di set default 0 (nantinya akan diupdate saat divalidasi) dan status validasi = 0. 
-- return: -


CREATE PROCEDURE transaksi_keanggotaan (
	@id_member int,
	@id_keanggotaan int,
	@tanggal_transaksi date
)
AS
	DECLARE @price int
	SET @price = (SELECT harga_transaksi FROM Keanggotaan WHERE id_keanggotaan = @id_keanggotaan)
			
	INSERT INTO Transaksi_Keanggotaan (harga_transaksi, tanggal_transaksi, status_validasi, id_member, id_admin, id_keanggotaan)
	VALUES (@price, @tanggal_transaksi, 0, @id_member, 0, @id_keanggotaan)
	
	
EXEC transaksi_keanggotaan @id_member = 1, @id_keanggotaan = 1, @tanggal_transaksi = current_date


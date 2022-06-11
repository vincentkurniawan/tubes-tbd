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

--tes doang, jangan lupa ganti param sesuai isi db masing-masing.
EXEC admin_validasi_artikel_baru @id_artikel=14, @id_admin=1, @status_validasi=1
SELECT * FROM Transaksi_Keanggotaan;
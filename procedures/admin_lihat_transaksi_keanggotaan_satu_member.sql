/**
Melihat laporan transaksi keanggotaan dari salah satu member
Return keterangan lengkap (log) transaksi keanggotaan dari member terpilih
**/

GO
USE Perpustakaan

GO
CREATE PROCEDURE admin_lihat_transaksi_keanggotaan_satu_member(
	@id_member INT
)
AS
	IF(@id_member IS NULL)BEGIN
		SELECT * FROM Transaksi_Keanggotaan
	END
	ELSE
	BEGIN
		SELECT * FROM Transaksi_Keanggotaan WHERE id_member = @id_member
	END

GO
EXEC admin_lihat_transaksi_keanggotaan_satu_member @id_member=2
/**
Melihat laporan transaksi keanggotaan

- admin_lihat_transaksi_keanggotaan
param : id_member
todo  : select semua transaksi keanggotaan
return: -
**/

CREATE PROCEDURE admin_lihat_transaksi_keanggotaan(
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
EXEC admin_lihat_transaksi_keanggotaan @id_member=2
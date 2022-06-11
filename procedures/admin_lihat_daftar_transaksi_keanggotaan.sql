/**
admin melihat daftar transaksi keanggotaan seluruh member
**/

GO
USE Perpustakaan

GO
CREATE PROCEDURE admin_lihat_daftar_transaksi_keanggotaan
AS
	SELECT DISTINCT
		tk.id_transaksi, tk.tanggal_transaksi, m.nama as [nama member], k.harga, a.nama as [Validator]
	FROM 
		Transaksi_Keanggotaan tk INNER JOIN Keanggotaan k
		ON tk.id_keanggotaan = k.id_keanggotaan
		INNER JOIN Member m 
		ON tk.id_member = m.id_member 
		INNER JOIN Administrator a
		ON tk.id_admin = a.id_admin
GO

GO
EXEC admin_lihat_daftar_transaksi_keanggotaan

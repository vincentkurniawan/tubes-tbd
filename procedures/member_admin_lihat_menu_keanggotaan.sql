/*lihat seluruh daftar tipe keanggotaan*/

GO
USE Perpustakaan

GO 
CREATE PROCEDURE member_admin_lihat_menu_keanggotaan
AS
	SELECT DISTINCT
		id_keanggotaan, nama_keanggotaan, harga, durasi_hari, tanggal_berlaku, id_admin
	FROM 
		Keanggotaan
GO

GO
EXEC member_admin_lihat_menu_keanggotaan
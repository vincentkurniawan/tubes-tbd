/*lihat seluruh daftar artikel yang tersedia*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_admin_lihat_daftar_artikel
AS
	SELECT 
		id_artikel, nama_artikel, is_premium, path_artikel, tanggal_tulis
	FROM 
		Artikel
GO

GO
EXEC member_admin_lihat_daftar_artikel 
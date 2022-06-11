/**
- member memilih salah satu artikel untuk dibaca 
- admin memilih salah satu artikel untuk di cek dan nantinya bisa divalidasi
**/

GO 
USE Perpustakaan

GO 
CREATE PROCEDURE member_admin_pilih_artikel(
	@id_artikel INT
)
AS
	SELECT DISTINCT
		id_artikel, nama_artikel, is_premium, path_artikel, status_validasi, tanggal_tulis, id_admin
	FROM 
		Artikel
	WHERE 
		id_artikel = @id_artikel
GO

GO
EXEC member_admin_pilih_artikel 1
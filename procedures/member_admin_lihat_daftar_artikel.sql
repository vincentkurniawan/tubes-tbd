/*lihat seluruh daftar artikel yang tersedia*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_lihat_daftar_artikel
AS
	SELECT 
		*
	FROM 
		Artikel
GO
EXEC member_lihat_daftar_artikel
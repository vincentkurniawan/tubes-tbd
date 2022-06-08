/**
Melihat daftar artikel yang pernah ditulis beserta statusnya (diterima atau ditolak).

- member_lihat_daftar_artikel
param : id_member
todo  : select semua artikel yang pernah ditulis oleh member dengan id_member param
return: -
**/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_lihat_daftar_artikel(
	@id_member INT
)
AS
	SELECT 
		nama_artikel, status_validasi
	FROM 
		artikel
	WHERE
		artikel.id_penulis = @id_member
GO

GO
EXEC member_lihat_daftar_artikel @id_member=1
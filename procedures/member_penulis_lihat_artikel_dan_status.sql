/*
member dapat melihat artikel" yang pernah ditulisnya, beserta status validasi admin thd artikel tsb
return tabel berisi artikel" yang pernah ditulis oleh member penulis
*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_penulis_lihat_artikel_dan_status (@id_member INT)
AS
    SELECT id_artikel, is_premium, nama_artikel, path_artikel, status_validasi, tanggal_tulis, id_penulis, id_admin
    FROM dbo.Artikel WHERE Artikel.id_penulis = @id_member

GO
EXEC member_penulis_lihat_artikel_dan_status 2
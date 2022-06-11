GO
USE Perpustakaan

GO
CREATE PROCEDURE penulis_lihat_artikelnya (@id_member INT)
AS
    SELECT id_artikel, is_premium, nama_artikel, path_artikel, status_validasi, tanggal_tulis, id_penulis, id_admin
    FROM dbo.Artikel WHERE Artikel.id_penulis = @id_member

GO
EXEC penulis_lihat_artikelnya 2
GO
USE Perpustakaan

GO
ALTER FUNCTION member_get_artikel (@id_member INT)
RETURNS @res TABLE 
(
    id_artikel INT,
    is_premium INT,
    nama_artikel VARCHAR(500),
    path_artikel VARCHAR(500),
    status_validasi INT,
    tanggal_tulis DATE,
    id_penulis INT,
    id_admin INT
)
BEGIN
    INSERT INTO @res
    SELECT id_artikel, is_premium, nama_artikel, path_artikel, status_validasi, tanggal_tulis, id_penulis, id_admin
    FROM dbo.Artikel WHERE Artikel.id_penulis = @id_member
    RETURN
END

GO
SELECT *
FROM dbo.member_get_artikel (1)
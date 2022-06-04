GO
USE Perpustakaan

GO
ALTER PROCEDURE pencarian_artikel
(
    @kategori VARCHAR(500),
    @judul VARCHAR(500),
    @penulis VARCHAR(500)
)
AS

DECLARE @filtered_kategori TABLE
(
    id_artikel INT,
    is_premium INT,
    path_artikel VARCHAR(500),
    status_validasi INT,
    tanggal_tulis DATE,
    id_penulis INT,
    id_admin INT
)

IF (@kategori IS NOT NULL)
BEGIN
    -- MENGGABUNGKAN HASIL STRING SPLIT DENGAN TABEL KATEGORI
    INSERT INTO @filtered_kategori 
        SELECT DISTINCT Kategori.id_kategori, Kategori.nama_kategori
        FROM    string_split(@kategori, ',') AS splitted INNER JOIN Kategori ON splitted.[value] = Kategori.id_kategori
                INNER JOIN 
END
ELSE
BEGIN
    INSERT INTO @filtered_kategori
        SELECT id_artikel, is_premium, path_artikel, status_validasi, tanggal_tulis, id_penulis, id_admin
        FROM Artikel
END




-- TESTING
SELECT *
FROM @filtered_kategori

GO
EXEC pencarian_artikel 'vincent,k,nadia','haha','tes'
GO
USE Perpustakaan

GO
CREATE FUNCTION get_filtered_artikel (@kategori VARCHAR(500))
RETURNS @filtered_artikel TABLE 
(
    id_artikel INT,
    is_premium INT,
    nama_artikel VARCHAR(500),
    path_artikel VARCHAR(500),
    status_validasi INT,
    tanggal_tulis DATE,
    id_penulis INT,
    id_admin INT,
    nama_penulis VARCHAR(500)
)
BEGIN
    IF (@kategori IS NOT NULL) BEGIN
        INSERT INTO @filtered_artikel
            SELECT DISTINCT Artikel.id_artikel, Artikel.is_premium, Artikel.nama_artikel, Artikel.path_artikel, Artikel.status_validasi, Artikel.tanggal_tulis, Artikel.id_penulis, Artikel.id_admin, Member.nama
            FROM    string_split(@kategori, ',') AS splitted INNER JOIN Kategori ON splitted.[value] = Kategori.nama_kategori
                    INNER JOIN Artikel_Kategori ON Kategori.id_kategori = Artikel_Kategori.id_kategori
                    INNER JOIN Artikel ON Artikel.id_artikel = Artikel_Kategori.id_artikel
                    INNER JOIN Member ON Artikel.id_penulis = Member.id_member
    END
    ELSE BEGIN
        INSERT INTO @filtered_artikel
            SELECT Artikel.id_artikel, is_premium, nama_artikel, path_artikel, status_validasi, tanggal_tulis, id_penulis, id_admin, Member.nama
            FROM Artikel INNER JOIN Member ON Artikel.id_penulis = Member.id_member
    END
    RETURN
END

GO
CREATE PROCEDURE pencarian_artikel
(
    @kategori VARCHAR(500),
    @judul VARCHAR(500),
    @penulis VARCHAR(500)
)
AS

DECLARE
@query NVARCHAR(500) = 'SELECT * FROM dbo.get_filtered_artikel(',
@check BIT = 0

IF (@kategori IS NULL) BEGIN
    set @query = CONCAT (@query, 'NULL')
END
ELSE BEGIN
    set @query = CONCAT (@query, '''', @kategori, '''')
END

set @query = CONCAT(@query, ')')

PRINT @query

IF (@judul IS NOT NULL) BEGIN
    set @query = CONCAT(@query, 'WHERE nama_artikel = ''', @judul, ''' ')
    set @check = 1
END

IF (@penulis IS NOT NULL) BEGIN
    IF (@check = 1) BEGIN
        set @query = CONCAT(@query, 'AND nama_penulis = ''', @penulis, ''' ')
    END
    ELSE BEGIN
        set @query = CONCAT(@query, 'WHERE nama_penulis = ''', @penulis, ''' ')
    END
END

EXEC sp_executesql @query

GO
EXEC pencarian_artikel 'Romance,Action,Comedy',NULL,NULL
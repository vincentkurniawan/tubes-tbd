/**
Admin filter artikel berdasarkan status validasi
Return daftar artikel hasil filter 
**/

GO
USE Perpustakaan

GO
CREATE FUNCTION admin_get_filtered_artikel (@kategori VARCHAR(500))
    RETURNS @filtered_artikel TABLE 
    (
        id_artikel INT,
        is_premium INT,
        nama_artikel VARCHAR(500),
        path_artikel VARCHAR(500),
        tanggal_tulis DATE,
        id_penulis INT,
        id_admin INT,
        nama_penulis VARCHAR(500),
        status_validasi INT
    )
    BEGIN
        IF (@kategori IS NOT NULL) BEGIN
            INSERT INTO @filtered_artikel
                SELECT DISTINCT Artikel.id_artikel, Artikel.is_premium, Artikel.nama_artikel, Artikel.path_artikel, Artikel.tanggal_tulis, Artikel.id_penulis, Artikel.id_admin, Member.nama, Artikel.status_validasi
                FROM    string_split(@kategori, ',') AS splitted INNER JOIN Kategori ON splitted.[value] = Kategori.nama_kategori
                        INNER JOIN Artikel_Kategori ON Kategori.id_kategori = Artikel_Kategori.id_kategori
                        INNER JOIN Artikel ON Artikel.id_artikel = Artikel_Kategori.id_artikel
                        INNER JOIN Member ON Artikel.id_penulis = Member.id_member
        END
        ELSE BEGIN
            INSERT INTO @filtered_artikel
                SELECT id_artikel, is_premium, nama_artikel, path_artikel, tanggal_tulis, id_penulis, id_admin, Member.nama, status_validasi
                FROM Artikel INNER JOIN Member ON Artikel.id_penulis = Member.id_member
        END
        RETURN
    END

GO
ALTER PROCEDURE admin_filter_artikel
    (
        @kategori VARCHAR(500),
        @judul VARCHAR(500),
        @penulis VARCHAR(500),
        @status_validasi INT
    )
    AS

    DECLARE
    @query NVARCHAR(500) = 'SELECT * FROM dbo.admin_get_filtered_artikel(',
    @check INT = 0

    IF (@kategori IS NULL) BEGIN
        set @query = CONCAT (@query, 'NULL')
    END
    ELSE BEGIN
        set @query = CONCAT (@query, '''', @kategori, '''')
    END

    set @query = CONCAT(@query, ')')

    PRINT @query

    IF (@judul IS NOT NULL) BEGIN
        set @query = CONCAT(@query, 'WHERE nama_artikel LIKE ''%', @judul, '%'' ')
        set @check += 1
    END

    IF (@penulis IS NOT NULL) BEGIN
        IF (@check > 0) BEGIN
            set @query = CONCAT(@query, 'AND nama_penulis LIKE ''%', @penulis, '%'' ')
        END
        ELSE BEGIN
            set @query = CONCAT(@query, 'WHERE nama_penulis LIKE ''%', @penulis, '%'' ')
        END
        set @check += 1
    END

    IF (@status_validasi IS NOT NULL) BEGIN
        IF (@check > 0) BEGIN
            set @query = CONCAT(@query, 'AND status_validasi = ', @status_validasi)
        END
        ELSE BEGIN
            set @query = CONCAT(@query, 'WHERE status_validasi = ', @status_validasi)
        END
    END

    EXEC sp_executesql @query

GO
EXEC admin_filter_artikel NULL,NULL,NULL,1
EXEC admin_filter_artikel 'Romance',NULL,NULL,1
EXEC admin_filter_artikel NULL,'as',NULL,NULL
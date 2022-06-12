GO
USE Perpustakaan

GO
CREATE PROCEDURE member_lihat_jumlah_favorit_artikel (@id_artikel INT)
AS
    IF (@id_artikel IS NULL) BEGIN
        SELECT id_artikel, COUNT (id_artikel) as 'jumlah favorit'
        FROM Favorit
        GROUP BY id_artikel
        ORDER BY [jumlah favorit] DESC
    END
    ELSE BEGIN
        SELECT @id_artikel AS 'id_artikel', COUNT (id_artikel) as 'jumlah favorit'
        FROM Favorit
        WHERE id_artikel = @id_artikel
        GROUP BY id_artikel
    END
    

GO
EXEC member_lihat_jumlah_favorit_artikel 14
EXEC member_lihat_jumlah_favorit_artikel NULL
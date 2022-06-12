USE Perpustakaan

GO
CREATE PROCEDURE member_lihat_review_artikel (@id_artikel INT)
AS

    SELECT komentar, rating, tanggal_review, Pengguna.username
    FROM Review INNER JOIN Member ON Review.id_member = Member.id_member
        INNER JOIN Pengguna ON Member.id_pengguna = Pengguna.id_pengguna
    WHERE id_artikel = @id_artikel
    ORDER BY tanggal_review

GO
EXEC member_lihat_review_artikel 5
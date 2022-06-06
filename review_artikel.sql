--Member_Review_Artikel 
--param : id_member, id_artikel, tanggal review, rating, komentar
--todo  : cek apakah member dengan id tersebut sudah pernah melakukan review thd artikel dgn id_artikel di parameter? kalau sudah, brati tinggal update aja tanggal review, rating dan komentarnya. 
--Sebaliknya kalau belum pernah, berati insert new entry di tabel Review berdasarkan parameter yang diterima
--return: - 

/*blm dynamic*/
CREATE PROCEDURE review_artikel (
	@id_member INT, 
	@id_artikel INT, 
	@tanggal_review DATE,
	@rating INT,
	@komentar VARCHAR(2000)
)
AS
	DECLARE @is_favorite BIT
	IF EXISTS (SELECT * FROM Review WHERE id_member = @id_member AND id_artikel = @id_artikel)
    BEGIN
		--update review terbaru
		UPDATE Review
		SET tanggal_review = @tanggal_review, rating = @rating, komentar = @komentar
		WHERE id_member = @id_member AND id_artikel = @id_artikel
    END
    ELSE
	BEGIN
		--update tambah ke review
		INSERT INTO Review (komentar, rating, tanggal_review, id_member, id_artikel) 
		VALUES (@komentar, @rating, @tanggal_review, @id_member, @id_artikel)
	END
GO

--EXEC review_artikel 'Lucu bgtzzzzz', 4, '20220602', 3, 4
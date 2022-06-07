--Member_Review_Artikel 
--param : id_member, id_artikel, tanggal review, rating, komentar
--todo  : cek apakah member dengan id tersebut sudah pernah melakukan review thd artikel dgn id_artikel di parameter? kalau sudah, brati tinggal update aja tanggal review, rating dan komentarnya. 
--Sebaliknya kalau belum pernah, berati insert new entry di tabel Review berdasarkan parameter yang diterima
--return: - 

ALTER PROCEDURE member_review_artikel (
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
		IF @komentar = ''
		BEGIN
			--Komentar ga diupdate krn review terbaru ga kasih komentar
			UPDATE Review
			SET tanggal_review = @tanggal_review, rating = @rating
			WHERE id_member = @id_member AND id_artikel = @id_artikel
		END
		ELSE
		BEGIN 
			--komentar diupdate
			UPDATE Review
			SET tanggal_review = @tanggal_review, rating = @rating, komentar = @komentar
			WHERE id_member = @id_member AND id_artikel = @id_artikel
		END 
    END
    ELSE
	BEGIN
		--update tambah ke review
		INSERT INTO Review (komentar, rating, tanggal_review, id_member, id_artikel) 
		VALUES (@komentar, @rating, @tanggal_review, @id_member, @id_artikel)
	END
GO

/*
EXEC member_review_artikel 2, 5, '20220607', 4, 'Lucu bgtzzzzz'
EXEC member_review_artikel 2, 5, '20220607', 3, ''
EXEC member_review_artikel 2, 5, '20220607', 4, 'AHAHAHAHAH'
*/
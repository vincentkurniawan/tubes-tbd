/*member dapat melakukan review dan memberi rating / komentar thd suatu artikel*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_review_artikel (
	@id_member INT, 
	@id_artikel INT, 
	@tanggal_review DATE,
	@rating INT,
	@komentar VARCHAR(2000)
)
AS
	DECLARE @is_favorite BIT

	IF @tanggal_review IS NULL BEGIN
		SET @tanggal_review = CONVERT(VARCHAR(8), GETDATE(), 112)
	END

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

EXEC member_review_artikel 38, 22, NULL, 2, 'OMGG'
EXEC member_review_artikel 39, 96, NULL, 4, 'ASTAGAAA'
EXEC member_review_artikel 98, 19, NULL, 3, 'YAAMPUNN'
EXEC member_review_artikel 45, 75, NULL, 4, 'HAHAHAHA'
EXEC member_review_artikel 82, 95, NULL, 3, 'ASTAGAAA'
EXEC member_review_artikel 31, 99, NULL, 4, 'WKWKWKKW'
EXEC member_review_artikel 22, 5, NULL, 1, 'ASTAGAAA'
EXEC member_review_artikel 48, 34, NULL, 4, 'HAHAHAHA'
EXEC member_review_artikel 34, 90, NULL, 1, 'HAHAHAHA'
EXEC member_review_artikel 74, 66, NULL, 3, 'YAAMPUNN'
EXEC member_review_artikel 71, 16, NULL, 3, 'YAAMPUNN'
EXEC member_review_artikel 11, 56, NULL, 4, 'VIRAL GA SIH???'
EXEC member_review_artikel 3, 30, NULL, 1, 'OMGG'
EXEC member_review_artikel 35, 31, NULL, 3, 'VIRAL GA SIH???'
EXEC member_review_artikel 31, 63, NULL, 5, 'ASTAGAAA'
EXEC member_review_artikel 44, 34, NULL, 5, 'IHH UCHULL'
EXEC member_review_artikel 72, 87, NULL, 3, 'IHH UCHULL'
EXEC member_review_artikel 48, 83, NULL, 4, 'YAAMPUNN'
EXEC member_review_artikel 52, 8, NULL, 1, 'YAAMPUNN'
EXEC member_review_artikel 47, 11, NULL, 2, 'YAAMPUNN'
EXEC member_review_artikel 14, 60, NULL, 1, 'YAAMPUNN'
EXEC member_review_artikel 69, 71, NULL, 4, 'WKWKWKKW'
EXEC member_review_artikel 2, 35, NULL, 3, 'WKWKWKKW'
EXEC member_review_artikel 60, 14, NULL, 3, 'OMGG'
EXEC member_review_artikel 34, 12, NULL, 3, 'HAHAHAHA'
EXEC member_review_artikel 75, 28, NULL, 4, 'IHH UCHULL'
EXEC member_review_artikel 25, 43, NULL, 3, 'ASTAGAAA'
EXEC member_review_artikel 89, 72, NULL, 2, 'ASTAGAAA'
EXEC member_review_artikel 46, 79, NULL, 4, 'YAAMPUNN'
EXEC member_review_artikel 23, 38, NULL, 2, ''
EXEC member_review_artikel 88, 25, NULL, 3, 'IHH UCHULL'
EXEC member_review_artikel 31, 78, NULL, 4, 'ASTAGAAA'
EXEC member_review_artikel 83, 7, NULL, 2, 'OMGG'
EXEC member_review_artikel 37, 17, NULL, 4, 'IHH UCHULL'
EXEC member_review_artikel 98, 58, NULL, 5, 'YAAMPUNN'
EXEC member_review_artikel 100, 21, NULL, 1, 'OMGG'
EXEC member_review_artikel 85, 58, NULL, 2, 'WKWKWKKW'
EXEC member_review_artikel 35, 90, NULL, 1, 'OMGG'
EXEC member_review_artikel 13, 49, NULL, 2, 'ASTAGAAA'
EXEC member_review_artikel 85, 40, NULL, 1, 'HAHAHAHA'
EXEC member_review_artikel 71, 99, NULL, 2, 'VIRAL GA SIH???'
EXEC member_review_artikel 43, 35, NULL, 2, 'VIRAL GA SIH???'
EXEC member_review_artikel 73, 30, NULL, 5, 'YAAMPUNN'
EXEC member_review_artikel 24, 59, NULL, 5, 'WKWKWKKW'
EXEC member_review_artikel 56, 38, NULL, 2, 'WKWKWKKW'
EXEC member_review_artikel 43, 70, NULL, 3, 'YAAMPUNN'
EXEC member_review_artikel 18, 28, NULL, 4, 'IHH UCHULL'
EXEC member_review_artikel 64, 49, NULL, 2, 'YAAMPUNN'
EXEC member_review_artikel 80, 14, NULL, 3, 'VIRAL GA SIH???'
EXEC member_review_artikel 36, 62, NULL, 2, 'HAHAHAHA'
EXEC member_review_artikel 79, 31, NULL, 1, 'ASTAGAAA'
EXEC member_review_artikel 51, 37, NULL, 2, 'YAAMPUNN'
EXEC member_review_artikel 24, 44, NULL, 4, 'OMGG'
EXEC member_review_artikel 66, 3, NULL, 2, 'ASTAGAAA'
EXEC member_review_artikel 79, 21, NULL, 1, 'WKWKWKKW'
EXEC member_review_artikel 37, 19, NULL, 5, 'WKWKWKKW'
EXEC member_review_artikel 87, 79, NULL, 1, 'YAAMPUNN'
EXEC member_review_artikel 60, 33, NULL, 4, 'OMGG'
EXEC member_review_artikel 16, 10, NULL, 4, ''
EXEC member_review_artikel 52, 28, NULL, 5, 'IHH UCHULL'
EXEC member_review_artikel 87, 30, NULL, 5, 'WKWKWKKW'
EXEC member_review_artikel 72, 67, NULL, 5, 'ASTAGAAA'
EXEC member_review_artikel 93, 93, NULL, 2, 'WKWKWKKW'
EXEC member_review_artikel 62, 56, NULL, 2, 'OMGG'
EXEC member_review_artikel 79, 38, NULL, 2, 'VIRAL GA SIH???'
EXEC member_review_artikel 67, 32, NULL, 2, 'IHH UCHULL'
EXEC member_review_artikel 80, 50, NULL, 5, 'ASTAGAAA'
EXEC member_review_artikel 92, 20, NULL, 1, 'HAHAHAHA'
EXEC member_review_artikel 50, 18, NULL, 4, ''
EXEC member_review_artikel 53, 47, NULL, 3, ''
EXEC member_review_artikel 89, 14, NULL, 5, 'IHH UCHULL'
EXEC member_review_artikel 85, 92, NULL, 1, 'HAHAHAHA'
EXEC member_review_artikel 32, 89, NULL, 3, 'ASTAGAAA'
EXEC member_review_artikel 26, 46, NULL, 5, 'OMGG'
EXEC member_review_artikel 69, 12, NULL, 2, 'WKWKWKKW'
EXEC member_review_artikel 29, 45, NULL, 5, ''
EXEC member_review_artikel 92, 44, NULL, 4, 'IHH UCHULL'
EXEC member_review_artikel 81, 50, NULL, 1, 'YAAMPUNN'
EXEC member_review_artikel 46, 47, NULL, 3, 'ASTAGAAA'
EXEC member_review_artikel 11, 96, NULL, 3, 'OMGG'
EXEC member_review_artikel 1, 86, NULL, 4, 'HAHAHAHA'
EXEC member_review_artikel 90, 48, NULL, 5, 'IHH UCHULL'
EXEC member_review_artikel 30, 45, NULL, 5, 'OMGG'
EXEC member_review_artikel 58, 35, NULL, 1, 'IHH UCHULL'
EXEC member_review_artikel 82, 93, NULL, 4, 'WKWKWKKW'
EXEC member_review_artikel 34, 47, NULL, 4, 'YAAMPUNN'
EXEC member_review_artikel 43, 14, NULL, 2, 'WKWKWKKW'
EXEC member_review_artikel 50, 56, NULL, 5, 'VIRAL GA SIH???'
EXEC member_review_artikel 21, 52, NULL, 1, 'WKWKWKKW'
EXEC member_review_artikel 21, 50, NULL, 3, 'OMGG'
EXEC member_review_artikel 32, 97, NULL, 4, ''
EXEC member_review_artikel 49, 13, NULL, 3, 'YAAMPUNN'
EXEC member_review_artikel 82, 30, NULL, 4, 'WKWKWKKW'
EXEC member_review_artikel 17, 93, NULL, 5, 'YAAMPUNN'
EXEC member_review_artikel 67, 37, NULL, 5, 'YAAMPUNN'
EXEC member_review_artikel 74, 67, NULL, 3, 'HAHAHAHA'
EXEC member_review_artikel 7, 86, NULL, 4, ''
EXEC member_review_artikel 89, 29, NULL, 4, 'ASTAGAAA'
EXEC member_review_artikel 97, 84, NULL, 2, 'HAHAHAHA'
EXEC member_review_artikel 43, 73, NULL, 3, 'YAAMPUNN'

SELECT *
FROM Review
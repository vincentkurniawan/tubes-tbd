/*mencatat keterangan / log kapan suatu artikel dibaca oleh member*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_catat_log_baca_artikel (
	--@tanggal_baca DATE, -> gajadi parameter
	@id_member INT,
	@id_artikel INT
)
AS
	DECLARE @tanggal_baca DATETIME = CONVERT(DATE, GETDATE())
	INSERT INTO Membaca (tanggal_baca, id_member, id_artikel) 
	VALUES (@tanggal_baca, @id_member, @id_artikel)
GO

EXEC member_baca_artikel 9, 57
EXEC member_baca_artikel 53, 61
EXEC member_baca_artikel 93, 47
EXEC member_baca_artikel 47, 78
EXEC member_baca_artikel 87, 79
EXEC member_baca_artikel 16, 66
EXEC member_baca_artikel 9, 72
EXEC member_baca_artikel 87, 86
EXEC member_baca_artikel 48, 67
EXEC member_baca_artikel 94, 58
EXEC member_baca_artikel 7, 44
EXEC member_baca_artikel 25, 2
EXEC member_baca_artikel 44, 37
EXEC member_baca_artikel 61, 45
EXEC member_baca_artikel 76, 13
EXEC member_baca_artikel 36, 36
EXEC member_baca_artikel 18, 48
EXEC member_baca_artikel 91, 84
EXEC member_baca_artikel 67, 54
EXEC member_baca_artikel 4, 45
EXEC member_baca_artikel 39, 62
EXEC member_baca_artikel 13, 55
EXEC member_baca_artikel 22, 13
EXEC member_baca_artikel 72, 34
EXEC member_baca_artikel 95, 9
EXEC member_baca_artikel 39, 35
EXEC member_baca_artikel 100, 7
EXEC member_baca_artikel 75, 99
EXEC member_baca_artikel 78, 85
EXEC member_baca_artikel 28, 98
EXEC member_baca_artikel 74, 5
EXEC member_baca_artikel 18, 22
EXEC member_baca_artikel 35, 19
EXEC member_baca_artikel 81, 79
EXEC member_baca_artikel 63, 83
EXEC member_baca_artikel 39, 27
EXEC member_baca_artikel 46, 59
EXEC member_baca_artikel 87, 19
EXEC member_baca_artikel 38, 60
EXEC member_baca_artikel 98, 66
EXEC member_baca_artikel 54, 23
EXEC member_baca_artikel 68, 42
EXEC member_baca_artikel 66, 36
EXEC member_baca_artikel 31, 17
EXEC member_baca_artikel 47, 68
EXEC member_baca_artikel 83, 89
EXEC member_baca_artikel 51, 14
EXEC member_baca_artikel 48, 14
EXEC member_baca_artikel 88, 60
EXEC member_baca_artikel 65, 92
EXEC member_baca_artikel 72, 73
EXEC member_baca_artikel 9, 11
EXEC member_baca_artikel 22, 53
EXEC member_baca_artikel 4, 82
EXEC member_baca_artikel 80, 79
EXEC member_baca_artikel 90, 34
EXEC member_baca_artikel 42, 95
EXEC member_baca_artikel 60, 78
EXEC member_baca_artikel 56, 62
EXEC member_baca_artikel 49, 65
EXEC member_baca_artikel 47, 63
EXEC member_baca_artikel 8, 77
EXEC member_baca_artikel 6, 24
EXEC member_baca_artikel 98, 19
EXEC member_baca_artikel 88, 90
EXEC member_baca_artikel 67, 68
EXEC member_baca_artikel 84, 48
EXEC member_baca_artikel 69, 64
EXEC member_baca_artikel 90, 4
EXEC member_baca_artikel 68, 29
EXEC member_baca_artikel 86, 62
EXEC member_baca_artikel 55, 85
EXEC member_baca_artikel 10, 91
EXEC member_baca_artikel 77, 2
EXEC member_baca_artikel 51, 63
EXEC member_baca_artikel 11, 69
EXEC member_baca_artikel 19, 33
EXEC member_baca_artikel 97, 26
EXEC member_baca_artikel 25, 98
EXEC member_baca_artikel 70, 84
EXEC member_baca_artikel 11, 2
EXEC member_baca_artikel 99, 18
EXEC member_baca_artikel 35, 94
EXEC member_baca_artikel 44, 86
EXEC member_baca_artikel 43, 24
EXEC member_baca_artikel 79, 33
EXEC member_baca_artikel 37, 97
EXEC member_baca_artikel 100, 57
EXEC member_baca_artikel 29, 88
EXEC member_baca_artikel 93, 34
EXEC member_baca_artikel 49, 29
EXEC member_baca_artikel 11, 96
EXEC member_baca_artikel 92, 49
EXEC member_baca_artikel 61, 61
EXEC member_baca_artikel 3, 27
EXEC member_baca_artikel 67, 30
EXEC member_baca_artikel 17, 74
EXEC member_baca_artikel 47, 94
EXEC member_baca_artikel 81, 76
EXEC member_baca_artikel 6, 49

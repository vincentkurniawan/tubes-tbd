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

EXEC member_catat_log_baca_artikel 7, 80
EXEC member_catat_log_baca_artikel 78, 2
EXEC member_catat_log_baca_artikel 45, 32
EXEC member_catat_log_baca_artikel 54, 54
EXEC member_catat_log_baca_artikel 61, 99
EXEC member_catat_log_baca_artikel 46, 50
EXEC member_catat_log_baca_artikel 67, 65
EXEC member_catat_log_baca_artikel 16, 71
EXEC member_catat_log_baca_artikel 59, 36
EXEC member_catat_log_baca_artikel 98, 76
EXEC member_catat_log_baca_artikel 63, 99
EXEC member_catat_log_baca_artikel 35, 52
EXEC member_catat_log_baca_artikel 42, 41
EXEC member_catat_log_baca_artikel 29, 34
EXEC member_catat_log_baca_artikel 97, 34
EXEC member_catat_log_baca_artikel 75, 82
EXEC member_catat_log_baca_artikel 40, 63
EXEC member_catat_log_baca_artikel 51, 59
EXEC member_catat_log_baca_artikel 64, 85
EXEC member_catat_log_baca_artikel 2, 31
EXEC member_catat_log_baca_artikel 40, 45
EXEC member_catat_log_baca_artikel 52, 1
EXEC member_catat_log_baca_artikel 97, 94
EXEC member_catat_log_baca_artikel 76, 97
EXEC member_catat_log_baca_artikel 24, 100
EXEC member_catat_log_baca_artikel 62, 70
EXEC member_catat_log_baca_artikel 11, 28
EXEC member_catat_log_baca_artikel 80, 74
EXEC member_catat_log_baca_artikel 51, 52
EXEC member_catat_log_baca_artikel 62, 92
EXEC member_catat_log_baca_artikel 31, 92
EXEC member_catat_log_baca_artikel 56, 90
EXEC member_catat_log_baca_artikel 51, 99
EXEC member_catat_log_baca_artikel 70, 15
EXEC member_catat_log_baca_artikel 41, 35
EXEC member_catat_log_baca_artikel 31, 59
EXEC member_catat_log_baca_artikel 10, 4
EXEC member_catat_log_baca_artikel 75, 49
EXEC member_catat_log_baca_artikel 20, 85
EXEC member_catat_log_baca_artikel 97, 31
EXEC member_catat_log_baca_artikel 61, 84
EXEC member_catat_log_baca_artikel 59, 5
EXEC member_catat_log_baca_artikel 84, 76
EXEC member_catat_log_baca_artikel 95, 25
EXEC member_catat_log_baca_artikel 6, 96
EXEC member_catat_log_baca_artikel 28, 8
EXEC member_catat_log_baca_artikel 28, 16
EXEC member_catat_log_baca_artikel 74, 64
EXEC member_catat_log_baca_artikel 88, 59
EXEC member_catat_log_baca_artikel 45, 47
EXEC member_catat_log_baca_artikel 50, 80
EXEC member_catat_log_baca_artikel 5, 38
EXEC member_catat_log_baca_artikel 17, 54
EXEC member_catat_log_baca_artikel 25, 19
EXEC member_catat_log_baca_artikel 51, 84
EXEC member_catat_log_baca_artikel 15, 58
EXEC member_catat_log_baca_artikel 16, 21
EXEC member_catat_log_baca_artikel 78, 19
EXEC member_catat_log_baca_artikel 91, 43
EXEC member_catat_log_baca_artikel 82, 11
EXEC member_catat_log_baca_artikel 93, 12
EXEC member_catat_log_baca_artikel 45, 63
EXEC member_catat_log_baca_artikel 10, 63
EXEC member_catat_log_baca_artikel 61, 73
EXEC member_catat_log_baca_artikel 62, 33
EXEC member_catat_log_baca_artikel 87, 65
EXEC member_catat_log_baca_artikel 47, 55
EXEC member_catat_log_baca_artikel 1, 83
EXEC member_catat_log_baca_artikel 21, 55
EXEC member_catat_log_baca_artikel 73, 72
EXEC member_catat_log_baca_artikel 8, 19
EXEC member_catat_log_baca_artikel 33, 56
EXEC member_catat_log_baca_artikel 22, 29
EXEC member_catat_log_baca_artikel 97, 33
EXEC member_catat_log_baca_artikel 34, 59
EXEC member_catat_log_baca_artikel 37, 8
EXEC member_catat_log_baca_artikel 61, 12
EXEC member_catat_log_baca_artikel 34, 84
EXEC member_catat_log_baca_artikel 34, 15
EXEC member_catat_log_baca_artikel 80, 58
EXEC member_catat_log_baca_artikel 11, 85
EXEC member_catat_log_baca_artikel 55, 41
EXEC member_catat_log_baca_artikel 38, 52
EXEC member_catat_log_baca_artikel 1, 48
EXEC member_catat_log_baca_artikel 63, 98
EXEC member_catat_log_baca_artikel 65, 27
EXEC member_catat_log_baca_artikel 81, 8
EXEC member_catat_log_baca_artikel 60, 86
EXEC member_catat_log_baca_artikel 20, 96
EXEC member_catat_log_baca_artikel 99, 71
EXEC member_catat_log_baca_artikel 62, 38
EXEC member_catat_log_baca_artikel 98, 27
EXEC member_catat_log_baca_artikel 32, 86
EXEC member_catat_log_baca_artikel 64, 23
EXEC member_catat_log_baca_artikel 19, 93
EXEC member_catat_log_baca_artikel 74, 32
EXEC member_catat_log_baca_artikel 13, 51
EXEC member_catat_log_baca_artikel 72, 17
EXEC member_catat_log_baca_artikel 6, 68
EXEC member_catat_log_baca_artikel 24, 78

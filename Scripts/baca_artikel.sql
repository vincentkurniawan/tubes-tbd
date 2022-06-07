-- - Member_Baca_Artikel
-- param : tanggal_baca (get current date), id_member yg membaca, dan id_artikel yg dipilih untuk dibaca
-- todo  : insert entry ke tabel membaca artikel (log baca)
-- return: - / isi log baca artikel


CREATE PROCEDURE baca_artikel (
	@tanggal_baca date,
	@id_member int,
	@id_artikel int
)
AS
	INSERT INTO Membaca (tanggal_baca, id_member, id_artikel)
	VALUES (@tanggal_baca, @id_member, @id_artikel)
	
	SELECT *
	FROM Membaca

	
EXEC baca_artikel @tanggal_baca = current_date, @id_member = 1, @id_artikel = 5


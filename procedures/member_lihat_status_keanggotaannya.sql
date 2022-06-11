GO
USE Perpustakaan

GO
CREATE PROCEDURE member_lihat_status_keanggotaan_pribadi(
	@id_member INT
)
AS
	SELECT DISTINCT
		m.status_keanggotaan, k.nama_keanggotaan, k.harga
	FROM
		Member m INNER JOIN Keanggotaan k ON m.status_keanggotaan = k.id_keanggotaan
	WHERE 
		m.id_member = @id_member
GO

GO
EXEC member_lihat_status_keanggotaan_pribadi @id_member = 1
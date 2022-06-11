GO
USE Perpustakaan

GO
CREATE PROCEDURE admin_melihat_daftar_anggota
AS 
    SELECT id_member, nama, nama_keanggotaan
    FROM Member INNER JOIN Keanggotaan ON status_keanggotaan = id_keanggotaan
    RETURN

GO
EXEC daftar_anggota
  
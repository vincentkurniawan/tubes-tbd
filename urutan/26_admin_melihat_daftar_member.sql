/**
Admin melihat daftar keseluruhan member
return tabel berisi daftar keseluruhan member
**/

GO
USE Perpustakaan

GO
CREATE PROCEDURE admin_melihat_daftar_member
AS 
    SELECT id_member, nama, nama_keanggotaan
    FROM Member INNER JOIN Keanggotaan ON status_keanggotaan = id_keanggotaan
GO

GO
EXEC admin_melihat_daftar_member
  
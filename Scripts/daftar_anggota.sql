
ALTER FUNCTION daftar_anggota()
    RETURNS @DaftarAnggota TABLE (
    	id_member int,
    	nama varchar(255),
    	nama_keanggotaan varchar(255)
    )
    BEGIN
        INSERT INTO @DaftarAnggota
        SELECT id_member, nama, nama_keanggotaan
        FROM Member INNER JOIN Keanggotaan ON status_keanggotaan = id_keanggotaan
        RETURN
    END
    
  
SELECT id_member, nama, nama_keanggotaan
FROM daftar_anggota()
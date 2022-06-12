GO
USE Perpustakaan

GO
CREATE PROCEDURE admin_validasi_status_aktif_keanggotaan
(
    @id_member INT
)
AS
    DECLARE @tanggal DATE, @days INT, @id_keanggotaan INT
    SET @tanggal = 
    (
        SELECT TOP 1 tanggal_transaksi 
        FROM Transaksi_Keanggotaan 
        WHERE id_member = @id_member
        ORDER BY tanggal_transaksi DESC
    )
    SET @id_keanggotaan = 
    (
        SELECT TOP 1 id_keanggotaan
        FROM Transaksi_Keanggotaan
        WHERE id_member = @id_member
        ORDER BY tanggal_transaksi DESC
    )
    IF @tanggal IS NOT NULL BEGIN
        set @days = 
            DATEDIFF(DAY, GETDATE(), @tanggal) + 
            (
                SELECT durasi_hari
                FROM Keanggotaan 
                WHERE id_keanggotaan = @id_keanggotaan
            )
        PRINT @days
        RETURN @days
    END
    ELSE BEGIN
        UPDATE Member
        SET status_keanggotaan = 1
        WHERE id_member = @id_member
        PRINT -1
        RETURN -1
    END

GO
EXEC admin_validasi_status_aktif_keanggotaan 1
EXEC admin_validasi_status_aktif_keanggotaan 2
EXEC admin_validasi_status_aktif_keanggotaan 3
EXEC admin_validasi_status_aktif_keanggotaan 4
EXEC admin_validasi_status_aktif_keanggotaan 5
EXEC admin_validasi_status_aktif_keanggotaan 6
EXEC admin_validasi_status_aktif_keanggotaan 7
EXEC admin_validasi_status_aktif_keanggotaan 8
EXEC admin_validasi_status_aktif_keanggotaan 9
EXEC admin_validasi_status_aktif_keanggotaan 10
EXEC admin_validasi_status_aktif_keanggotaan 11
EXEC admin_validasi_status_aktif_keanggotaan 12
EXEC admin_validasi_status_aktif_keanggotaan 13
EXEC admin_validasi_status_aktif_keanggotaan 14
EXEC admin_validasi_status_aktif_keanggotaan 15
EXEC admin_validasi_status_aktif_keanggotaan 16
EXEC admin_validasi_status_aktif_keanggotaan 17
EXEC admin_validasi_status_aktif_keanggotaan 18
EXEC admin_validasi_status_aktif_keanggotaan 19
EXEC admin_validasi_status_aktif_keanggotaan 20
EXEC admin_validasi_status_aktif_keanggotaan 21
EXEC admin_validasi_status_aktif_keanggotaan 22
EXEC admin_validasi_status_aktif_keanggotaan 23
EXEC admin_validasi_status_aktif_keanggotaan 24
EXEC admin_validasi_status_aktif_keanggotaan 25
EXEC admin_validasi_status_aktif_keanggotaan 26
EXEC admin_validasi_status_aktif_keanggotaan 27
EXEC admin_validasi_status_aktif_keanggotaan 28
EXEC admin_validasi_status_aktif_keanggotaan 29
EXEC admin_validasi_status_aktif_keanggotaan 30
EXEC admin_validasi_status_aktif_keanggotaan 31
EXEC admin_validasi_status_aktif_keanggotaan 32
EXEC admin_validasi_status_aktif_keanggotaan 33
EXEC admin_validasi_status_aktif_keanggotaan 34
EXEC admin_validasi_status_aktif_keanggotaan 35
EXEC admin_validasi_status_aktif_keanggotaan 36
EXEC admin_validasi_status_aktif_keanggotaan 37
EXEC admin_validasi_status_aktif_keanggotaan 38
EXEC admin_validasi_status_aktif_keanggotaan 39
EXEC admin_validasi_status_aktif_keanggotaan 40
EXEC admin_validasi_status_aktif_keanggotaan 41
EXEC admin_validasi_status_aktif_keanggotaan 42
EXEC admin_validasi_status_aktif_keanggotaan 43
EXEC admin_validasi_status_aktif_keanggotaan 44
EXEC admin_validasi_status_aktif_keanggotaan 45
EXEC admin_validasi_status_aktif_keanggotaan 46
EXEC admin_validasi_status_aktif_keanggotaan 47
EXEC admin_validasi_status_aktif_keanggotaan 48
EXEC admin_validasi_status_aktif_keanggotaan 49
EXEC admin_validasi_status_aktif_keanggotaan 50
EXEC admin_validasi_status_aktif_keanggotaan 51
EXEC admin_validasi_status_aktif_keanggotaan 52
EXEC admin_validasi_status_aktif_keanggotaan 53
EXEC admin_validasi_status_aktif_keanggotaan 54
EXEC admin_validasi_status_aktif_keanggotaan 55
EXEC admin_validasi_status_aktif_keanggotaan 56
EXEC admin_validasi_status_aktif_keanggotaan 57
EXEC admin_validasi_status_aktif_keanggotaan 58
EXEC admin_validasi_status_aktif_keanggotaan 59
EXEC admin_validasi_status_aktif_keanggotaan 60
EXEC admin_validasi_status_aktif_keanggotaan 61
EXEC admin_validasi_status_aktif_keanggotaan 62
EXEC admin_validasi_status_aktif_keanggotaan 63
EXEC admin_validasi_status_aktif_keanggotaan 64
EXEC admin_validasi_status_aktif_keanggotaan 65
EXEC admin_validasi_status_aktif_keanggotaan 66
EXEC admin_validasi_status_aktif_keanggotaan 67
EXEC admin_validasi_status_aktif_keanggotaan 68
EXEC admin_validasi_status_aktif_keanggotaan 69
EXEC admin_validasi_status_aktif_keanggotaan 70
EXEC admin_validasi_status_aktif_keanggotaan 71
EXEC admin_validasi_status_aktif_keanggotaan 72
EXEC admin_validasi_status_aktif_keanggotaan 73
EXEC admin_validasi_status_aktif_keanggotaan 74
EXEC admin_validasi_status_aktif_keanggotaan 75
EXEC admin_validasi_status_aktif_keanggotaan 76
EXEC admin_validasi_status_aktif_keanggotaan 77
EXEC admin_validasi_status_aktif_keanggotaan 78
EXEC admin_validasi_status_aktif_keanggotaan 79
EXEC admin_validasi_status_aktif_keanggotaan 80
EXEC admin_validasi_status_aktif_keanggotaan 81
EXEC admin_validasi_status_aktif_keanggotaan 82
EXEC admin_validasi_status_aktif_keanggotaan 83
EXEC admin_validasi_status_aktif_keanggotaan 84
EXEC admin_validasi_status_aktif_keanggotaan 85
EXEC admin_validasi_status_aktif_keanggotaan 86
EXEC admin_validasi_status_aktif_keanggotaan 87
EXEC admin_validasi_status_aktif_keanggotaan 88
EXEC admin_validasi_status_aktif_keanggotaan 89
EXEC admin_validasi_status_aktif_keanggotaan 90
EXEC admin_validasi_status_aktif_keanggotaan 91
EXEC admin_validasi_status_aktif_keanggotaan 92
EXEC admin_validasi_status_aktif_keanggotaan 93
EXEC admin_validasi_status_aktif_keanggotaan 94
EXEC admin_validasi_status_aktif_keanggotaan 95
EXEC admin_validasi_status_aktif_keanggotaan 96
EXEC admin_validasi_status_aktif_keanggotaan 97
EXEC admin_validasi_status_aktif_keanggotaan 98
EXEC admin_validasi_status_aktif_keanggotaan 99
EXEC admin_validasi_status_aktif_keanggotaan 100
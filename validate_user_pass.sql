USE Perpustakaan

GO
ALTER FUNCTION validate_user_pass (@username VARCHAR(255), @pass VARCHAR(255))
    RETURNS BIT
        BEGIN
            IF EXISTS (SELECT * FROM Pengguna WHERE username = @username AND pass = @pass)
            BEGIN
                RETURN 1
            END
            RETURN 0
        END

-- EXAMPLE INPUT
GO
PRINT dbo.validate_user_pass('vincent', '222')
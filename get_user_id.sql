USE Perpustakaan

GO
CREATE FUNCTION get_user_id (@username VARCHAR(255), @pass VARCHAR(255))
    RETURNS INT
        BEGIN
            IF EXISTS (SELECT * FROM Pengguna WHERE username = @username AND pass = @pass)
            BEGIN
                RETURN 1
            END
            RETURN 0
        END

-- EXAMPLE INPUT
GO
IF (dbo.validate_user_pass = 1)
BEGIN
    PRINT dbo.get_user_id('vincent', '222')
END

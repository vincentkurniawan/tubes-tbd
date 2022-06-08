GO
USE Perpustakaan

GO
CREATE FUNCTION validate_user_pass (@username VARCHAR(255), @pass VARCHAR(255))
    RETURNS BIT
        BEGIN
            IF EXISTS (SELECT * FROM Pengguna WHERE username = @username AND pass = @pass)
            BEGIN
                RETURN 1
            END
            RETURN 0
        END

GO
ALTER PROCEDURE member_admin_login (@username VARCHAR(255), @pass VARCHAR(255)) 
AS
    IF (dbo.validate_user_pass(@username, @pass) = 0) BEGIN
        RETURN 0
    END

    SELECT  Administrator.id_admin, Member.id_member
    FROM    Pengguna LEFT OUTER JOIN Administrator ON Pengguna.id_pengguna = Administrator.id_pengguna
            LEFT OUTER JOIN Member ON Pengguna.id_pengguna = Member.id_pengguna
    WHERE   Pengguna.username = @username

GO
EXEC member_admin_login 'member1','member1x'
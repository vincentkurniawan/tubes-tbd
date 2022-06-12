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

GO
--jika ditemukan id user dengan pass yang sesuai, maka akan mengembalikan dua kolom, yaitu id_admin dan id_member
--salah satu kolom akan bernilai NULL sesuai dengan privileges yang dimiliki id tersebut
--misal jika id tersebut adalah id admin, maka id_admin akan terisi dan value dari kolom id_member akan bernilai null

--namun jika tidak ditemukan, SP tidak akan mengembalikan apapun (return 0)
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
GO
USE Perpustakaan

GO
INSERT INTO Pengguna (username, pass)
VALUES 
    ('admin1', 'admin1x'),
    ('admin2', 'admin2x'),
    ('admin3', 'admin3x'),
    ('admin4', 'admin4x'),
    ('admin5', 'admin5x'),
    ('admin6', 'admin6x'),
    ('admin7', 'admin7x'),
    ('admin8', 'admin8x'),
    ('admin9', 'admin9x'),
    ('admin10', 'admin10x')

GO
INSERT INTO Administrator (nama, id_pengguna)
VALUES 
	('Admin Vincent', (SELECT id_pengguna FROM Pengguna WHERE username = 'admin1')),
	('Admin Nadia', (SELECT id_pengguna FROM Pengguna WHERE username = 'admin2')),
	('Admin Kevin', (SELECT id_pengguna FROM Pengguna WHERE username = 'admin3')),
    ('Admin Tasha', (SELECT id_pengguna FROM Pengguna WHERE username = 'admin4')),
    ('Admin Kezia', (SELECT id_pengguna FROM Pengguna WHERE username = 'admin5')),
    ('Admin Nando', (SELECT id_pengguna FROM Pengguna WHERE username = 'admin6')),
    ('Admin Jayden', (SELECT id_pengguna FROM Pengguna WHERE username = 'admin7')),
    ('Admin Jason', (SELECT id_pengguna FROM Pengguna WHERE username = 'admin8')),
    ('Admin Kimmy', (SELECT id_pengguna FROM Pengguna WHERE username = 'admin9')),
    ('Admin Rose', (SELECT id_pengguna FROM Pengguna WHERE username = 'admin10'))
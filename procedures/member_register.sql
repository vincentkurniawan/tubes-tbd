/*memasukan data member baru melalui fitur register*/

GO
USE Perpustakaan

GO
ALTER PROCEDURE member_register (
	@username VARCHAR(255), 
	@pass VARCHAR(255), 
	@nama VARCHAR(255), 
	@email VARCHAR(255), 
	@telp VARCHAR(255), 
	@alamat VARCHAR(255),
	@nama_kota VARCHAR(255)
)
AS
	DECLARE
	@id_pengguna INT,
	@id_kota INT,
	@keanggotaan INT = 1 --Default keanggotaan Free -> 1

        IF EXISTS (SELECT * FROM Pengguna WHERE username = @username)
        BEGIN
            RETURN 1
        END
		ELSE IF EXISTS (SELECT * FROM Member WHERE email = @email)
		BEGIN
            RETURN 1
        END
		ELSE 
		BEGIN 
			INSERT INTO Pengguna(username, pass) 
			VALUES (@username, @pass)

			--ambil id pengguna
			SELECT @id_pengguna = id_pengguna
			FROM Pengguna
			WHERE username = @username

			--ambil id kota
			SELECT @id_kota = id_kota
			FROM Kota
			WHERE nama_kota = @nama_kota

			INSERT INTO Member(nama, email, telp, alamat, status_keanggotaan, id_kota, id_pengguna)
			VALUES (@nama, @email, @telp, @alamat, @keanggotaan, @id_kota, @id_pengguna)
		END
        RETURN 0

GO
EXEC member_register 'zira', 'wuqoyusa', 'zira rikeri', 'zira@gmail.com', '614232216857', 'Jl. Juanda No. 0', 'Shanghai'
EXEC member_register 'qemu', 'gikafoxi', 'qemu modego', 'qemu@gmail.com', '742779319865', 'Jl. Juanda No. 1', 'Seoul'
EXEC member_register 'site', 'nikozasu', 'site naqeqo', 'site@gmail.com', '344606618496', 'Jl. Juanda No. 2', 'Aarhus'
EXEC member_register 'giro', 'fusosuju', 'giro xiwobe', 'giro@gmail.com', '420973726016', 'Jl. Juanda No. 3', 'Bandung'
EXEC member_register 'pimu', 'zilatuca', 'pimu jenici', 'pimu@gmail.com', '359981826603', 'Jl. Juanda No. 4', 'Venesia'
EXEC member_register 'zazi', 'wawuzota', 'zazi mipelu', 'zazi@gmail.com', '618984143988', 'Jl. Juanda No. 5', 'Brussel'
EXEC member_register 'qogi', 'potozemi', 'qogi kulese', 'qogi@gmail.com', '996834849925', 'Jl. Juanda No. 6', 'Kabul'
EXEC member_register 'nobo', 'qupobofa', 'nobo sosulu', 'nobo@gmail.com', '228289078158', 'Jl. Juanda No. 7', 'Port Royal'
EXEC member_register 'gepu', 'wabekewo', 'gepu kimezo', 'gepu@gmail.com', '119762952003', 'Jl. Juanda No. 8', 'Brasilia'
EXEC member_register 'neme', 'facicivo', 'neme nijizu', 'neme@gmail.com', '196982554912', 'Jl. Juanda No. 9', 'Hverageroi'
EXEC member_register 'nago', 'pogeruvi', 'nago bugabe', 'nago@gmail.com', '582544161633', 'Jl. Juanda No. 10', 'Oslo'
EXEC member_register 'vayi', 'siloteke', 'vayi nekezu', 'vayi@gmail.com', '503649293440', 'Jl. Juanda No. 11', 'Hamburg'
EXEC member_register 'zuyo', 'cihorafe', 'zuyo wawupu', 'zuyo@gmail.com', '429307787303', 'Jl. Juanda No. 12', 'Alaminos'
EXEC member_register 'cizi', 'wogigibo', 'cizi rohejo', 'cizi@gmail.com', '535122264070', 'Jl. Juanda No. 13', 'San Salvador'
EXEC member_register 'jupa', 'gorawiya', 'jupa sukuha', 'jupa@gmail.com', '482168314849', 'Jl. Juanda No. 14', 'Kuala Lumpur'
EXEC member_register 'naja', 'tapalelo', 'naja tujira', 'naja@gmail.com', '745798302236', 'Jl. Juanda No. 15', 'Bergen'
EXEC member_register 'zena', 'gakepene', 'zena jijaqu', 'zena@gmail.com', '301290388577', 'Jl. Juanda No. 16', 'Paris'
EXEC member_register 'foro', 'risihoye', 'foro daboba', 'foro@gmail.com', '145620356667', 'Jl. Juanda No. 17', 'Budapest'
EXEC member_register 'bibe', 'redikiqe', 'bibe sebuva', 'bibe@gmail.com', '265324442792', 'Jl. Juanda No. 18', 'Osaka'
EXEC member_register 'dihe', 'cibadolu', 'dihe cetuwe', 'dihe@gmail.com', '645308913474', 'Jl. Juanda No. 19', 'Pyongyang'
EXEC member_register 'qoqa', 'pohakena', 'qoqa wiwiqo', 'qoqa@gmail.com', '363035280722', 'Jl. Juanda No. 20', 'Roma'
EXEC member_register 'suwa', 'kacijago', 'suwa tekuda', 'suwa@gmail.com', '254139582796', 'Jl. Juanda No. 21', 'Osaka'
EXEC member_register 'gize', 'hamubiro', 'gize diteyu', 'gize@gmail.com', '874568077431', 'Jl. Juanda No. 22', 'Pyongyang'
EXEC member_register 'gepa', 'vuqujuxe', 'gepa horaha', 'gepa@gmail.com', '328748143552', 'Jl. Juanda No. 23', 'Kissidougou'
EXEC member_register 'pohi', 'sadumayo', 'pohi nagoji', 'pohi@gmail.com', '703133709558', 'Jl. Juanda No. 24', 'Roma'
EXEC member_register 'ximo', 'vufuyodo', 'ximo setuse', 'ximo@gmail.com', '930087635658', 'Jl. Juanda No. 25', 'Lisboa'
EXEC member_register 'guno', 'tucemale', 'guno cajeve', 'guno@gmail.com', '542532682663', 'Jl. Juanda No. 26', 'Benin City'
EXEC member_register 'juje', 'rabaresu', 'juje meveni', 'juje@gmail.com', '510151760024', 'Jl. Juanda No. 27', 'Vik i Myrdal'
EXEC member_register 'towi', 'citukupe', 'towi cupoyo', 'towi@gmail.com', '088051436392', 'Jl. Juanda No. 28', 'Kabul'
EXEC member_register 'qubi', 'futiseko', 'qubi todeta', 'qubi@gmail.com', '425389287014', 'Jl. Juanda No. 29', 'Bago'
EXEC member_register 'repo', 'funuvaju', 'repo xajaxu', 'repo@gmail.com', '824504405115', 'Jl. Juanda No. 30', 'Riyadh'
EXEC member_register 'zaho', 'pimefoqe', 'zaho yojoho', 'zaho@gmail.com', '154137358569', 'Jl. Juanda No. 31', 'Kabul'
EXEC member_register 'joqo', 'fatuxomu', 'joqo bajeye', 'joqo@gmail.com', '714061214952', 'Jl. Juanda No. 32', 'Bogota'
EXEC member_register 'puca', 'nobegovi', 'puca negedu', 'puca@gmail.com', '460362458812', 'Jl. Juanda No. 33', 'New York'
EXEC member_register 'kuwo', 'hudijuno', 'kuwo meyone', 'kuwo@gmail.com', '382627578278', 'Jl. Juanda No. 34', 'Phnom Penh'
EXEC member_register 'hiho', 'mititaxi', 'hiho qecono', 'hiho@gmail.com', '609589000725', 'Jl. Juanda No. 35', 'Tel Aviv'
EXEC member_register 'piwu', 'xezezuko', 'piwu xaraqo', 'piwu@gmail.com', '054721499030', 'Jl. Juanda No. 36', 'Alaminos'
EXEC member_register 'papi', 'yixorufe', 'papi zajili', 'papi@gmail.com', '408815232466', 'Jl. Juanda No. 37', 'Sao Paolo'
EXEC member_register 'giqa', 'huyemuya', 'giqa gagayu', 'giqa@gmail.com', '634905391288', 'Jl. Juanda No. 38', 'Toronto'
EXEC member_register 'qoca', 'jucapida', 'qoca nuzina', 'qoca@gmail.com', '212779554034', 'Jl. Juanda No. 39', 'Vohemar'
EXEC member_register 'fiwu', 'mixijaxo', 'fiwu zuweso', 'fiwu@gmail.com', '660727264713', 'Jl. Juanda No. 40', 'Bandung'
EXEC member_register 'sefo', 'hojorani', 'sefo babuxi', 'sefo@gmail.com', '347881638761', 'Jl. Juanda No. 41', 'Busan'
EXEC member_register 'liri', 'havayigo', 'liri naqegu', 'liri@gmail.com', '491573342201', 'Jl. Juanda No. 42', 'Doha'
EXEC member_register 'liwa', 'muvaficu', 'liwa huwizi', 'liwa@gmail.com', '670818303620', 'Jl. Juanda No. 43', 'Tokyo'
EXEC member_register 'zowe', 'qozaxewa', 'zowe qofede', 'zowe@gmail.com', '895556630088', 'Jl. Juanda No. 44', 'Gramsh'
EXEC member_register 'lohe', 'rakinizi', 'lohe luwoqi', 'lohe@gmail.com', '584739519028', 'Jl. Juanda No. 45', 'San Salvador'
EXEC member_register 'nemo', 'lamasuso', 'nemo vuciwa', 'nemo@gmail.com', '823210407590', 'Jl. Juanda No. 46', 'Patan'
EXEC member_register 'neta', 'gotevoqa', 'neta sekamo', 'neta@gmail.com', '899942087873', 'Jl. Juanda No. 47', 'Osaka'
EXEC member_register 'yibu', 'mesenazo', 'yibu fibeyo', 'yibu@gmail.com', '605496082740', 'Jl. Juanda No. 48', 'Phnom Penh'
EXEC member_register 'nexe', 'fuvomece', 'nexe gosuhi', 'nexe@gmail.com', '791586394538', 'Jl. Juanda No. 49', 'Yerusalem'
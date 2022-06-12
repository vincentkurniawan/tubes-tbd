/*memasukan data member baru melalui fitur register*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE register (
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
EXEC register 'zira', 'wuqoyusa', 'zira rikeri', 'zira@gmail.com', '614232216857', 'Jl. Juanda No. 0', 'Shanghai'
EXEC register 'qemu', 'gikafoxi', 'qemu modego', 'qemu@gmail.com', '742779319865', 'Jl. Juanda No. 1', 'Seoul'
EXEC register 'site', 'nikozasu', 'site naqeqo', 'site@gmail.com', '344606618496', 'Jl. Juanda No. 2', 'Aarhus'
EXEC register 'giro', 'fusosuju', 'giro xiwobe', 'giro@gmail.com', '420973726016', 'Jl. Juanda No. 3', 'Bandung'
EXEC register 'pimu', 'zilatuca', 'pimu jenici', 'pimu@gmail.com', '359981826603', 'Jl. Juanda No. 4', 'Venesia'
EXEC register 'zazi', 'wawuzota', 'zazi mipelu', 'zazi@gmail.com', '618984143988', 'Jl. Juanda No. 5', 'Brussel'
EXEC register 'qogi', 'potozemi', 'qogi kulese', 'qogi@gmail.com', '996834849925', 'Jl. Juanda No. 6', 'Kabul'
EXEC register 'nobo', 'qupobofa', 'nobo sosulu', 'nobo@gmail.com', '228289078158', 'Jl. Juanda No. 7', 'Port Royal'
EXEC register 'gepu', 'wabekewo', 'gepu kimezo', 'gepu@gmail.com', '119762952003', 'Jl. Juanda No. 8', 'Brasilia'
EXEC register 'neme', 'facicivo', 'neme nijizu', 'neme@gmail.com', '196982554912', 'Jl. Juanda No. 9', 'Hverageroi'
EXEC register 'nago', 'pogeruvi', 'nago bugabe', 'nago@gmail.com', '582544161633', 'Jl. Juanda No. 10', 'Oslo'
EXEC register 'vayi', 'siloteke', 'vayi nekezu', 'vayi@gmail.com', '503649293440', 'Jl. Juanda No. 11', 'Hamburg'
EXEC register 'zuyo', 'cihorafe', 'zuyo wawupu', 'zuyo@gmail.com', '429307787303', 'Jl. Juanda No. 12', 'Alaminos'
EXEC register 'cizi', 'wogigibo', 'cizi rohejo', 'cizi@gmail.com', '535122264070', 'Jl. Juanda No. 13', 'San Salvador'
EXEC register 'jupa', 'gorawiya', 'jupa sukuha', 'jupa@gmail.com', '482168314849', 'Jl. Juanda No. 14', 'Kuala Lumpur'
EXEC register 'naja', 'tapalelo', 'naja tujira', 'naja@gmail.com', '745798302236', 'Jl. Juanda No. 15', 'Bergen'
EXEC register 'zena', 'gakepene', 'zena jijaqu', 'zena@gmail.com', '301290388577', 'Jl. Juanda No. 16', 'Paris'
EXEC register 'foro', 'risihoye', 'foro daboba', 'foro@gmail.com', '145620356667', 'Jl. Juanda No. 17', 'Budapest'
EXEC register 'bibe', 'redikiqe', 'bibe sebuva', 'bibe@gmail.com', '265324442792', 'Jl. Juanda No. 18', 'Osaka'
EXEC register 'dihe', 'cibadolu', 'dihe cetuwe', 'dihe@gmail.com', '645308913474', 'Jl. Juanda No. 19', 'Pyongyang'
EXEC register 'qoqa', 'pohakena', 'qoqa wiwiqo', 'qoqa@gmail.com', '363035280722', 'Jl. Juanda No. 20', 'Roma'
EXEC register 'suwa', 'kacijago', 'suwa tekuda', 'suwa@gmail.com', '254139582796', 'Jl. Juanda No. 21', 'Osaka'
EXEC register 'gize', 'hamubiro', 'gize diteyu', 'gize@gmail.com', '874568077431', 'Jl. Juanda No. 22', 'Pyongyang'
EXEC register 'gepa', 'vuqujuxe', 'gepa horaha', 'gepa@gmail.com', '328748143552', 'Jl. Juanda No. 23', 'Kissidougou'
EXEC register 'pohi', 'sadumayo', 'pohi nagoji', 'pohi@gmail.com', '703133709558', 'Jl. Juanda No. 24', 'Roma'
EXEC register 'ximo', 'vufuyodo', 'ximo setuse', 'ximo@gmail.com', '930087635658', 'Jl. Juanda No. 25', 'Lisboa'
EXEC register 'guno', 'tucemale', 'guno cajeve', 'guno@gmail.com', '542532682663', 'Jl. Juanda No. 26', 'Benin City'
EXEC register 'juje', 'rabaresu', 'juje meveni', 'juje@gmail.com', '510151760024', 'Jl. Juanda No. 27', 'Vik i Myrdal'
EXEC register 'towi', 'citukupe', 'towi cupoyo', 'towi@gmail.com', '088051436392', 'Jl. Juanda No. 28', 'Kabul'
EXEC register 'qubi', 'futiseko', 'qubi todeta', 'qubi@gmail.com', '425389287014', 'Jl. Juanda No. 29', 'Bago'
EXEC register 'repo', 'funuvaju', 'repo xajaxu', 'repo@gmail.com', '824504405115', 'Jl. Juanda No. 30', 'Riyadh'
EXEC register 'zaho', 'pimefoqe', 'zaho yojoho', 'zaho@gmail.com', '154137358569', 'Jl. Juanda No. 31', 'Kabul'
EXEC register 'joqo', 'fatuxomu', 'joqo bajeye', 'joqo@gmail.com', '714061214952', 'Jl. Juanda No. 32', 'Bogota'
EXEC register 'puca', 'nobegovi', 'puca negedu', 'puca@gmail.com', '460362458812', 'Jl. Juanda No. 33', 'New York'
EXEC register 'kuwo', 'hudijuno', 'kuwo meyone', 'kuwo@gmail.com', '382627578278', 'Jl. Juanda No. 34', 'Phnom Penh'
EXEC register 'hiho', 'mititaxi', 'hiho qecono', 'hiho@gmail.com', '609589000725', 'Jl. Juanda No. 35', 'Tel Aviv'
EXEC register 'piwu', 'xezezuko', 'piwu xaraqo', 'piwu@gmail.com', '054721499030', 'Jl. Juanda No. 36', 'Alaminos'
EXEC register 'papi', 'yixorufe', 'papi zajili', 'papi@gmail.com', '408815232466', 'Jl. Juanda No. 37', 'Sao Paolo'
EXEC register 'giqa', 'huyemuya', 'giqa gagayu', 'giqa@gmail.com', '634905391288', 'Jl. Juanda No. 38', 'Toronto'
EXEC register 'qoca', 'jucapida', 'qoca nuzina', 'qoca@gmail.com', '212779554034', 'Jl. Juanda No. 39', 'Vohemar'
EXEC register 'fiwu', 'mixijaxo', 'fiwu zuweso', 'fiwu@gmail.com', '660727264713', 'Jl. Juanda No. 40', 'Bandung'
EXEC register 'sefo', 'hojorani', 'sefo babuxi', 'sefo@gmail.com', '347881638761', 'Jl. Juanda No. 41', 'Busan'
EXEC register 'liri', 'havayigo', 'liri naqegu', 'liri@gmail.com', '491573342201', 'Jl. Juanda No. 42', 'Doha'
EXEC register 'liwa', 'muvaficu', 'liwa huwizi', 'liwa@gmail.com', '670818303620', 'Jl. Juanda No. 43', 'Tokyo'
EXEC register 'zowe', 'qozaxewa', 'zowe qofede', 'zowe@gmail.com', '895556630088', 'Jl. Juanda No. 44', 'Gramsh'
EXEC register 'lohe', 'rakinizi', 'lohe luwoqi', 'lohe@gmail.com', '584739519028', 'Jl. Juanda No. 45', 'San Salvador'
EXEC register 'nemo', 'lamasuso', 'nemo vuciwa', 'nemo@gmail.com', '823210407590', 'Jl. Juanda No. 46', 'Patan'
EXEC register 'neta', 'gotevoqa', 'neta sekamo', 'neta@gmail.com', '899942087873', 'Jl. Juanda No. 47', 'Osaka'
EXEC register 'yibu', 'mesenazo', 'yibu fibeyo', 'yibu@gmail.com', '605496082740', 'Jl. Juanda No. 48', 'Phnom Penh'
EXEC register 'nexe', 'fuvomece', 'nexe gosuhi', 'nexe@gmail.com', '791586394538', 'Jl. Juanda No. 49', 'Yerusalem'
EXEC register 'yogu', 'gayoxode', 'yogu desire', 'yogu@gmail.com', '192631597026', 'Jl. Juanda No. 50', 'Vohemar'
EXEC register 'gizi', 'lotapawo', 'gizi botoke', 'gizi@gmail.com', '505909354272', 'Jl. Juanda No. 51', 'Basra'
EXEC register 'rigi', 'vekijubo', 'rigi yivevu', 'rigi@gmail.com', '266584037831', 'Jl. Juanda No. 52', 'Marseille'
EXEC register 'fidi', 'silenepi', 'fidi robenu', 'fidi@gmail.com', '432538327068', 'Jl. Juanda No. 53', 'Bangkok'
EXEC register 'feru', 'dogoyahu', 'feru wohipa', 'feru@gmail.com', '529126170152', 'Jl. Juanda No. 54', 'New Delhi'
EXEC register 'duwa', 'woveroce', 'duwa cedaju', 'duwa@gmail.com', '949875648687', 'Jl. Juanda No. 55', 'Paris'
EXEC register 'zava', 'wumacona', 'zava falilu', 'zava@gmail.com', '707412183571', 'Jl. Juanda No. 56', 'Oslo'
EXEC register 'jiko', 'bodidona', 'jiko winoti', 'jiko@gmail.com', '371275344551', 'Jl. Juanda No. 57', 'Hamburg'
EXEC register 'vebe', 'doxatoqo', 'vebe nebuya', 'vebe@gmail.com', '393936554050', 'Jl. Juanda No. 58', 'Azua'
EXEC register 'mare', 'kubifafa', 'mare vawami', 'mare@gmail.com', '800683064370', 'Jl. Juanda No. 59', 'Pretoria'
EXEC register 'giji', 'degokoke', 'giji rugeni', 'giji@gmail.com', '212288874005', 'Jl. Juanda No. 60', 'New Delhi'
EXEC register 'quro', 'dukapeli', 'quro wogiko', 'quro@gmail.com', '048439249057', 'Jl. Juanda No. 61', 'Patan'
EXEC register 'yile', 'lasawaxa', 'yile naduto', 'yile@gmail.com', '625763859302', 'Jl. Juanda No. 62', 'Zacatecas'
EXEC register 'devi', 'xuhelowi', 'devi coxivo', 'devi@gmail.com', '130417721313', 'Jl. Juanda No. 63', 'Toronto'
EXEC register 'saqa', 'gagixeza', 'saqa qoqiqu', 'saqa@gmail.com', '758409443584', 'Jl. Juanda No. 64', 'Brasilia'
EXEC register 'yaxo', 'samifaja', 'yaxo soxaxu', 'yaxo@gmail.com', '487402354166', 'Jl. Juanda No. 65', 'Santo Domingo'
EXEC register 'tapu', 'bimutofe', 'tapu woponi', 'tapu@gmail.com', '165013260574', 'Jl. Juanda No. 66', 'Espoo'
EXEC register 'xute', 'perabibu', 'xute vaholo', 'xute@gmail.com', '356959883951', 'Jl. Juanda No. 67', 'Bago'
EXEC register 'heso', 'jexohobu', 'heso husije', 'heso@gmail.com', '617306025607', 'Jl. Juanda No. 68', 'Bergen'
EXEC register 'bata', 'sovaqapo', 'bata zawalu', 'bata@gmail.com', '372793638106', 'Jl. Juanda No. 69', 'Mumbai'
EXEC register 'lisa', 'didasevu', 'lisa tokavu', 'lisa@gmail.com', '133529048573', 'Jl. Juanda No. 70', 'San Jose'
EXEC register 'pada', 'rivejopo', 'pada biyuxo', 'pada@gmail.com', '282558124988', 'Jl. Juanda No. 71', 'Lisboa'
EXEC register 'nici', 'saqoqaja', 'nici xuqogu', 'nici@gmail.com', '924904498532', 'Jl. Juanda No. 72', 'Hverageroi'
EXEC register 'favi', 'surohiwo', 'favi diloga', 'favi@gmail.com', '012107668058', 'Jl. Juanda No. 73', 'Brasilia'
EXEC register 'dumi', 'jidivawo', 'dumi periki', 'dumi@gmail.com', '795929130819', 'Jl. Juanda No. 74', 'Bangkok'
EXEC register 'nazu', 'daxenape', 'nazu tubaxi', 'nazu@gmail.com', '043231027713', 'Jl. Juanda No. 75', 'Dukhan'
EXEC register 'kigo', 'cotuwewa', 'kigo laniga', 'kigo@gmail.com', '151717949800', 'Jl. Juanda No. 76', 'Tokyo'
EXEC register 'gova', 'qumocoze', 'gova wireme', 'gova@gmail.com', '086571028355', 'Jl. Juanda No. 77', 'Conakry'
EXEC register 'qenu', 'yotidodo', 'qenu tedoso', 'qenu@gmail.com', '897919589693', 'Jl. Juanda No. 78', 'Marseille'
EXEC register 'tene', 'fajepugo', 'tene hotilo', 'tene@gmail.com', '014073494568', 'Jl. Juanda No. 79', 'Busan'
EXEC register 'qohu', 'dawuzeto', 'qohu titaxa', 'qohu@gmail.com', '619735006518', 'Jl. Juanda No. 80', 'Esztergom'
EXEC register 'liru', 'viraceto', 'liru haraho', 'liru@gmail.com', '507341564170', 'Jl. Juanda No. 81', 'Eeklo'
EXEC register 'nake', 'ratiyoki', 'nake wosivi', 'nake@gmail.com', '763159895495', 'Jl. Juanda No. 82', 'Kissidougou'
EXEC register 'raci', 'xafisomi', 'raci sutoku', 'raci@gmail.com', '898163754101', 'Jl. Juanda No. 83', 'Helsinki'
EXEC register 'lina', 'qewikugu', 'lina donomu', 'lina@gmail.com', '114352915567', 'Jl. Juanda No. 84', 'Port Royal'
EXEC register 'xaqo', 'kuviwuru', 'xaqo nadavu', 'xaqo@gmail.com', '983504352577', 'Jl. Juanda No. 85', 'Benin City'
EXEC register 'mupa', 'jeqasago', 'mupa toxuce', 'mupa@gmail.com', '987386280980', 'Jl. Juanda No. 86', 'Hverageroi'
EXEC register 'puto', 'qoxitumi', 'puto rokori', 'puto@gmail.com', '466938136452', 'Jl. Juanda No. 87', 'Eeklo'
EXEC register 'haja', 'wopoceqa', 'haja hecene', 'haja@gmail.com', '047741198103', 'Jl. Juanda No. 88', 'Conakry'
EXEC register 'gaxo', 'mibodeta', 'gaxo fimuvu', 'gaxo@gmail.com', '213209274503', 'Jl. Juanda No. 89', 'Gramsh'
EXEC register 'fuho', 'rezucuqu', 'fuho jevega', 'fuho@gmail.com', '623035196792', 'Jl. Juanda No. 90', 'Kissidougou'
EXEC register 'malo', 'buvoyupo', 'malo tesufo', 'malo@gmail.com', '962273073073', 'Jl. Juanda No. 91', 'Gramsh'
EXEC register 'duti', 'pawixulo', 'duti gacive', 'duti@gmail.com', '937915244134', 'Jl. Juanda No. 92', 'Kuala Lumpur'
EXEC register 'noci', 'dowuziko', 'noci gisiqe', 'noci@gmail.com', '108910977451', 'Jl. Juanda No. 93', 'Porto'
EXEC register 'siso', 'bohogesi', 'siso micivi', 'siso@gmail.com', '671754817521', 'Jl. Juanda No. 94', 'Canberra'
EXEC register 'dape', 'baxadabo', 'dape wuvelo', 'dape@gmail.com', '899799960638', 'Jl. Juanda No. 95', 'Canberra'
EXEC register 'yozu', 'kitubozu', 'yozu rowebo', 'yozu@gmail.com', '350910822689', 'Jl. Juanda No. 96', 'Bogota'
EXEC register 'kiku', 'xanejuli', 'kiku noqono', 'kiku@gmail.com', '610474271572', 'Jl. Juanda No. 97', 'Dukhan'
EXEC register 'yizo', 'qakorera', 'yizo rumori', 'yizo@gmail.com', '774531334352', 'Jl. Juanda No. 98', 'Buenos Aires'
EXEC register 'weho', 'quzusiwa', 'weho sigimi', 'weho@gmail.com', '086450157327', 'Jl. Juanda No. 99', 'Kabul'

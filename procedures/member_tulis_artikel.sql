--Member_Tulis_Artikel (ON GOING BY K)
--param : path pdf artikel, status keanggotaan penulis, tanggal_tulis, nama_artikel, id penulis
--todo  : insert entry baru ke dalam tabel Artikel berdasarkan param yang telah diperoleh, dengan status_validasi 0 dan id admin validator 0 (default)
--return: true jika artikel berhasil diinsert

-- NOTE : Tanggal tulis boleh di NULL. Kalau di null in artinya pake tanggal hari ini.
GO
USE Perpustakaan

GO
CREATE PROCEDURE member_tulis_artikel(
	@path_artikel VARCHAR(500), --path_artikel di tabel artikel
	@tanggal_tulis DATE, --tanggal tulis di artikel
	@nama_artikel VARCHAR(500), --nama artikel  di tabel artikel
	@id_penulis INT, --id_member di tabel Member
	@id_kategori_s VARCHAR(500) --ini isinya id-id kategori, tapi karena satu artikel bisa punya banyak kategori jadi ntar di split string aja
)
AS
	DECLARE @is_premium INT, @status_keanggotaan INT
	SET @status_keanggotaan = (SELECT status_keanggotaan FROM Member WHERE id_member = @id_penulis)
	IF (@status_keanggotaan = 1) BEGIN
		SET @is_premium = 0
	END ELSE BEGIN
		SET @is_premium = 1
	END
	--cek ada tanggal nya ga
	If (@tanggal_tulis IS NULL) BEGIN
		SET @tanggal_tulis = CONVERT(VARCHAR(8), GETDATE(), 112)
	END

	--split string id kategori
	DECLARE @tabel_id_k TABLE(
		idk INT
	)
	INSERT INTO @tabel_id_k SELECT * FROM string_split(@id_kategori_s, ',');
	
	--urus dulu insert ke tabel artikel nya
	DECLARE @id_artikel INT 
	
	INSERT INTO Artikel(is_premium, nama_artikel, path_artikel, status_validasi, tanggal_tulis, id_penulis, id_admin)
	VALUES (@is_premium, @nama_artikel, @path_artikel, 0, @tanggal_tulis, @id_penulis, NULL)

	SET @id_artikel = SCOPE_IDENTITY();

	--lanjut ke tabel artikel-kategori (Many to Many)
	INSERT INTO Artikel_Kategori SELECT @id_artikel, idk FROM @tabel_id_k
GO

--tes, ini member udah VIP, kalo hari ini tanggal nya di null in aja
--EXEC tulis_artikel 'C:\Users\LENOVO\Downloads\TubesTBD\10.pdf', 2, NULL, 'Diary of A Wimpy Kid', '1', '1,2,3,4'
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel1.pdf', '20200124', 'oqifiwit odifipif', 18, '33,49,50' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel2.pdf', '20180810', 'inekakus enabisiq', 16, '38,34,46' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel3.pdf', '20190813', 'acowuguc akayohed', 50, '12,17,49' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel4.pdf', '20170613', 'awemezih ofugewaj', 9, '30,5,42,38,2' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel5.pdf', '20170922', 'opeyogut udigahuj', 31, '16,19,44,50,43' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel6.pdf', '20210413', 'egoyupuf ewecirep', 31, '11,32,15' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel7.pdf', '20210924', 'ovumufoh ucawejap', 2, '33,39,2,32' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel8.pdf', '20170821', 'oyihesim agijobid', 28, '10,42,14' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel9.pdf', '20190713', 'atiquzog epilobaj', 31, '37,35,2,23' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel10.pdf', '20200224', 'ifiqagoj ayivezek', 38, '42,2,10,3' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel11.pdf', '20210924', 'umosuxek icaqopav', 18, '48,26,37' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel12.pdf', '20210624', 'arodedev icigemit', 23, '35,1,22,1' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel13.pdf', '20210726', 'igobecol uruduqar', 33, '34,40' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel14.pdf', '20210123', 'atitalih ocugadiz', 45, '11,47,47,16,43' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel15.pdf', '20180317', 'ejopuruy eyewamoh', 2, '22,14,10,37' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel16.pdf', '20210224', 'acigebaz eqakibop', 20, '15,12' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel17.pdf', '20180224', 'emifafuy ezaleqiq', 45, '21,5' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel18.pdf', '20190622', 'ibiranoh uzicofas', 1, '9,45,11' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel19.pdf', '20190510', 'ixepabax atumafov', 48, '37,45,5,33,35' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel20.pdf', '20200328', 'igetukaf odeqoxih', 22, '10,36,3,7' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel21.pdf', '20210113', 'ivujohud isobebaj', 21, '18,14,13,36,33' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel22.pdf', '20170528', 'ayelaqot eluxabib', 13, '30,24' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel23.pdf', '20190810', 'usiconoh iriwojig', 46, '40,25' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel24.pdf', '20210510', 'erayewum ulusebev', 33, '5,28' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel25.pdf', '20180914', 'azesozux exuririt', 8, '25,16,19,8' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel26.pdf', '20190713', 'evodiwer uyiviwob', 21, '35,32' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel27.pdf', '20180215', 'erafefuw uhicidik', 4, '28,15' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel28.pdf', '20200227', 'ijicebis aqomikub', 32, '36,41,14' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel29.pdf', '20170513', 'oyevuhav ederuxug', 22, '7,27,43,36' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel30.pdf', '20200928', 'isixuqal uqaxibak', 31, '24,44,24,49' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel31.pdf', '20180523', 'epumahew ixepuman', 50, '36,11' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel32.pdf', '20170810', 'ejokuxil udicihoy', 32, '4,37,7,5,30' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel33.pdf', '20200725', 'okotagok afawagif', 39, '25,43,15' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel34.pdf', '20200316', 'evanuxos ugiwomos', 20, '45,14' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel35.pdf', '20200821', 'ezowuxol okoyoviq', 43, '38,29,42' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel36.pdf', '20190426', 'eqadojev ubibetol', 33, '29,42,4,9,18' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel37.pdf', '20180225', 'uduxotuk ihohipaj', 27, '43,39,33,21,21' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel38.pdf', '20190124', 'epadikeq abenasob', 25, '23,39,13' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel39.pdf', '20180119', 'ecubixes ojihubot', 5, '27,27' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel40.pdf', '20210516', 'edunitif iqejesey', 21, '23,49,19,35' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel41.pdf', '20200919', 'otivulix eqefaxod', 49, '8,13,43,44,12' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel42.pdf', '20200810', 'awuquqat upaqiwik', 47, '11,25' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel43.pdf', '20200423', 'oloqiviy udajopaz', 33, '38,14' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel44.pdf', '20200917', 'abodojow irunaxah', 3, '45,21,25' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel45.pdf', '20210124', 'asinahop aviduwid', 14, '37,2,21,49,27' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel46.pdf', '20200122', 'uqagezom icucadiz', 32, '22,4,27,42,18' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel47.pdf', '20210324', 'ubihafes ewucotas', 40, '3,22,34' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel48.pdf', '20190926', 'ujelabaf ubetenew', 2, '5,18,9,6,43' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel49.pdf', '20170310', 'ecaqelig adiwenuq', 27, '44,18' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel50.pdf', '20170918', 'unecofif ameyoref', 50, '47,43,50' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel51.pdf', '20190221', 'ibuyofox ihinotat', 25, '13,32,23,24,22' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel52.pdf', '20210218', 'isipasan osoqalik', 40, '39,39,14' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel53.pdf', '20170125', 'itumidiq orefakar', 13, '32,20,44,39' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel54.pdf', '20190810', 'ayikokap azaqedas', 30, '47,3,24' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel55.pdf', '20210612', 'ufizeges ececiwob', 19, '4,12,37,10,47' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel56.pdf', '20210615', 'erizobiy ocebiqug', 48, '27,24,12,23,47' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel57.pdf', '20210128', 'ehehoxez izicejaj', 17, '9,49,15,28' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel58.pdf', '20190713', 'uqicilep ebevumem', 32, '21,48' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel59.pdf', '20190215', 'azunufid opecujil', 45, '9,25,49' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel60.pdf', '20190315', 'ufiwufay azeroguj', 14, '26,12' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel61.pdf', '20190227', 'akucezoy olahejuk', 22, '4,35' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel62.pdf', '20180428', 'ecexugub elewajoq', 30, '24,28' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel63.pdf', '20210128', 'avikotul acaxemoh', 33, '32,17,43' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel64.pdf', '20200423', 'uducefeq ubosusel', 39, '48,8,5,47,2' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel65.pdf', '20190223', 'owalosur oqeratez', 31, '19,31,49,48' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel66.pdf', '20200416', 'iwimaroj ayekivov', 3, '28,5,43,7,27' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel67.pdf', '20210515', 'itavodif iqewayoc', 44, '28,19,49' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel68.pdf', '20190416', 'ihikewud uceletok', 7, '37,35,1,45,44' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel69.pdf', '20200224', 'eheduzuc uwiximec', 42, '17,3' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel70.pdf', '20180912', 'enuwacul izebunuf', 17, '20,18,46' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel71.pdf', '20210521', 'eqanikef izudaxaw', 13, '12,48,24' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel72.pdf', '20170127', 'ejaqiroz ibavocer', 31, '30,41,20' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel73.pdf', '20190820', 'ujirinoj oyavaneq', 48, '33,14,16,16' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel74.pdf', '20190620', 'oyavajiv uloqivux', 29, '7,40,6,5,30' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel75.pdf', '20210726', 'ajodevaq etesaqer', 17, '49,23,46' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel76.pdf', '20170516', 'abuqecos ukariyob', 47, '41,23,45' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel77.pdf', '20190724', 'ejuzezoy ayuvixec', 40, '7,6,34,25' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel78.pdf', '20210728', 'ebujemuw idumunow', 32, '47,2' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel79.pdf', '20210525', 'ojorubux eribikas', 34, '39,23,12,2' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel80.pdf', '20180422', 'ibiqisic udebefay', 42, '45,49' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel81.pdf', '20200426', 'ivodidab uxidecuw', 32, '32,11' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel82.pdf', '20170819', 'ovowamoq atalisit', 50, '45,29,7' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel83.pdf', '20170517', 'elegebiq osovoyox', 1, '14,46' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel84.pdf', '20210122', 'uwuvufic upuhedef', 20, '49,28,6,26,39' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel85.pdf', '20180827', 'ehukupav opunecoj', 42, '24,16' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel86.pdf', '20190224', 'utosatav agaliyex', 47, '23,9,1' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel87.pdf', '20180127', 'eruluwij ekukijip', 37, '12,9,46,3' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel88.pdf', '20170826', 'ocalacir edocejov', 48, '40,41,11' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel89.pdf', '20190610', 'umokeqac apoyumij', 34, '2,34,18,33' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel90.pdf', '20180622', 'ekarirux aqocefin', 39, '14,15' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel91.pdf', '20190120', 'ivizudih uqihifab', 23, '10,23,39,38' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel92.pdf', '20190323', 'ajohohah ujexucol', 21, '31,32,24,10,24' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel93.pdf', '20210513', 'uworafel aneqayef', 35, '39,38,7' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel94.pdf', '20180622', 'opiwemit uqepaled', 48, '8,25,45' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel95.pdf', '20200920', 'uranigeq iqoxubop', 34, '9,27,19,3' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel96.pdf', '20170314', 'alegideq apiyequw', 26, '28,22,33' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel97.pdf', '20170113', 'afesedoh uwemipih', 42, '20,43,21,10' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel98.pdf', '20200925', 'eyuwaler eqogebek', 32, '37,5' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel99.pdf', '20210325', 'agarexow obuzasuw', 41, '9,31,4,44' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel100.pdf', '20190519', 'itucatuz imumedow', 19, '34,34'

SELECT *
FROM Artikel

SELECT *
FROM Member
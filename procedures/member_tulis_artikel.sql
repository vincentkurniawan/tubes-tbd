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
	END 
	ELSE BEGIN
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
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel1.pdf', '20190517', 'okedipeg egavixeb', 7, '23,32,49' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel2.pdf', '20200615', 'egiqutih akilumib', 79, '5,22' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel3.pdf', '20170726', 'ilarejiv egocuqub', 47, '12,39,11' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel4.pdf', '20200614', 'uzudegor ijuvecer', 75, '29,21,40,17,17' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel5.pdf', '20200812', 'umadikot etutogek', 93, '21,12' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel6.pdf', '20170711', 'edobipix ovokecos', 95, '29,36,7,7,43' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel7.pdf', '20200912', 'ikenijot atibujoc', 5, '8,12,11,10,23' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel8.pdf', '20180213', 'alumared erawawiw', 33, '11,21' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel9.pdf', '20180820', 'ixufuhey odulizon', 8, '21,18,21,28' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel10.pdf', '20190812', 'afomovab evahicaj', 33, '46,2,11' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel11.pdf', '20170724', 'ihepaboj enawazuw', 46, '16,7,43,9' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel12.pdf', '20170113', 'edojizut ekugoyuh', 67, '31,38,6,40,43' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel13.pdf', '20200720', 'odigopop uqohugis', 71, '44,27,8,29' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel14.pdf', '20200320', 'opihozev uwexohad', 75, '39,39' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel15.pdf', '20180214', 'uyoguhox ifuxaxuk', 3, '34,37,46,28' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel16.pdf', '20180724', 'iziterar ukecoyok', 55, '47,50,42,24' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel17.pdf', '20170724', 'anocavob epalobab', 19, '43,11' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel18.pdf', '20210321', 'urigagut itosezes', 57, '13,3,23,21,34' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel19.pdf', '20180214', 'eguwihow ezipoyot', 17, '30,47' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel20.pdf', '20170825', 'adofiwes usuyefal', 87, '18,11,47,9' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel21.pdf', '20170624', 'uveraxer ufejuruh', 81, '1,7,48,33' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel22.pdf', '20190219', 'ebilelaw efomiway', 12, '45,18,17,49' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel23.pdf', '20210113', 'icagumoy acoyiyum', 59, '7,8' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel24.pdf', '20210325', 'itonalad oyolijuv', 7, '26,47,16,9' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel25.pdf', '20180523', 'ocozawoy uyoxuxay', 70, '8,26,2,4' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel26.pdf', '20210611', 'ewitekir anahutew', 36, '27,8' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel27.pdf', '20170214', 'atuyivim uzasoxof', 79, '18,32,13,50,5' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel28.pdf', '20200813', 'ugoqucic uhijicez', 43, '2,47,23' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel29.pdf', '20210824', 'ubilovam ikiwanon', 64, '4,34' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel30.pdf', '20190413', 'etucixur okizazon', 95, '32,35' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel31.pdf', '20200623', 'ewoyifiy okugazud', 16, '17,11,32,49,17' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel32.pdf', '20210710', 'ejukazev uhewelev', 3, '14,15' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel33.pdf', '20180710', 'eyepayoh oxujerel', 5, '41,19,25,32,23' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel34.pdf', '20210321', 'avivopom ijeburev', 72, '6,4,37,49,35' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel35.pdf', '20190225', 'equjokeq ujuperoq', 47, '8,9' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel36.pdf', '20180314', 'evesicec ukuwubix', 11, '36,44,38,13,21' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel37.pdf', '20170128', 'emukujow ataguwup', 89, '50,30,1' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel38.pdf', '20190110', 'itayafiw icicohat', 66, '8,5,14,44,7' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel39.pdf', '20190122', 'ufadahuv aravorek', 95, '33,23,19,17,13' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel40.pdf', '20190418', 'ugemapey icukiqec', 2, '28,45' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel41.pdf', '20200615', 'ehiyawub afovedem', 77, '46,49,27,50,21' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel42.pdf', '20180720', 'ihavohud onodakij', 65, '9,27,25' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel43.pdf', '20210414', 'ixuwahim axoletuq', 50, '39,10' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel44.pdf', '20210425', 'ecewiyaj enexogos', 39, '40,22,33,6' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel45.pdf', '20210623', 'egotugut uresihik', 67, '3,33,9,21' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel46.pdf', '20180126', 'ixapanod ayazetiz', 89, '43,29,20' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel47.pdf', '20200815', 'apofewih abolilix', 44, '27,28,22,49,37' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel48.pdf', '20210210', 'umodenax agabejus', 55, '42,50,46,43,27' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel49.pdf', '20200127', 'ukexanuv ifeqaxon', 54, '44,13,7,48,15' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel50.pdf', '20180312', 'avelimod atiroluk', 16, '16,14,3' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel51.pdf', '20200924', 'uyecodod ahozonis', 4, '46,3,37,1' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel52.pdf', '20180718', 'asotiyuw udavonas', 49, '35,38,46' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel53.pdf', '20170822', 'ovuqetah axipeyev', 50, '24,43,32,5' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel54.pdf', '20180418', 'ohapuqul ajozusup', 74, '6,29,50,31' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel55.pdf', '20210722', 'adalapuk atopobaw', 30, '47,12,3,11,18' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel56.pdf', '20190913', 'aviqekol epenekur', 51, '49,17,33,14' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel57.pdf', '20210926', 'evazahaq exahigal', 57, '6,38,20,24' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel58.pdf', '20180719', 'oxokoxun ojifesek', 71, '7,17,5,5' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel59.pdf', '20210321', 'ohanotac ahenawol', 43, '36,15,14,13,33' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel60.pdf', '20180219', 'omecunek obohutif', 37, '34,44,41' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel61.pdf', '20200224', 'oliragin amirinep', 7, '46,34,16' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel62.pdf', '20190512', 'aluvodiv orobaraq', 30, '23,3' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel63.pdf', '20180213', 'oporagek ukerotal', 91, '18,16,19,5,3' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel64.pdf', '20180924', 'afakuxeq ekexigut', 52, '20,28' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel65.pdf', '20170818', 'ofoyarel ovacuvur', 65, '34,29,15,27,38' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel66.pdf', '20200316', 'eraxohuk ugadacuh', 72, '16,48,7' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel67.pdf', '20190223', 'imavomuc egiridoq', 57, '45,34,50,43' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel68.pdf', '20200313', 'esimesoq urupupag', 1, '38,16,14,9' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel69.pdf', '20200221', 'osiqedoz uporuhab', 100, '49,18,32,9' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel70.pdf', '20200428', 'eyimojip ogidibew', 30, '16,32' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel71.pdf', '20190524', 'usiqeweq izujamap', 22, '46,5,14' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel72.pdf', '20170621', 'efoloyar edeyegoc', 21, '50,27,24,13,11' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel73.pdf', '20200911', 'ekatonek ekudahov', 87, '22,38' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel74.pdf', '20190827', 'uginulan adijitub', 95, '12,40,33,45,40' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel75.pdf', '20170211', 'exoqewax udujuzet', 21, '19,20,7,10' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel76.pdf', '20170127', 'ohutizil ixafogem', 5, '24,39,19,7' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel77.pdf', '20200616', 'omahubay epeculuk', 53, '45,22' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel78.pdf', '20170120', 'ulalitet idodeliq', 80, '41,11,20,15,30' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel79.pdf', '20210715', 'ubiloxub utuweyod', 95, '45,2,41,20,46' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel80.pdf', '20190623', 'aruvolof uzozeted', 5, '21,18,50,15' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel81.pdf', '20200627', 'esakobin enuqafeh', 86, '38,41' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel82.pdf', '20170820', 'ijavuvuc ofesofex', 51, '17,43' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel83.pdf', '20180415', 'ilefocat emekoquv', 38, '30,8,18,37,42' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel84.pdf', '20170323', 'ifozufew exogedab', 77, '19,18,28,44,7' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel85.pdf', '20200715', 'ihovutet anuwerov', 3, '19,15' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel86.pdf', '20170923', 'akehiduz omajahat', 55, '22,7,50,30,29' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel87.pdf', '20210927', 'oxuziwug iwogehir', 86, '40,29,30,15,19' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel88.pdf', '20170910', 'usapecow efahudok', 34, '34,21,47' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel89.pdf', '20170522', 'ekajonuj elelorom', 75, '33,6,48' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel90.pdf', '20180417', 'iquqalit uxonoxog', 57, '29,31' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel91.pdf', '20170612', 'ijedunet ubecowec', 68, '18,1,5' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel92.pdf', '20190819', 'azilapem ulisacey', 60, '6,26' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel93.pdf', '20190222', 'adiyewed ozuxetib', 96, '24,17' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel94.pdf', '20200527', 'afubozeb ixexepiq', 12, '13,7,25' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel95.pdf', '20200819', 'omapeles emodalaq', 51, '3,4,25' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel96.pdf', '20200322', 'acetubaj usifamuw', 51, '33,28' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel97.pdf', '20210113', 'ajozoxil adoveneb', 65, '7,20,3,10,43' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel98.pdf', '20180923', 'ibidunuv utufomej', 14, '4,45,30' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel99.pdf', '20200619', 'okuxogar esaqivax', 57, '31,9,8,27' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel100.pdf', '20210218', 'erubored obegohun', 84, '31,42' 

SELECT *
FROM Artikel
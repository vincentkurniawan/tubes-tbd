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
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel1.pdf', '20210126', 'otesizef obaluvab', 25, 'Engineering,Geography,Health' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel2.pdf', '20200119', 'inopober ixifivuz', 46, 'Movie,Accounting,Geography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel3.pdf', '20180910', 'ukemudov ubafabag', 33, 'Accounting,Climate Change,Information Technology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel4.pdf', '20190910', 'ukojopox okeketeh', 8, 'Japanese,Japanese,Investment' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel5.pdf', '20200128', 'oqixacup usudotep', 50, 'Religion,Family,Climate Change' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel6.pdf', '20210919', 'ecipopik udihiban', 41, 'Physics,Investment,Conspiracy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel7.pdf', '20190213', 'odumuxop apiribib', 5, 'Japanese,Architectural' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel8.pdf', '20200216', 'ifemirek uyafelix', 29, 'Romance,Information Technology,Mathematics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel9.pdf', '20170523', 'uzaticil abedeven', 15, 'Horror,Horror,Movie' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel10.pdf', '20200418', 'ozuqumah ihorakus', 34, 'Home Living,Health,Geography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel11.pdf', '20180813', 'iyawokox alevuhut', 2, 'Korean,Social Sciencer' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel12.pdf', '20200328', 'agocexir uhupuyub', 12, 'Japanese,Thriller,Movie,Psychology,Religion' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel13.pdf', '20210316', 'ucizefux ajedahow', 8, 'History,Data Science,Information Technology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel14.pdf', '20170911', 'igadepix unotudom', 45, 'Education,Climate Change,Psychology,Psychology,Law' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel15.pdf', '20170113', 'orojicel ijeyibid', 50, 'Psychology,Foods,Horror,Mathematics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel16.pdf', '20170726', 'ukowegaz aweloqim', 42, 'Crime,Thriller' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel17.pdf', '20170125', 'uxoxurah opoyikek', 23, 'Video Game,Education' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel18.pdf', '20190326', 'eduzifus oyunihix', 34, 'Geography,Investment,Social Sciencer,Mathematics,Conspiracy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel19.pdf', '20170615', 'iwuqohun ubokoquh', 22, 'Music,Architectural' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel20.pdf', '20210221', 'isefuriv egezowus', 23, 'Politics,Music' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel21.pdf', '20180214', 'ogataveh oqodipad', 36, 'Music,Astrophysics,Movie' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel22.pdf', '20180416', 'exunolab idufelez', 19, 'Japanese,Religion,Physics,Astrophysics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel23.pdf', '20170312', 'arufurij ocurohup', 37, 'Business,Romance,Computer Science,Politics,Law' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel24.pdf', '20180313', 'ahicakib imubinis', 16, 'Beauty,Information Technology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel25.pdf', '20190412', 'axejapok iwolobay', 18, 'Social Sciencer,Computer Science,Biography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel26.pdf', '20170312', 'inikovac omohatos', 20, 'Investment,Engineering,Chemistry,Movie' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel27.pdf', '20210412', 'iqozavak axezibix', 21, 'Health,Investment,Climate Change' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel28.pdf', '20190320', 'ibuyoput iyeliyef', 19, 'Social Sciencer,Education,Business' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel29.pdf', '20180510', 'ivecifin ebevuxuz', 11, 'Sports,Social Sciencer,Data Science,Music,Content Creating' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel30.pdf', '20170322', 'enucacif iveqodec', 28, 'Japanese,Chemistry,Astrophysics,Action' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel31.pdf', '20210220', 'ohuqureh uloqitin', 17, 'Investment,Family,Architectural,Psychology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel32.pdf', '20190116', 'ugiquxot itehusiq', 5, 'Religion,Action,Architectural,Religion' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel33.pdf', '20170117', 'ezusenol uzusituz', 45, 'Traveling,Electronics,Photography,Data Science,Crime' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel34.pdf', '20200323', 'itijajob onizefoj', 47, 'Science Fiction,Japanese' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel35.pdf', '20180215', 'efeyetif irititir', 30, 'History,Religion,Physics,Architectural,Home Living' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel36.pdf', '20210713', 'esacozut adibiwow', 27, 'Music,Home Living,Climate Change,Conspiracy,Biography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel37.pdf', '20180212', 'oviquxop osomufun', 6, 'Computer Science,Photography,Education,Family' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel38.pdf', '20200224', 'osubuqez iqofigaq', 46, 'Science Fiction,Electronics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel39.pdf', '20170817', 'exuqulon inevuwaj', 47, 'Religion,Thriller' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel40.pdf', '20200422', 'irazafoc ezuguhot', 49, 'Movie,Biography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel41.pdf', '20210817', 'ufavumom akepubuh', 38, 'Conspiracy,Japanese,Social Sciencer,Comedy,Physics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel42.pdf', '20170622', 'aturuzor iyipebav', 29, 'Science Fiction,Korean' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel43.pdf', '20210111', 'ohebiqoz ulefefev', 13, 'Traveling,Photography,Climate Change,Art' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel44.pdf', '20210620', 'ujukecig upopujis', 20, 'Japanese,Action,Health,Astrophysics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel45.pdf', '20210826', 'epobogob uyeloqos', 29, 'Astrophysics,Beauty,Foods,Astrophysics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel46.pdf', '20200212', 'aponumob idimenat', 25, 'Architectural,Art,Investment' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel47.pdf', '20190724', 'ovaropiv eyufimiq', 39, 'Law,Beauty' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel48.pdf', '20190717', 'acogimew emuparej', 8, 'Law,Movie,Climate Change,Content Creating' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel49.pdf', '20200112', 'efoxucik iyuninag', 25, 'Law,Comedy,Science Fiction' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel50.pdf', '20210314', 'aqosibif egonugej', 1, 'Business,Beauty,Thriller' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel51.pdf', '20170514', 'odolazix ukosayoy', 7, 'Electronics,Music' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel52.pdf', '20180718', 'uquyopif iguzilut', 8, 'Foods,Video Game' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel53.pdf', '20200121', 'iyasumev unuzimos', 20, 'Movie,Music,Conspiracy,Fantasy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel54.pdf', '20210623', 'obidinuv agobezay', 18, 'Korean,Computer Science,Comedy,Korean' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel55.pdf', '20190612', 'epepojev ecidipaj', 11, 'Climate Change,Beauty,Fashion,Thriller,Education' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel56.pdf', '20210822', 'aletajoj otirusur', 33, 'Accounting,Education,Business,Law,Education' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel57.pdf', '20170319', 'ufeqagin orayetem', 33, 'Physics,Architectural,Science Fiction' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel58.pdf', '20190914', 'ewirupep uvuyizem', 28, 'Engineering,Family' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel59.pdf', '20190319', 'ibuxaqek itoyoqar', 14, 'Fanfiction,Architectural,Mathematics,Fashion,Health' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel60.pdf', '20200528', 'acivusal utoxaceb', 37, 'Business,Art,Fashion,Beauty' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel61.pdf', '20180824', 'oyumihov ocutibab', 37, 'Architectural,Traveling,Investment' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel62.pdf', '20190813', 'eduzonir evetasud', 29, 'Conspiracy,Architectural,History,Comedy,Photography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel63.pdf', '20180419', 'ujododob ayuzazej', 31, 'Biography,Geography,Law' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel64.pdf', '20210527', 'aseyelek asesalow', 38, 'Traveling,Crime' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel65.pdf', '20180413', 'amanaqep ejefuyig', 27, 'Chemistry,Movie,Religion,Comedy,Investment' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel66.pdf', '20180825', 'ifemomez enucelor', 17, 'Health,Accounting,Business' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel67.pdf', '20180618', 'agoposoq ikoduxul', 36, 'Religion,Investment,Biography,Social Sciencer' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel68.pdf', '20190717', 'imowowow ovojiroy', 39, 'Science Fiction,Science Fiction,Physics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel69.pdf', '20170112', 'imebiget enicesos', 27, 'Psychology,Computer Science' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel70.pdf', '20180523', 'owegovem ukohonuc', 20, 'Fanfiction,History,Movie,Physics,Traveling' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel71.pdf', '20180218', 'igufegus iyuzunoc', 19, 'Chemistry,Education,Information Technology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel72.pdf', '20180724', 'okolamor afekeraz', 23, 'Comedy,Psychology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel73.pdf', '20190320', 'iferiwil abepiyob', 20, 'Crime,History,Fashion' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel74.pdf', '20180227', 'ohexatup opexabuq', 38, 'Music,Engineering,Photography,Astrophysics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel75.pdf', '20200611', 'ocivorut arikifex', 10, 'Movie,Music' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel76.pdf', '20210928', 'emupufef oqenixaw', 31, 'Crime,Fanfiction,Content Creating,Social Sciencer,Fashion' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel77.pdf', '20210823', 'ukazomoh ebobeqir', 20, 'Video Game,Romance' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel78.pdf', '20170710', 'equyeloc uhelonay', 14, 'Romance,Korean,Social Sciencer,Science Fiction,Photography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel79.pdf', '20210313', 'unuxapow etohatuv', 36, 'Fanfiction,Video Game,Video Game,Video Game' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel80.pdf', '20170110', 'olalonax adadefos', 24, 'Family,Social Sciencer' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel81.pdf', '20200112', 'icihamiw ipucowus', 13, 'Accounting,Electronics,Law,Art' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel82.pdf', '20190714', 'unohukin efukexes', 8, 'Comedy,Accounting,Photography,Climate Change' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel83.pdf', '20170522', 'aneyaqeh elaqevef', 20, 'Comedy,Architectural,Fantasy,Education' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel84.pdf', '20200328', 'uzonahad aluvomiq', 9, 'Romance,Investment,Engineering' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel85.pdf', '20170118', 'awefeluv ojokaman', 12, 'Korean,Sports' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel86.pdf', '20190523', 'ihaqotas uyuzajif', 8, 'Climate Change,Beauty,Law,Music,Video Game' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel87.pdf', '20200126', 'onuraxos orefukeb', 15, 'Korean,Chemistry' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel88.pdf', '20180727', 'ajefefah afigopay', 6, 'Mathematics,Conspiracy,Architectural,Health,Chemistry' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel89.pdf', '20170528', 'ifopoqak upomayic', 10, 'Japanese,Movie,Engineering,Information Technology,Electronics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel90.pdf', '20170715', 'unegopam uyaqeyes', 49, 'Physics,Law,Politics,Psychology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel91.pdf', '20210427', 'alareqoz ajohijug', 46, 'Foods,Korean,Architectural' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel92.pdf', '20200410', 'igasodas udivehay', 38, 'Engineering,Home Living,Japanese,Politics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel93.pdf', '20180120', 'enobugix ayotapex', 17, 'Religion,Horror,Romance,Politics,Accounting' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel94.pdf', '20190923', 'umitemis ojawesiw', 44, 'Engineering,Law,Video Game' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel95.pdf', '20200326', 'afijeqok ezanudug', 49, 'Home Living,Business' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel96.pdf', '20170816', 'evesiqeq ekuzaxev', 4, 'Biography,Science Fiction,Health,Information Technology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel97.pdf', '20170410', 'agepisuz etibiduh', 27, 'Thriller,Fanfiction,Family' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel98.pdf', '20170221', 'unekilux umicunuz', 42, 'Fanfiction,Religion,Crime' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel99.pdf', '20190720', 'ecenilif ofibuhuz', 28, 'Geography,Horror,Fanfiction' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel100.pdf', '20170110', 'avadizok inuvuqut', 35, 'Thriller,Comedy,Biography' 

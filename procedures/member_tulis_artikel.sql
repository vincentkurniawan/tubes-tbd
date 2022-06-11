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
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel1.pdf', '20200326', 'aqelicaz awedujek', 44, 'Fantasy, Architectural, Thriller, Thriller, Fantasy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel2.pdf', '20200322', 'usuhaxeq oranaweg', 39, 'Law, Climate Change, Sports, Electronics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel3.pdf', '20200715', 'itocagab utezekib', 42, 'Thriller, Comedy, Fanfiction, Conspiracy, Family' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel4.pdf', '20190426', 'ofopilaw afojumiw', 29, 'Sports, Chemistry, Biography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel5.pdf', '20180825', 'abipagul ahukiqot', 21, 'Romance, Thriller, Architectural' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel6.pdf', '20180515', 'udilomef orudawim', 21, 'Family, Investment' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel7.pdf', '20210622', 'itotugad enusuler', 18, 'Fashion, Politics, Fanfiction, Information Technology, Crime' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel8.pdf', '20190619', 'upoqovan uyayapoy', 20, 'Romance, Religion, Climate Change, Conspiracy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel9.pdf', '20200528', 'ogivimal anitoget', 29, 'Science Fiction, Health' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel10.pdf', '20180523', 'esiberop uzudacet', 2, 'Home Living, Content Creating, Family, Romance' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel11.pdf', '20180614', 'ibocuxig ohofahur', 29, 'History, Content Creating, Computer Science, Social Sciencer' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel12.pdf', '20170424', 'ulikexud ecefinew', 25, 'Law, Mathematics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel13.pdf', '20180426', 'ahuyedit upuquyet', 13, 'Education, Investment, Family, Crime, Business' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel14.pdf', '20190110', 'ahefotuk enapites', 22, 'Engineering, Physics, Religion, Investment' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel15.pdf', '20200823', 'iqilohay ucucuvex', 31, 'Romance, Data Science, Content Creating, Law, Chemistry' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel16.pdf', '20180512', 'icegubod icedevak', 4, 'Social Sciencer, Religion, Accounting' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel17.pdf', '20170316', 'oqapocib azexucad', 49, 'Data Science, Traveling, Foods, Politics, Electronics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel18.pdf', '20190123', 'igivexaw abohinuw', 13, 'Data Science, Romance, Mathematics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel19.pdf', '20180812', 'alepoqaz onimiyom', 10, 'Photography, Data Science, Chemistry' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel20.pdf', '20210715', 'epubakim ululumoh', 36, 'Climate Change, Fantasy, Engineering, Mathematics, Data Science' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel21.pdf', '20210223', 'iyubuvap otutowif', 33, 'History, Fanfiction, Crime, Family, Korean' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel22.pdf', '20190812', 'utijubol ugogelel', 30, 'Traveling, Psychology, Beauty, Investment, Astrophysics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel23.pdf', '20210123', 'ozayuxab isonusar', 34, 'Information Technology, Geography, Crime' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel24.pdf', '20200628', 'uhegequq edisewes', 21, 'Foods, Investment, Science Fiction, Fantasy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel25.pdf', '20190823', 'otebamod ogisecol', 5, 'Family, Computer Science, Accounting, Data Science, Law' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel26.pdf', '20190819', 'ayikilow egekoxuc', 22, 'Photography, Astrophysics, Electronics, Conspiracy, Astrophysics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel27.pdf', '20190527', 'amuzuniw ujosaxeg', 49, 'Korean, Religion, Fanfiction' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel28.pdf', '20200511', 'uwenovit elibizid', 1, 'History, Japanese' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel29.pdf', '20210617', 'orokezof ukegozod', 20, 'Electronics, Electronics, Religion, Geography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel30.pdf', '20170212', 'eparetok obakudak', 12, 'Fantasy, Physics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel31.pdf', '20170515', 'irovosiv acokayav', 23, 'Fanfiction, Law' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel32.pdf', '20180928', 'ecilacoc ulidaxul', 34, 'Conspiracy, Physics, Psychology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel33.pdf', '20170916', 'upapucay icuyaqic', 25, 'Science Fiction, Home Living' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel34.pdf', '20190623', 'uwezuron enekebud', 39, 'Data Science, Astrophysics, Psychology, Accounting, Korean' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel35.pdf', '20200613', 'unotanuv ufikukul', 14, 'Fantasy, Art' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel36.pdf', '20170420', 'onavasoc oduyekuw', 4, 'Politics, Health' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel37.pdf', '20170115', 'uhuxowuj ivesuduq', 10, 'Computer Science, Conspiracy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel38.pdf', '20180828', 'omisurod apasibas', 44, 'Music, Electronics, Video Game, Education' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel39.pdf', '20180315', 'ohamibej animajez', 10, 'Fanfiction, Content Creating, Japanese, Movie' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel40.pdf', '20170224', 'iluruwis okozemuj', 26, 'Business, Fantasy, Comedy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel41.pdf', '20210714', 'uwedamad iyusoher', 12, 'Data Science, Conspiracy, Fantasy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel42.pdf', '20190527', 'oyebacit avorubaw', 23, 'Home Living, Data Science, Horror, Biography, Conspiracy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel43.pdf', '20200520', 'uquwapes iqitabom', 41, 'Art, Crime' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel44.pdf', '20190721', 'oqikudap owivapif', 23, 'History, Video Game, Architectural' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel45.pdf', '20200710', 'ufebuvar ikuyubiw', 40, 'Sports, Investment, Computer Science, Education' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel46.pdf', '20170317', 'obivoket ukiborul', 31, 'Data Science, Korean, Engineering, Content Creating, Art' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel47.pdf', '20190928', 'acubesar ivolejuk', 36, 'Psychology, Action, Education, Geography, Video Game' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel48.pdf', '20170413', 'imoborox odagofar', 44, 'Art, Information Technology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel49.pdf', '20190625', 'awunezom irecagoz', 21, 'Data Science, Religion, Astrophysics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel50.pdf', '20190511', 'udiyasay ihoyugos', 43, 'Horror, Science Fiction, Action, Content Creating, Chemistry' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel51.pdf', '20180720', 'anozosoy emefosol', 47, 'Family, Crime, Traveling, Japanese' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel52.pdf', '20180328', 'onogifen asomiriy', 17, 'Fanfiction, Comedy, Fanfiction, History' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel53.pdf', '20190810', 'afinuvag ejegaxox', 50, 'Horror, Religion' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel54.pdf', '20210920', 'oyamilav olezitay', 30, 'Music, Fashion, Education' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel55.pdf', '20200615', 'adijujer uyarojud', 26, 'Biography, Beauty, Chemistry' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel56.pdf', '20210120', 'emodihic ogacegot', 14, 'Education, Chemistry' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel57.pdf', '20210226', 'owevahiq egaluwoj', 34, 'Home Living, Data Science, Business, Sports' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel58.pdf', '20180428', 'anopeqok ezosudap', 15, 'Physics, Fanfiction, Education, Politics, Science Fiction' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel59.pdf', '20180417', 'aqoqotip efekapoj', 31, 'Social Sciencer, Accounting' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel60.pdf', '20170817', 'ohinonoz ayezuwih', 45, 'Romance, Fanfiction' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel61.pdf', '20180115', 'ixunoben uvuroqog', 4, 'Music, Content Creating, Art' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel62.pdf', '20180917', 'isumohut onugabin', 9, 'Thriller, Social Sciencer, Biography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel63.pdf', '20190721', 'atosaneh udibupix', 9, 'Education, Fantasy, Business, Education, Movie' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel64.pdf', '20200322', 'ulolaluc osaracub', 35, 'Social Sciencer, Home Living, Investment, Video Game' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel65.pdf', '20170811', 'opuyijad uvatovil', 46, 'Korean, Biography, Action, Conspiracy, Chemistry' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel66.pdf', '20190413', 'ogavalel oqureqam', 16, 'Family, Fashion' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel67.pdf', '20170120', 'epucajiv awabeqaj', 19, 'Science Fiction, Law, Sports' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel68.pdf', '20190323', 'iveqesoh azusabil', 18, 'Engineering, Family, Korean, Thriller, Biography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel69.pdf', '20190620', 'aqupocah amopuzod', 44, 'Investment, Electronics, Traveling, Architectural' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel70.pdf', '20170222', 'erudisot imenafag', 3, 'Psychology, History, Video Game, Politics, Home Living' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel71.pdf', '20210522', 'ezejevud emofijoj', 26, 'Movie, Movie, Art' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel72.pdf', '20200523', 'eqowatay ixufapuj', 22, 'Family, Accounting, Politics, Business' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel73.pdf', '20170816', 'olovikug anufekiw', 47, 'Astrophysics, Crime, Psychology' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel74.pdf', '20190816', 'okamimij asadibap', 34, 'Social Sciencer, Physics, Computer Science' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel75.pdf', '20180311', 'umobezuc ogacudis', 35, 'Action, Astrophysics, Thriller, Information Technology, Foods' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel76.pdf', '20210522', 'epiyozuq etefovuk', 7, 'Health, Traveling, Movie, Video Game' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel77.pdf', '20210810', 'amujelil iqivimus', 34, 'Movie, Family, Social Sciencer' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel78.pdf', '20190314', 'ofuyarev irohapod', 15, 'Korean, Psychology, Accounting' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel79.pdf', '20170614', 'epemubiz idijoqep', 15, 'Chemistry, History, Engineering' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel80.pdf', '20180226', 'ejesefun orinelap', 31, 'Law, Psychology, Electronics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel81.pdf', '20190222', 'unejikut ijeyiyeh', 48, 'Photography, Movie, Conspiracy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel82.pdf', '20170716', 'anejujal oxubuqex', 14, 'Art, Art, Investment, Family' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel83.pdf', '20170118', 'iqurofaw ihugalec', 40, 'Computer Science, Information Technology, Accounting, Horror, Physics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel84.pdf', '20210119', 'odiyidap anahezot', 38, 'Romance, Chemistry, Music, Traveling, Action' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel85.pdf', '20210824', 'enayebuf ojopawuj', 2, 'Home Living, Law, Business' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel86.pdf', '20170425', 'utobejok uhoyesis', 45, 'Crime, Religion' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel87.pdf', '20170411', 'idiweyay edowigot', 50, 'Geography, Horror' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel88.pdf', '20180225', 'adugojap ozemudez', 32, 'Horror, Home Living, Engineering, Comedy' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel89.pdf', '20180618', 'eluvilar urejitob', 8, 'Fanfiction, Japanese, Home Living' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel90.pdf', '20200821', 'onunanad igimicic', 19, 'Family, Investment, Photography, Politics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel91.pdf', '20170412', 'ojeduzey iqoxesew', 37, 'Comedy, Geography' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel92.pdf', '20180119', 'ebepopaf uyokimum', 41, 'Movie, Climate Change, Health, Beauty, Physics' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel93.pdf', '20190819', 'udilefay ademakof', 8, 'Science Fiction, Content Creating, Data Science, Mathematics, Climate Change' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel94.pdf', '20190224', 'evodahaj utosedez', 45, 'Education, Information Technology, Foods' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel95.pdf', '20200510', 'uximiyeq oyiciluk', 6, 'Electronics, Fanfiction, Home Living' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel96.pdf', '20190521', 'ogihigid ahehuyef', 11, 'Korean, Family, Data Science' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel97.pdf', '20180915', 'elucikex esobeyaw', 12, 'Fashion, Romance, Chemistry' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel98.pdf', '20180323', 'amajiruw idequwog', 41, 'Fashion, Korean' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel99.pdf', '20210322', 'imarocec equbocaj', 42, 'Family, Mathematics, Computer Science, Law' 
EXEC member_tulis_artikel 'C:Users/Perpustakaan/Library/artikel100.pdf', '20200119', 'elubuhip izimuvom', 25, 'Geography, Information Technology' 
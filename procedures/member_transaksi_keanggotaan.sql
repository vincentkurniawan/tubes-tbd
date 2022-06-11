/*
memasukan data transaksi yang dilakukan oleh member saat membeli keanggotaan
*/

GO
USE Perpustakaan

GO
CREATE PROCEDURE member_transaksi_keanggotaan(
	@id_member INT,
	@id_keanggotaan INT,
	@tanggal_transaksi DATE
)
AS
	--cek ada tanggal nya ga
	IF (@tanggal_transaksi IS NULL) BEGIN
		SET @tanggal_transaksi = CONVERT(VARCHAR(8), GETDATE(), 112)
	END

	DECLARE @harga INT = (SELECT TOP 1 harga FROM Keanggotaan WHERE id_keanggotaan = @id_keanggotaan)
	INSERT INTO 
		Transaksi_Keanggotaan(harga_transaksi, tanggal_transaksi, status_validasi, id_member, id_admin, id_keanggotaan)
	VALUES
		(@harga, @tanggal_transaksi, 0, @id_member, NULL, @id_keanggotaan)


--kalau tanggal transaksi = NULL, artinya TODAY!
--EXEC member_transaksi_keanggotaan @id_member=3, @id_keanggotaan=3, @tanggal_transaksi=NULL

GO
EXEC member_transaksi_keanggotaan 50, 3, '20170621'
EXEC member_transaksi_keanggotaan 44, 2, '20180715'
EXEC member_transaksi_keanggotaan 3, 2, '20180410'
EXEC member_transaksi_keanggotaan 4, 2, '20170828'
EXEC member_transaksi_keanggotaan 6, 2, '20200722'
EXEC member_transaksi_keanggotaan 47, 3, '20210822'
EXEC member_transaksi_keanggotaan 19, 2, '20170820'
EXEC member_transaksi_keanggotaan 25, 2, '20200725'
EXEC member_transaksi_keanggotaan 7, 3, '20190823'
EXEC member_transaksi_keanggotaan 25, 2, '20200417'
EXEC member_transaksi_keanggotaan 50, 3, '20170125'
EXEC member_transaksi_keanggotaan 10, 2, '20190418'
EXEC member_transaksi_keanggotaan 18, 3, '20170613'
EXEC member_transaksi_keanggotaan 32, 2, '20190127'
EXEC member_transaksi_keanggotaan 42, 3, '20180617'
EXEC member_transaksi_keanggotaan 23, 3, '20180810'
EXEC member_transaksi_keanggotaan 17, 2, '20210423'
EXEC member_transaksi_keanggotaan 18, 2, '20180715'
EXEC member_transaksi_keanggotaan 5, 2, '20180228'
EXEC member_transaksi_keanggotaan 6, 2, '20190819'
EXEC member_transaksi_keanggotaan 40, 3, '20190928'
EXEC member_transaksi_keanggotaan 24, 2, '20190314'
EXEC member_transaksi_keanggotaan 30, 3, '20190213'
EXEC member_transaksi_keanggotaan 46, 3, '20200227'
EXEC member_transaksi_keanggotaan 32, 3, '20210414'
EXEC member_transaksi_keanggotaan 23, 2, '20190625'
EXEC member_transaksi_keanggotaan 46, 2, '20190824'
EXEC member_transaksi_keanggotaan 3, 3, '20210227'
EXEC member_transaksi_keanggotaan 12, 2, '20170712'
EXEC member_transaksi_keanggotaan 1, 3, '20210613'
EXEC member_transaksi_keanggotaan 26, 2, '20190918'
EXEC member_transaksi_keanggotaan 50, 2, '20210723'
EXEC member_transaksi_keanggotaan 19, 3, '20170811'
EXEC member_transaksi_keanggotaan 18, 3, '20190117'
EXEC member_transaksi_keanggotaan 13, 2, '20180723'
EXEC member_transaksi_keanggotaan 21, 3, '20210516'
EXEC member_transaksi_keanggotaan 31, 3, '20180726'
EXEC member_transaksi_keanggotaan 29, 3, '20170827'
EXEC member_transaksi_keanggotaan 2, 2, '20180913'
EXEC member_transaksi_keanggotaan 44, 2, '20170626'
EXEC member_transaksi_keanggotaan 37, 3, '20190410'
EXEC member_transaksi_keanggotaan 27, 2, '20200226'
EXEC member_transaksi_keanggotaan 35, 3, '20180511'
EXEC member_transaksi_keanggotaan 49, 2, '20170315'
EXEC member_transaksi_keanggotaan 47, 2, '20170225'
EXEC member_transaksi_keanggotaan 23, 3, '20190711'
EXEC member_transaksi_keanggotaan 29, 2, '20200714'
EXEC member_transaksi_keanggotaan 12, 3, '20170415'
EXEC member_transaksi_keanggotaan 18, 2, '20180719'
EXEC member_transaksi_keanggotaan 14, 2, '20200719'
EXEC member_transaksi_keanggotaan 15, 3, '20200528'
EXEC member_transaksi_keanggotaan 1, 2, '20170411'
EXEC member_transaksi_keanggotaan 12, 3, '20180623'
EXEC member_transaksi_keanggotaan 20, 2, '20180324'
EXEC member_transaksi_keanggotaan 27, 3, '20170228'
EXEC member_transaksi_keanggotaan 7, 2, '20190926'
EXEC member_transaksi_keanggotaan 50, 3, '20180622'
EXEC member_transaksi_keanggotaan 45, 2, '20190320'
EXEC member_transaksi_keanggotaan 6, 3, '20190214'
EXEC member_transaksi_keanggotaan 10, 3, '20170423'
EXEC member_transaksi_keanggotaan 20, 3, '20170517'
EXEC member_transaksi_keanggotaan 12, 3, '20170915'
EXEC member_transaksi_keanggotaan 11, 3, '20170227'
EXEC member_transaksi_keanggotaan 43, 3, '20200114'
EXEC member_transaksi_keanggotaan 5, 2, '20180217'
EXEC member_transaksi_keanggotaan 23, 2, '20200822'
EXEC member_transaksi_keanggotaan 35, 2, '20190412'
EXEC member_transaksi_keanggotaan 21, 3, '20210622'
EXEC member_transaksi_keanggotaan 17, 2, '20170822'
EXEC member_transaksi_keanggotaan 5, 2, '20180118'
EXEC member_transaksi_keanggotaan 15, 3, '20190626'
EXEC member_transaksi_keanggotaan 20, 2, '20210820'
EXEC member_transaksi_keanggotaan 31, 2, '20200110'
EXEC member_transaksi_keanggotaan 28, 3, '20190417'
EXEC member_transaksi_keanggotaan 36, 3, '20200128'
EXEC member_transaksi_keanggotaan 40, 3, '20200425'
EXEC member_transaksi_keanggotaan 41, 2, '20180218'
EXEC member_transaksi_keanggotaan 19, 3, '20210115'
EXEC member_transaksi_keanggotaan 18, 2, '20190223'
EXEC member_transaksi_keanggotaan 37, 2, '20170619'
EXEC member_transaksi_keanggotaan 11, 3, '20210616'
EXEC member_transaksi_keanggotaan 41, 2, '20170824'
EXEC member_transaksi_keanggotaan 42, 3, '20180712'
EXEC member_transaksi_keanggotaan 22, 2, '20190921'
EXEC member_transaksi_keanggotaan 48, 3, '20170712'
EXEC member_transaksi_keanggotaan 42, 2, '20180310'
EXEC member_transaksi_keanggotaan 46, 3, '20180225'
EXEC member_transaksi_keanggotaan 33, 2, '20180327'
EXEC member_transaksi_keanggotaan 28, 2, '20190122'
EXEC member_transaksi_keanggotaan 22, 2, '20200912'
EXEC member_transaksi_keanggotaan 4, 2, '20190823'
EXEC member_transaksi_keanggotaan 33, 2, '20210724'
EXEC member_transaksi_keanggotaan 35, 3, '20210221'
EXEC member_transaksi_keanggotaan 3, 3, '20200912'
EXEC member_transaksi_keanggotaan 38, 2, '20180319'
EXEC member_transaksi_keanggotaan 39, 3, '20210125'
EXEC member_transaksi_keanggotaan 50, 2, '20210319'
EXEC member_transaksi_keanggotaan 41, 2, '20180317'
EXEC member_transaksi_keanggotaan 43, 2, '20200921'
EXEC member_transaksi_keanggotaan 1, 2, '20200513'
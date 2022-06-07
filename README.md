# tubes-tbd
Tugas Besar Mata Kuliah TBD

Daftar seluruh SP yg dibutuhkan :
**correct me if im wrong :)

# List SP :
1. Member_Filter_Artikel (DONE)
- param : TODO
- todo  : TODO
- return: TODO

2. Member_Admin_Login (ON GOING BY VINCENT)
- param : uname & pass
- todo  : cari entry yg mengandung uname & pass tsb)
- return: true jika login berhasil, false sebaliknya

3. Member_Register (DONE)
- param : uname, pass, nama, email, no telp, alamat. 
- todo  : cek apakah uname, email sdh prnh digunakan sblmnya. if belum pernah, insert data ke tabel Pengguna lalu ke tabel Member baru 
- return: true jika blm prnh digunakan, false jika sudah.

4. Member_Tulis_Artikel (DONE)
- param : path pdf artikel, status keanggotaan penulis, tanggal_tulis, nama_artikel, id penulis
- todo  : insert entry baru ke dalam tabel Artikel berdasarkan param yang telah diperoleh, dengan status_validasi 0 dan id admin validator 0 (default)
- return: true jika artikel berhasil diinsert

5. Admin_Validasi_Artikel_Baru (ON GOING BY K)
- param : id_artikel yang divalidasi, id_admin, status_validasi yang diterima dari interface (bayangin aja ada)
- todo  : cari artikel berdasarkan id yang dimaksud, update value id admin & status validasinya berdasarkan parameter yg diterima.
- return: -

6. Member_Baca_Artikel (DONE)
- param : tanggal_baca (get current date), id_member yg membaca, dan id_artikel yg dipilih untuk dibaca
- todo  : insert entry ke tabel membaca artikel (log baca)
- return: - / isi log baca artikel

7. Member_Review_Artikel (DONE)
- param : id_member, id_artikel, tanggal review, rating, komentar
- todo  : cek apakah member dengan id tersebut sudah pernah melakukan review thd artikel dgn id_artikel di parameter? kalau sudah, brati tinggal update aja tanggal review, rating dan komentarnya. Sebaliknya kalau belum pernah, berati insert new entry di tabel Review berdasarkan parameter yang diterima
- return: - 

8. Member_Favorit_Artikel (DONE)
- param : id_member, id_artikel, tanggal_favorit
- todo  : cek apakah id_member tsb sdh pernah memfavoritkan artikel dengan id_artikel tsb? kalau belum, insert new entry di tabel favorit, sedangkan kalau sudah, cari entry di tabel favorit yang memiliki id member dan id artikel sesuai dengan yg di parameter, lalu hapus entrynya.
- return: true jika berhasil difavoritkan, dan false jika berhasil di non-favoritkan

9. Member_Transaksi_Keanggotaan
- param : id_member, id_keanggotaan, tanggal_transaksi
- todo  : insert ke tabel Transaksi, dengan id admin yg memvalidasi di set default 0 (nantinya akan diupdate saat divalidasi) dan status validasi = 0. 
- return: -
**note : tabel ini akan terlihat tidak normal krn mencatat harga yg dibayarkan , tapi akan mempercepat operasi analisis (jadi gabutuh join" lagi buat cek harga keanggotaannya)

10. Admin_Validasi_Transaksi_Keanggotaan (DONE)
- param : id_transaksi, id_admin, status_validasi
- todo  : update entry ke-id_transaksi di tabel transaksi, berdasarkan id_admin dan status validasi yang ada di param.
- return: -

11. Admin_Update_Daftar_Tipe_Keanggotaan (DONE)
- param : keyword (apakah mau 'tambah' atau 'update'), nama_keanggotaan, harga, durasi_hari, tanggal_berlaku, id_admin
- todo  : jika tambah, maka langsung insert aja entry tipe keanggotaannya. sebaliknya kalau update, cari nama keanggotaan yang ingin di update lalu update atribut lainnya sesuai dengan param
- return: -

-- LATIHAN SQL dengan Data Karyawan
-- Menggunakan database MySQL

-- (1). Arithmetic Operator
-- a. Hitung gaji tahunan (Gaji x 12) untuk setiap karyawan
SELECT 
    Nama,
    Jabatan,
    Gaji,
    (Gaji * 12) AS Gaji_Tahunan
FROM Karyawan;

/* Hasil untuk beberapa data:
Budi Santoso | Manager    | 15000000 | 180000000
Ani Rahmawati| Staff IT   | 10000000 | 120000000
Siti Nurhaliza| Staff HR  | 9000000  | 108000000
*/

-- b. Hitung gaji setelah potongan pajak 5%
SELECT 
    Nama,
    Gaji,
    (Gaji - (Gaji * 0.05)) AS Gaji_Setelah_Pajak
FROM Karyawan;

/* Hasil untuk beberapa data:
Budi Santoso | 15000000 | 14250000
Ani Rahmawati| 10000000 | 9500000
Siti Nurhaliza| 9000000 | 8550000
*/

-- (2). Aggregate Function
-- 1. Hitung total gaji seluruh karyawan
SELECT 
    SUM(Gaji) AS Total_Gaji_Seluruh_Karyawan
FROM Karyawan;

/* Hasil:
Total_Gaji_Seluruh_Karyawan = 111500000
*/

-- 2. Berapa rata-rata gaji karyawan per bulan
SELECT 
    AVG(Gaji) AS Rata_Rata_Gaji_Per_Bulan
FROM Karyawan;

/* Hasil:
Rata_Rata_Gaji_Per_Bulan = 11150000
*/

-- 3. Temukan karyawan dengan gaji tertinggi
SELECT 
    Nama,
    Jabatan,
    Gaji
FROM Karyawan
WHERE Gaji = (SELECT MAX(Gaji) FROM Karyawan);

/* Hasil:
Budi Santoso | Manager | 15000000
Rina Oktaviani| Manager | 15000000
*/

-- (3). String Function
-- 1. Ubah semua nama karyawan menjadi huruf kapital
SELECT 
    UPPER(Nama) AS Nama_Kapital,
    Jabatan
FROM Karyawan;

/* Hasil untuk beberapa data:
BUDI SANTOSO | Manager
ANI RAHMAWATI | Staff IT
SITI NURHALIZA | Staff HR
*/

-- 2. Gabungkan nama dan jabatan
SELECT 
    CONCAT(Nama, ' - ', Jabatan) AS Profil_Karyawan
FROM Karyawan;

/* Hasil untuk beberapa data:
Budi Santoso - Manager
Ani Rahmawati - Staff IT
Siti Nurhaliza - Staff HR
*/

-- (4). Numeric Function
-- 1. Hitung sisa pembagian umur dengan 5
SELECT 
    Nama,
    Umur,
    MOD(Umur, 5) AS Sisa_Pembagian
FROM Karyawan;

/* Hasil untuk beberapa data:
Budi Santoso | 35 | 0
Ani Rahmawati | 28 | 3
Siti Nurhaliza | 30 | 0
*/

-- (5). Date/Time Function
-- 1. Hitung lama bekerja dalam tahun
SELECT 
    Nama,
    Tanggal_Masuk,
    TIMESTAMPDIFF(YEAR, Tanggal_Masuk, CURDATE()) AS Lama_Bekerja
FROM Karyawan;

/* Hasil untuk beberapa data (per tahun 2024):
Budi Santoso | 2015-03-01 | 9
Ani Rahmawati | 2018-06-15 | 6
Siti Nurhaliza | 2020-01-10 | 4
*/

-- 2. Tambahkan 1 tahun ke tanggal masuk
SELECT 
    Nama,
    Tanggal_Masuk,
    DATE_ADD(Tanggal_Masuk, INTERVAL 1 YEAR) AS Tanggal_Setelah_Setahun
FROM Karyawan;

/* Hasil untuk beberapa data:
Budi Santoso | 2015-03-01 | 2016-03-01
Ani Rahmawati | 2018-06-15 | 2019-06-15
Siti Nurhaliza | 2020-01-10 | 2021-01-10
*/
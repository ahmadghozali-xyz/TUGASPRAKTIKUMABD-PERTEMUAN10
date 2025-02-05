-- LATIHAN SQL
-- Menggunakan database MySQL

-- (1). Arithmetic Operator
-- a. Hitung gaji tahunan (Gaji x 12) untuk setiap karyawan
SELECT 
    Nama,
    Jabatan,
    Gaji,
    (Gaji * 12) AS Gaji_Tahunan
FROM Karyawan;

-- b. Tambahkan kolom baru untuk menghitung gaji setelah potongan pajak 5%
SELECT 
    Nama,
    Gaji,
    (Gaji - (Gaji * 0.05)) AS Gaji_Setelah_Pajak
FROM Karyawan;

-- (2). Aggregate Function
-- 1. Hitung total gaji seluruh karyawan
SELECT 
    SUM(Gaji) AS Total_Gaji_Seluruh_Karyawan
FROM Karyawan;

-- 2. Berapa rata-rata gaji karyawan per bulan
SELECT 
    AVG(Gaji) AS Rata_Rata_Gaji_Per_Bulan
FROM Karyawan;

-- 3. Temukan karyawan dengan gaji tertinggi
SELECT 
    Nama,
    Jabatan,
    Gaji
FROM Karyawan
WHERE Gaji = (SELECT MAX(Gaji) FROM Karyawan);

-- (3). String Function
-- 1. Ubah semua nama karyawan menjadi huruf kapital
SELECT 
    UPPER(Nama) AS Nama_Kapital,
    Jabatan
FROM Karyawan;

-- 2. Gabungkan nama dan jabatan menjadi satu kolom
SELECT 
    CONCAT(Nama, ' - ', Jabatan) AS Profil_Karyawan
FROM Karyawan;

-- (4). Numeric Function
-- 1. Hitung sisa pembagian umur karyawan dengan 5
SELECT 
    Nama,
    Umur,
    MOD(Umur, 5) AS Sisa_Pembagian
FROM Karyawan;

-- (5). Date/Time Function
-- 1. Hitung jumlah tahun karyawan telah bekerja
SELECT 
    Nama,
    Tanggal_Masuk,
    TIMESTAMPDIFF(YEAR, Tanggal_Masuk, CURDATE()) AS Lama_Bekerja
FROM Karyawan;

-- 2. Tambahkan 1 tahun ke setiap tanggal masuk karyawan
SELECT 
    Nama,
    Tanggal_Masuk,
    DATE_ADD(Tanggal_Masuk, INTERVAL 1 YEAR) AS Tanggal_Setelah_Setahun
FROM Karyawan;
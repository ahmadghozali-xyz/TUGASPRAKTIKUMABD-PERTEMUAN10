-- Membuat database karyawan
CREATE DATABASE IF NOT EXISTS karyawan;

-- Menggunakan database karyawan
USE karyawan;

-- Membuat tabel karyawan
CREATE TABLE IF NOT EXISTS karyawan (
    ID int(11) NOT NULL PRIMARY KEY,
    Nama varchar(50) DEFAULT NULL,
    Jabatan varchar(50) DEFAULT NULL,
    Gaji int(11) DEFAULT NULL,
    Tanggal_Masuk date DEFAULT NULL,
    Umur int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Memasukkan data ke tabel karyawan
INSERT INTO karyawan (ID, Nama, Jabatan, Gaji, Tanggal_Masuk, Umur) VALUES
(1, 'Budi Santoso', 'Manager', 15000000, '2015-03-01', 35),
(2, 'Ani Rahmawati', 'Staff IT', 10000000, '2018-06-15', 28),
(3, 'Siti Nurhaliza', 'Staff HR', 9000000, '2020-01-10', 30),
(4, 'Indra Wijaya', 'Supervisor', 12000000, '2017-10-05', 33),
(5, 'Rina Oktaviani', 'Manager', 15000000, '2016-04-20', 38),
(6, 'Dodi Prasetyo', 'Staff Finance', 9500000, '2021-07-01', 27),
(7, 'Adi Kusuma', 'Staff IT', 10000000, '2019-11-11', 29),
(8, 'Lala Sari', 'Supervisor', 12000000, '2017-09-15', 34),
(9, 'Wahyu Setiawan', 'Staff HR', 9000000, '2021-12-20', 26),
(10, 'Putri Maharani', 'Staff IT', 10000000, '2019-05-07', 28);

-- Membuat tabel penjualan
CREATE TABLE IF NOT EXISTS penjualan (
    ID int(11) NOT NULL PRIMARY KEY,
    Nama_Produk varchar(50) DEFAULT NULL,
    Kategori varchar(20) DEFAULT NULL,
    Harga int(11) DEFAULT NULL,
    Jumlah int(11) DEFAULT NULL,
    Tanggal_Transaksi date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Memasukkan data ke tabel penjualan
INSERT INTO penjualan (ID, Nama_Produk, Kategori, Harga, Jumlah, Tanggal_Transaksi) VALUES
(1, 'Buku Tulis', 'Alat Tulis', 5000, 10, '2024-11-01'),
(2, 'Pensil', 'Alat Tulis', 2000, 20, '2024-11-02'),
(3, 'Penghapus', 'Alat Tulis', 1500, 15, '2024-11-03'),
(4, 'Bolpoin', 'Alat Tulis', 3000, 25, '2024-11-04'),
(5, 'Buku Gambar', 'Alat Tulis', 10000, 5, '2024-11-05'),
(6, 'Cat Air', 'Seni', 20000, 8, '2024-11-06'),
(7, 'Kuas Lukis', 'Seni', 15000, 7, '2024-11-07'),
(8, 'Lem Kertas', 'Alat Tulis', 5000, 12, '2024-11-08'),
(9, 'Spidol', 'Alat Tulis', 8000, 18, '2024-11-09'),
(10, 'Gunting', 'Alat Tulis', 12000, 6, '2024-11-10');
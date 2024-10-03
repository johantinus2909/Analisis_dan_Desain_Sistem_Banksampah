CREATE TABLE `User` (
  `id_user` INT PRIMARY KEY AUTO_INCREMENT,
  `nama_user` VARCHAR(255),
  `email` VARCHAR(255),
  `password` VARCHAR(255),
  `alamat` TEXT,
  `no_telepon` VARCHAR(15),
  `role_id` INT,
  `saldo` DECIMAL(10,2),
  `status` ENUM(active,inactive)
);

CREATE TABLE `Role` (
  `id_role` INT PRIMARY KEY AUTO_INCREMENT,
  `nama_role` ENUM(Pimpinan,Admin,Nasabah)
);

CREATE TABLE `Kategori_Sampah` (
  `id_kategori` INT PRIMARY KEY AUTO_INCREMENT,
  `nama_kategori` VARCHAR(255)
);

CREATE TABLE `Sampah` (
  `id_sampah` INT PRIMARY KEY AUTO_INCREMENT,
  `nama_sampah` VARCHAR(255),
  `jenis_sampah` ENUM(Plastic,Paper,Metal,Glass,Organic),
  `harga_per_kg` DECIMAL(10,2),
  `id_kategori` INT
);

CREATE TABLE `Deposit_sampah` (
  `id_deposit` INT PRIMARY KEY AUTO_INCREMENT,
  `id_user` INT,
  `id_sampah` INT,
  `tanggal_setor` DATE,
  `total_berat` DECIMAL(10,2),
  `total_harga` DECIMAL(10,2),
  `status_transaksi` ENUM(pending,completed)
);

CREATE TABLE `Withdraw_Saldo` (
  `id_withdraw` INT PRIMARY KEY AUTO_INCREMENT,
  `id_user` INT,
  `tanggal_ambil` DATE,
  `jumlah_ambil` DECIMAL(10,2),
  `status_transaksi` ENUM(pending,completed)
);

ALTER TABLE `User` ADD FOREIGN KEY (`role_id`) REFERENCES `Role` (`id_role`);

ALTER TABLE `Sampah` ADD FOREIGN KEY (`id_kategori`) REFERENCES `Kategori_Sampah` (`id_kategori`);

ALTER TABLE `Deposit_sampah` ADD FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`);

ALTER TABLE `Deposit_sampah` ADD FOREIGN KEY (`id_sampah`) REFERENCES `Sampah` (`id_sampah`);

ALTER TABLE `Withdraw_Saldo` ADD FOREIGN KEY (`id_user`) REFERENCES `User` (`id_user`);

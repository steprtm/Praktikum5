create database praktikum5;
use praktikum5;

CREATE TABLE Dosen (
  kd_ds VARCHAR(15) PRIMARY KEY,
  nama VARCHAR(255)
);
CREATE TABLE Mahasiswa (
  nim INT PRIMARY KEY,
  nama VARCHAR(255),
  jk ENUM('L', 'P'),
  tgl_lahir DATE,
  jalan VARCHAR(255),
  kota VARCHAR(255),
  kodepos VARCHAR(10),
  no_hp VARCHAR(15),
  kd_ds VARCHAR(15),
  FOREIGN KEY (kd_ds) REFERENCES Dosen(kd_ds)
);
CREATE TABLE Matakuliah (
  kd_mk VARCHAR(15) PRIMARY KEY,
  nama VARCHAR(255),
  sks INT
);


CREATE TABLE jadwal_mengajar (
  kd_mk VARCHAR(15),
  kd_ds VARCHAR(15),
  hari VARCHAR(10),
  jam TIME,
  ruang VARCHAR(20),
  FOREIGN KEY (kd_mk) REFERENCES Matakuliah(kd_mk),
  FOREIGN KEY (kd_ds) REFERENCES Dosen(kd_ds)
);


CREATE TABLE KRSMahasiswa (
  nim INT,
  kd_mk VARCHAR(15),
  kd_ds VARCHAR(15),
  semester VARCHAR(10),
  nilai INT,
  FOREIGN KEY (nim) REFERENCES Mahasiswa(nim),
  FOREIGN KEY (kd_mk) REFERENCES Matakuliah(kd_mk),
  FOREIGN KEY (kd_ds) REFERENCES Dosen(kd_ds)
);

INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota, kd_ds) VALUES ('1812345', 'Ari Santoso', 'L', '1999-10-11', 'Bekasi', 'DS002');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota) VALUES ('1823456', 'Dina Marlina', 'P', '1998-11-20', 'Jakarta');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota) VALUES ('1834567', 'Rahmat Hidayat', 'L', '1999-05-10', 'Bekasi');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota) VALUES ('1845678', 'Jaka Sampurna', 'L', '2000-10-19', 'Cikarang');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota) VALUES ('1856789', 'Tia Lestari', 'P', '1999-02-15', 'Karawang');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota) VALUES ('1867890', 'Anton Sinaga', 'L', '1998-06-22', 'Bekasi');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota) VALUES ('1912345', 'Listia Nastiti', 'P', '2001-10-23', 'Jakarta');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota, kd_ds) VALUES ('1923456', 'Amira Jarisa', 'P', '2001-01-24', 'Karawang', 'DS004');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota) VALUES ('1934567', 'Laksana Mardito', 'L', '1999-04-14', 'Cikarang');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota) VALUES ('1945678', 'Jura Marsina', 'P', '2000-05-10', 'Cikarang');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota, kd_ds) VALUES ('1956789', 'Dadi Martani', 'L', '2001-08-29', 'Bekasi', 'DS005');
INSERT INTO praktikum5.mahasiswa (nim, nama, jk, tgl_lahir, kota, kd_ds) VALUES ('1967890', 'Bayu Laksono', 'L', '1999-07-22', 'Cikarang', 'DS004');


ALTER TABLE krsmahasiswa MODIFY semester VARCHAR(10) NOT NULL;



ALTER TABLE jadwal_mengajar MODIFY hari VARCHAR(10) NOT NULL;

INSERT INTO KRSMahasiswa (nim, kd_mk, kd_ds, semester)
VALUES ('1823456', 'MK001', 'DS002', 3),
       ('1823456', 'MK002', 'DS002', 1),
       ('1823456', 'MK003', 'DS001', 3),
       ('1823456', 'MK004', 'DS001', 3),
       ('1823456', 'MK007', 'DS005', 3),
       ('1823456', 'MK008', 'DS005', 3);




SELECT *
FROM Mahasiswa
JOIN Dosen ON Mahasiswa.kd_ds = Dosen.kd_ds;



ALTER TABLE Matakuliah
ADD kd_ds VARCHAR(15),
ADD CONSTRAINT FK_Matakuliah_Dosen
FOREIGN KEY (kd_ds) REFERENCES Dosen (kd_ds);


SELECT *
FROM Matakuliah
JOIN Dosen ON matakuliah.kd_ds = Dosen.kd_ds;

SELECT jadwal_mengajar.*, dosen.nama AS nama_dosen, matakuliah.nama AS nama_matakuliah
FROM jadwal_mengajar
JOIN dosen ON jadwal_mengajar.kd_ds = dosen.kd_ds
JOIN matakuliah ON jadwal_mengajar.kd_mk = matakuliah.kd_mk;

SELECT krsmahasiswa.*, mahasiswa.nama AS nama_mahasiswa, matakuliah.nama AS nama_matakuliah, dosen.nama AS nama_dosen
FROM krsmahasiswa
JOIN mahasiswa ON krsmahasiswa.nim = mahasiswa.nim
JOIN matakuliah ON krsmahasiswa.kd_mk = matakuliah.kd_mk
JOIN dosen ON krsmahasiswa.kd_ds = dosen.kd_ds;


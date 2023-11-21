drop database gym1
create database gym1
use gym1
CREATE TABLE VungChanThuong (
    id INT AUTO_INCREMENT PRIMARY KEY,
    moTa VARCHAR(255),
    idCha INT NOT NULL
);
CREATE TABLE TrieuChung(
    id INT AUTO_INCREMENT PRIMARY KEY,
    moTa text,
    idVungChanThuong INT NOT NULL,
    idNhomCauHoi INT NOT NULL
);
CREATE TABLE TrieuChung_Luat(
	id INT AUTO_INCREMENT PRIMARY KEY,
	idTrieuChung int NOT NULL,
	idLuat int NOT NULL
);
CREATE TABLE NhomCauHoi(
    id INT AUTO_INCREMENT PRIMARY KEY,
    moTa text
);
CREATE TABLE Luat(
    id INT AUTO_INCREMENT PRIMARY KEY,
    moTa text
);
CREATE table ChuanDoan_Luat(
    id INT AUTO_INCREMENT PRIMARY KEY,
    idChuanDoan INT NOT NULL,
    khaNang INT NOT NULL,
    idLuat INT NOT NULL
);
create table ChuanDoan(
     id INT AUTO_INCREMENT PRIMARY KEY,
     moTa text
);
create table ChuanDoan_PPDieuTri(
      id INT AUTO_INCREMENT PRIMARY KEY,
      idChuanDoan int NOT NULL,
      idPPDieuTri int NOT NULL
);
create table PPDieuTri(
	id INT AUTO_INCREMENT PRIMARY KEY,
    moTa text
);


-- Khóa ngoại cho bảng VungChanThuong liên kết idCha với id của chính nó (tạo quan hệ phân cấp)
-- ALTER TABLE VungChanThuong
-- ADD CONSTRAINT fk_vungchanthuong_idcha
-- FOREIGN KEY (idCha) REFERENCES VungChanThuong(id);

-- Khóa ngoại cho bảng TrieuChung liên kết idVungChanThuong với bảng VungChanThuong
ALTER TABLE TrieuChung
ADD CONSTRAINT fk_trieuchung_vungchanthuong
FOREIGN KEY (idVungChanThuong) REFERENCES VungChanThuong(id);

-- Khóa ngoại cho bảng TrieuChung liên kết idNhomCauHoi với bảng NhomCauHoi
ALTER TABLE TrieuChung
ADD CONSTRAINT fk_trieuchung_nhomcauhoi
FOREIGN KEY (idNhomCauHoi) REFERENCES NhomCauHoi(id);

-- Khóa ngoại cho bảng TrieuChung_Luat liên kết idTrieuChung với bảng TrieuChung
ALTER TABLE TrieuChung_Luat
ADD CONSTRAINT fk_trieuchungluat_trieuchung
FOREIGN KEY (idTrieuChung) REFERENCES TrieuChung(id);

-- Khóa ngoại cho bảng TrieuChung_Luat liên kết idLuat với bảng Luat
ALTER TABLE TrieuChung_Luat
ADD CONSTRAINT fk_trieuchungluat_luat
FOREIGN KEY (idLuat) REFERENCES Luat(id);

-- Khóa ngoại cho bảng ChuanDoan_Luat liên kết idChuanDoan với bảng ChuanDoan
ALTER TABLE ChuanDoan_Luat
ADD CONSTRAINT fk_chuandoanluat_chuandoan
FOREIGN KEY (idChuanDoan) REFERENCES ChuanDoan(id);

ALTER TABLE ChuanDoan_Luat
ADD CONSTRAINT fk_chuandoanluat_luat
FOREIGN KEY (idLuat) REFERENCES Luat(id);

-- Khóa ngoại cho bảng ChuanDoan_PPDieuTri liên kết idChuanDoan với bảng ChuanDoan
ALTER TABLE ChuanDoan_PPDieuTri
ADD CONSTRAINT fk_chuandoanppdieutri_chuandoan
FOREIGN KEY (idChuanDoan) REFERENCES ChuanDoan(id);

-- Khóa ngoại cho bảng ChuanDoan_PPDieuTri liên kết idPPDieuTri với bảng PPDieuTri
ALTER TABLE ChuanDoan_PPDieuTri
ADD CONSTRAINT fk_chuandoanppdieutri_ppdieutri
FOREIGN KEY (idPPDieuTri) REFERENCES PPDieuTri(id);

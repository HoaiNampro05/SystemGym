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

use gym1
delete from Vungchanthuong where id>0
select * from VungChanThuong

-- Yêu cầu 1: Insert vùng mức 0
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (1, 'cơ thể', 0);

-- Insert các vùng mức 1
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (2, 'Vùng lưng', 1);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (3, 'Vùng vai', 1);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (4, 'Vùng đầu gối', 1);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (5, 'Vùng cổ tay', 1);

-- Insert các vùng mức 2 dựa trên giả định về id của mỗi vùng mức 1
-- Vùng lưng
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (6, 'Cột sống thắt lưng', 2);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (7, 'Cơ lưng trên', 2);

-- Vùng vai
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (8, 'Khớp vai', 3);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (9, 'Cơ rotator cuff', 3);

-- Vùng đầu gối
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (10, 'Dây chằng chéo', 4);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (11, 'Meniscus', 4);

-- Vùng cổ tay
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (12, 'Các gân cổ tay', 5);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (13, 'Xương cổ tay', 5);

-- Insert các vùng mức 3 dựa trên giả định về id của mỗi vùng mức 2
-- Cột sống thắt lưng
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (14, 'Đĩa đệm lưng dưới', 6);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (15, 'Cơ erector spinae', 6);

-- Cơ lưng trên
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (16, 'Cơ trapezius', 7);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (17, 'Cơ latissimus dorsi', 7);

-- Khớp vai
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (18, 'Gân supraspinatus', 8);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (19, 'Gân infraspinatus', 8);

-- Cơ rotator cuff
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (20, 'Gân teres minor', 9);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (21, 'Gân subscapularis', 9);

-- Dây chằng chéo
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (22, 'Dây chằng chéo trước', 10);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (23, 'Dây chằng chéo sau', 10);

-- Meniscus
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (24, 'Meniscus bên trong', 11);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (25, 'Meniscus bên ngoài', 11);

-- Các gân cổ tay
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (26, 'Gân flexor', 12);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (27, 'Gân extensor', 12);

-- Xương cổ tay
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (28, 'Xương scaphoid', 13);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (29, 'Xương lunate', 13);


use gym1
delete from vungchanthuong where id>0
select * from vungchanthuong

-- Mục gốc
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (1, 'Cây Chấn Thương Tập Gym', 0);

-- Vùng Thân Trên
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (2, 'Vùng Thân Trên', 1);

-- Con của Vùng Thân Trên
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (3, 'Vùng Cổ và Vai', 2);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (4, 'Vùng Khuỷu Tay và Cổ Tay', 2);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (5, 'Vùng Ngực', 2);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (6, 'Vùng Lưng', 2);

-- Con của Vùng Lưng
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (7, 'Vùng Cơ Bắp Lưng Dưới', 6);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (8, 'Vùng Cơ Bắp Lưng Trên', 6);

-- Vùng Thân Dưới
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (9, 'Vùng Thân Dưới', 1);

-- Con của Vùng Thân Dưới
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (10, 'Vùng Đùi và Gân Kheo', 9);
-- Con của Vùng Đùi và Gân Kheo
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (11, 'Vùng Cơ Bắp Đùi Sau', 10);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (12, 'Vùng Cơ Bắp Đùi Trước', 10);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (13, 'Vùng Khớp Háng', 10);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (14, 'Vùng Cơ Bắp Hông', 10);

INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (15, 'Vùng Khớp Gối', 9);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (16, 'Vùng Cơ Bắp Chân', 9);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (17, 'Vùng Cổ Chân và Gót Chân', 9);

-- Vùng Cơ Lõi (Core)
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (18, 'Vùng Cơ Lõi (Core)', 1);

-- Con của Vùng Cơ Lõi (Core)
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (19, 'Vùng Cơ Bắp Bụng', 18);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (20, 'Vùng Cơ Bắp Tay', 18);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (21, 'Vùng Cơ Bắp Vai', 18);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (22, 'Vùng Cơ Bắp Ngực', 18);

INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (23, 'Khuỷnh tay', 4);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (24, 'Cổ tay', 4);

INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (25, 'Cổ', 3);
INSERT INTO VungChanThuong (id, moTa, idCha) VALUES (26, 'Vai', 3);

-- -----------------------------------------------------
-- insert vào nhóm câu hỏi
-- -----------------------------------------------------
INSERT INTO CauHoi (id, moTa,loai) VALUES (1, 'Bạn có thể mô tả mức độ đau như thế nào?',1);
INSERT INTO CauHoi (id, moTa,loai) VALUES (2, 'Bạn có dấu hiệu nào đi kèm không?',2);
INSERT INTO CauHoi (id, moTa,loai) VALUES (3, 'Bạn gặp phải triệu chứng này đã bao lâu rồi?',1);


-- -----------------------------------------------------
-- insert vào ds triệu chứng với 3 nhóm câu hỏi trên và idVungChanThuong=24 tức cổ tay
-- -----------------------------------------------------

-- Phương án cho câu hỏi về mức độ đau
INSERT INTO TrieuChung (id, moTa, idVungChanThuong, idCauHoi) VALUES (1, 'Nhẹ: Đau nhẹ, có thể cử động cổ tay nhưng cảm thấy khó chịu.', 24, 1);
INSERT INTO TrieuChung (id, moTa, idVungChanThuong, idCauHoi) VALUES (2, 'Vừa: Đau đủ để gây khó khăn trong việc cử động, đôi khi cảm giác nóng rát hoặc đau nhói.', 24, 1);
INSERT INTO TrieuChung (id, moTa, idVungChanThuong, idCauHoi) VALUES (3, 'Nặng: Đau nghiêm trọng, gần như không thể cử động cổ tay hoặc chịu đựng được khi di chuyển.', 24, 1);

-- Phương án cho câu hỏi về dấu hiệu đi kèm
INSERT INTO TrieuChung (id, moTa, idVungChanThuong, idCauHoi) VALUES (4, 'Sưng: Cổ tay của bạn có sưng lên không?', 24, 2);
INSERT INTO TrieuChung (id, moTa, idVungChanThuong, idCauHoi) VALUES (5, 'Bầm tím: Có bất kỳ dấu hiệu bầm tím hay thay đổi màu da không?', 24, 2);
INSERT INTO TrieuChung (id, moTa, idVungChanThuong, idCauHoi) VALUES (6, 'Nhiệt độ: Cổ tay của bạn có cảm giác nóng hoặc lạnh bất thường không?', 24, 2);
INSERT INTO TrieuChung (id, moTa, idVungChanThuong, idCauHoi) VALUES (7, 'Tê cóng: Bạn có cảm giác tê cứng hoặc kiến bò ở cổ tay hoặc ngón tay không?', 24, 2);

-- Phương án cho câu hỏi về thời gian gặp phải triệu chứng
INSERT INTO TrieuChung (id, moTa, idVungChanThuong, idCauHoi) VALUES (8, 'Mới xảy ra: Triệu chứng mới xuất hiện trong vòng vài giờ.', 24, 3);
INSERT INTO TrieuChung (id, moTa, idVungChanThuong, idCauHoi) VALUES (9, 'Ngắn hạn: Triệu chứng kéo dài vài ngày.', 24, 3);
INSERT INTO TrieuChung (id, moTa, idVungChanThuong, idCauHoi) VALUES (10, 'Dài hạn: Triệu chứng đã tồn tại nhiều tuần hoặc lâu hơn.', 24, 3);


-- -----------------------------------------------------
-- insert vào bảng luat
-- -----------------------------------------------------


insert into luat(id,moTa) values(1,'luật 1 cổ tay');
INSERT INTO Luat (id, moTa) VALUES (2, 'luật 2 cổ tay');
INSERT INTO Luat (id, moTa) VALUES (3, 'luật 3 cổ tay');

-- -----------------------------------------------------
-- insert vào bảng TrieuChung_luat
-- -----------------------------------------------------

INSERT INTO TrieuChung_Luat (id, idTrieuChung, idLuat) VALUES (1, 3, 2);
INSERT INTO TrieuChung_Luat (id, idTrieuChung, idLuat) VALUES (2, 5, 2);
INSERT INTO TrieuChung_Luat (id, idTrieuChung, idLuat) VALUES (3, 4, 2);
INSERT INTO TrieuChung_Luat (id, idTrieuChung, idLuat) VALUES (4, 10, 2);

-- Các triệu chứng cho luật 3
INSERT INTO TrieuChung_Luat (id, idTrieuChung, idLuat) VALUES (5, 3, 3);
INSERT INTO TrieuChung_Luat (id, idTrieuChung, idLuat) VALUES (6, 4, 3);
INSERT INTO TrieuChung_Luat (id, idTrieuChung, idLuat) VALUES (7, 8, 3);


-- -----------------------------------------------------
-- insert vào bảng ChuanDoan
-- -----------------------------------------------------

INSERT INTO chuandoan (id, moTa) VALUES (1, 'viêm khớp cổ tay');
INSERT INTO chuandoan (id, moTa) VALUES (2, 'bong gân khớp cổ tay');



-- -----------------------------------------------------
-- insert vào bảng ChuanDoan_Luat
-- -----------------------------------------------------

insert into ChuanDoan_Luat(id,idChuanDoan,khaNang,idLuat)
values(1,1,98,2);
insert into ChuanDoan_Luat(id,idChuanDoan,khaNang,idLuat)
values(2,2,80,2);
insert into ChuanDoan_Luat(id,idChuanDoan,khaNang,idLuat)
values(3,1,80,3);
insert into ChuanDoan_Luat(id,idChuanDoan,khaNang,idLuat)
values(4,2,90,3);


-- -----------------------------------------------------
-- insert vào bảng ppdieutri
-- -----------------------------------------------------
insert into ppdieutri(id,moTa)
values(1,'Thay đổi lối sống: Nhiều người bệnh sau khi điều chỉnh các hoạt động thường ngày đã giảm bớt đáng kể những triệu chứng viêm khớp ở cổ tay. Bạn cũng nên tránh một số hoạt động như nâng hay mang vác đồ nặng để tình trạng viêm không trở nặng.
Nẹp cổ tay: Hỗ trợ từ nẹp có thể hữu ích cho người bệnh. Dụng cụ nẹp sẽ hỗ trợ nhẹ nhàng cho những hoạt động cổ tay.
Chườm nóng: Đây là một trong những phương pháp điều trị phổ biến nhất cho viêm khớp ở cổ tay.');
insert into ppdieutri(id,moTa)
values(2,'Thuốc kháng viêm: Các thuốc giảm đau không steroid (NSAID) là loại thuốc được sử dụng khá phổ biến để điều trị tình trạng này.
Tiêm cortisone: Cortisone là một loại thuốc kháng viêm mạnh. Tuy nhiên, bạn cần thảo luận về lợi ích và tác dụng phụ có khả năng xảy ra khi điều trị với bác sĩ.')
;
insert into ppdieutri(id,moTa)
values(3,'Một số loại thuốc chống viêm không steroid (NSAID) như advil, aleve hoặc motrin sẽ hỗ trợ đẩy lùi triệu chứng đau nhức và sưng tấy tạm thời. Tuy nhiên, những loại thuốc này có thể để lại tác dụng phụ làm tăng nguy cơ chảy máu và loét, vì thế người bệnh không nên lạm dụng thuốc và đảm bảo tuân thủ chỉ định của bác sĩ.')
;
insert into ppdieutri(id,moTa)
values(4,'Sử dụng RockTap, RockTape là băng dán thể thao hỗ trợ vận động tốt nhất hiện nay, được sử dụng phổ biến bởi các vận động viên trên toàn thế giới, nhằm chữa trị các chấn thương và cải thiện phong độ thể thao. Khi dán lên vùng cơ bị đau, RockTape sẽ hỗ trợ nâng đỡ cơ và tạo sức bền, cho phép vận động tối đa, nhờ đó giúp giảm nguy cơ chấn thương, giảm sưng đau đáng kể.')


-- -----------------------------------------------------
-- insert vào bảng chuandoan_ppdieutri
-- -----------------------------------------------------
insert into chuandoan_ppdieutri(id,idChuanDoan,idPPDieuTri)
values(1,1,1);
insert into chuandoan_ppdieutri(id,idChuanDoan,idPPDieuTri)
values(2,1,2);
insert into chuandoan_ppdieutri(id,idChuanDoan,idPPDieuTri)
values(3,2,3);
insert into chuandoan_ppdieutri(id,idChuanDoan,idPPDieuTri)
values(4,2,4);


class VungChanThuong:
    def __init__(self, id, moTa,idCha):
        self.id = id
        self.moTa = moTa
        self.idCha = idCha


class CauHoi:
    def __init__(self, id, moTa,loai):
        self.id = id
        self.moTa = moTa
        self.loai = loai

class TrieuChung:
    def __init__(self, id, moTa,idVungChanThuong,idCauHoi):
        self.id = id
        self.moTa = moTa
        self.idVungChanThuong = idVungChanThuong
        self.idCauHoi = idCauHoi
class TrieuChung_Luat:
    def __init__(self, id, idTrieuChung, idLuat):
        self.id = id
        self.idTrieuChung = idTrieuChung
        self.idLuat = idLuat


class Luat:
    def __init__(self, id, moTa):
        self.id = id
        self.moTa = moTa


class ChuanDoan:
    def __init__(self, id, moTa):
        self.id = id
        self.moTa = moTa


class ChuanDoan_Luat:
    def __init__(self, id, idChuanDoan, khaNang, idLuat):
        self.id = id
        self.idChuanDoan = idChuanDoan
        self.khaNang = khaNang
        self.idLuat = idLuat


class PPDieuTri:
    def __init__(self, id, moTa):
        self.id = id
        self.moTa = moTa


class ChuanDoan_PPDieuTri:
    def __init__(self, id, idChuanDoan, idPPDieuTri):
        self.id = id
        self.idChuanDoan = idChuanDoan
        self.idPPDieuTri = idPPDieuTri

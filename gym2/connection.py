import mysql.connector
from models import *
def get_connection():
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="12345",
        database="gym1"
    )
    if connection.is_connected():
        return connection
    return None

def getVungChanThuong():
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute("SELECT * FROM VungChanThuong")
    results = cursor.fetchall()
    for row in results:
        vct = VungChanThuong(row[0], row[1], row[2])
        ls.append(vct)
    return ls

def getVungChanThuongTheoCha(Cha):
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute(f"SELECT * FROM VungChanThuong where idCha = {Cha.id}")
    results = cursor.fetchall()
    for row in results:
        vct = VungChanThuong(row[0], row[1], row[2])
        ls.append(vct)
    return ls

def getTrieuChung():
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute("SELECT * FROM TrieuChung")
    results = cursor.fetchall()
    for row in results:
        tc = TrieuChung(row[0], row[1], row[2], row[3])
        ls.append(tc)
    return ls

def getTrieuChung_Luat():
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute("SELECT * FROM TrieuChung_Luat")
    results = cursor.fetchall()
    for row in results:
        tcl = TrieuChung_Luat(row[0], row[1], row[2])
        ls.append(tcl)
    return ls

def getLuat():
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute("SELECT * FROM Luat")
    results = cursor.fetchall()
    for row in results:
        l = Luat(row[0], row[1])
        ls.append(l)
    return ls

def getChuanDoan():
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute("SELECT * FROM ChuanDoan")
    results = cursor.fetchall()
    for row in results:
        cd = ChuanDoan(row[0], row[1])
        ls.append(cd)
    return ls

def getChuanDoan_Luat():
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute("SELECT * FROM ChuanDoan_Luat")
    results = cursor.fetchall()
    for row in results:
        cdl = ChuanDoan_Luat(row[0], row[1], row[2], row[3])
        ls.append(cdl)
    return ls

def getPPDieuTri():
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute("SELECT * FROM PPDieuTri")
    results = cursor.fetchall()
    for row in results:
        pdt = PPDieuTri(row[0], row[1])
        ls.append(pdt)
    return ls

def getChuanDoan_PPDieuTri():
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute("SELECT * FROM ChuanDoan_PPDieuTri")
    results = cursor.fetchall()
    for row in results:
        cdpt = ChuanDoan_PPDieuTri(row[0], row[1], row[2])
        ls.append(cdpt)
    return ls

def getNhomCauHoi():
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute("SELECT * FROM NhomCauHoi")
    results = cursor.fetchall()
    for row in results:
        nch = NhomCauHoi(row[0], row[1])
        ls.append(nch)
    return ls

def getTrieuChungTheoVCTvaNCH(VungChanThuong,NhomCauHoi):
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute(f"SELECT * FROM TrieuChung where idVungChanThuong={VungChanThuong.id} and idNhomCauhoi={NhomCauHoi.id}")
    results = cursor.fetchall()
    for row in results:
        tc= TrieuChung(row[0], row[1], row[2],row[3])
        ls.append(tc)
    return ls
def getLuaTheoDSTT():
    # Danh sách id triệu chứng
    dsTrieuChung = [1, 2, 3, 5]

    # Tạo kết nối đến cơ sở dữ liệu
    connection = get_connection()
    cursor = connection.cursor()

    # Tạo truy vấn SQL
    placeholders = ', '.join(['%s'] * len(dsTrieuChung))  # Tạo placeholders cho truy vấn
    sql = f"""
    SELECT L.id, L.moTa
    FROM Luat L
    INNER JOIN TrieuChung_Luat TL ON L.id = TL.idLuat
    WHERE TL.idTrieuChung IN ({placeholders})
    GROUP BY L.id, L.moTa
    HAVING COUNT(DISTINCT TL.idTrieuChung) = %s;
    """

    # Thực thi truy vấn
    cursor.execute(sql, dsTrieuChung + [len(dsTrieuChung)])

    # Lấy kết quả truy vấn
    luats = cursor.fetchall()

    # In ra các luật tìm được
    for luat in luats:
        print(luat)


getLuaTheoDSTT()
# ls = getVungChanThuong()
# for x in ls:
#     print(x.moTa)
# print("x------------")
# ls1 = getVungChanThuongByCha(ls[0])
# for x in ls1:
#     print(x.moTa)


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
def getTrieuChung_LuatTheoLuat(luat):
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute(f"SELECT * FROM TrieuChung_Luat where idLuat = {luat.id}")
    results = cursor.fetchall()
    for row in results:
        tcl = TrieuChung_Luat(row[0], row[1], row[2])
        ls.append(tcl)
    return ls


def checkLuatVaDSTC(luat,dstt):
    ds = getTrieuChung_LuatTheoLuat(luat)
    if len(ds)!=len(dstt):
        return False
    for x in dstt:
        flag = False
        for y in ds:
            if x.id == y.idTrieuChung:
                flag = True
                break
        if flag==False:
            return False
    return True

def getLuatTheoDSTC(dstt):
    ds =[]
    dsl = getLuat()
    luat=None
    for x in dsl:
        if checkLuatVaDSTC(x,dstt):
            luat=x
            break
    return luat

def getChuanDoanTheoLuat(luat):
    sql = f"SELECT ChuanDoan.*  FROM ChuanDoan JOIN ChuanDoan_Luat ON ChuanDoan.id = ChuanDoan_Luat.idChuanDoan WHERE ChuanDoan_Luat.idLuat = {luat.id}  ORDER BY ChuanDoan_Luat.khaNang DESC"
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute(sql)
    results = cursor.fetchall()
    for row in results:
        cd = ChuanDoan(row[0], row[1])
        ls.append(cd)
    return ls


def getPPDTTheoChuanDoan(chuanDoan):
    sql = f"SELECT PPDieuTri.* FROM PPDieuTri JOIN ChuanDoan_PPDieuTri ON PPDieuTri.id = ChuanDoan_PPDieuTri.idPPDieuTri WHERE ChuanDoan_PPDieuTri.idChuanDoan = {chuanDoan.id};"
    connection = get_connection()
    cursor = connection.cursor()
    ls = []
    cursor.execute(sql)
    results = cursor.fetchall()
    for row in results:
        ppdt = PPDieuTri(row[0], row[1])
        ls.append(ppdt)
    return ls


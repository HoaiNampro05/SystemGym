from models import VungChanThuong
from connection import *
a = input("Bạn đang muốn tư vấn chấn thương đúng không [y or n]: \n")
if a=='y':
    pass
def hoiVungChanThuong():
    cha = VungChanThuong(1,'root',0)
    while True:
        ls  = getVungChanThuongTheoCha(cha)
        if len(ls)==0:
            break
        if cha.id==1:
            print("Bạn bị chấn thương vùng nào trong các vùng sau")
        else:
            print(f"Để cụ thể hơn trong vùng {cha.moTa} bạn cảm thấy đau ở đâu trong các vùng dưới đây")
        i = 1
        for x in ls:
            print(i,". ",x.moTa)
            i += 1
        ans = int(input("Lựa chọn 1 phương án: \n"))
        cha = ls[ans-1]
    return cha

def hoiDanhSachTrieuChung(vungChanThuong):
    dsNhomCauHoi = getNhomCauHoi()
    lsans =[]
    for nch in dsNhomCauHoi:
        print('Bạn bị triệu chứng nào trong các triệu chứng dưới đây\n')
        ls = getTrieuChungTheoVCTvaNCH(VungChanThuong,nch)
        if len(ls)>0:
            d = 1
            for x in ls:
                print(d,x.moTa)
                d+=1
            ans = int(input("Lựa chọn 1 phương án: \n"))
            lsans.append(ls[ans-1])
    return lsans

hoiVungChanThuong()


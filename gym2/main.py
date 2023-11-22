from models import VungChanThuong
from connection import *

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
        ls = getTrieuChungTheoVCTvaNCH(vungChanThuong,nch)
        if len(ls)>0:
            print(nch.moTa)
            d = 1
            for x in ls:
                print(d,x.moTa)
                d+=1
            ans = int(input("Lựa chọn 1 phương án: \n"))
            lsans.append(ls[ans-1])
    return lsans


def duaRaLoiKhuyen(dschuandoan):
    d1 = len(dschuandoan)
    d11 = 1
    for cd in dschuandoan:
        if d11 == 1:
            print("Theo chatbot chuẩn đoán bạn có thể bị:")
            print(cd.moTa)
        if d11 > 1:
            print(cd.moTa)
        print("Sau đây là lời khuyên dành cho bạn")
        dsPPDT = getPPDTTheoChuanDoan(cd)
        d2 = len(dsPPDT)
        d22 = 1
        for ppdt in dsPPDT:
            print("Bạn có thể dùng phương pháp sau nhé: ")
            print(ppdt.moTa)
            print("Chatbot muốn hỏi bạn rằng bạn đã thực hiện phương pháp trên chưa, nếu đã từng hãy cho Chatbot biết "
                  "có hiệu quả không\n")
            print("1. Chưa thực hiên")
            print("2. Đã thực hiện và thấy tốt")
            print("3. Đã thực hiện và thấy không tốt")
            ans = int(input("Vùi lòng chọn 1 trong 3: \n"))
            if ans == 1:
                print("Vậy hãy thực hiện theo phương pháp trên nhé, tốt hơn có thể hỏi thêm ý kiến của chuyên gia")
                return
            if ans == 2:
                print("Vậy hãy tiếp tục thực hiện theo phương pháp trên nhé, chúc bạn sớm bình phục")
                return
            if ans == 3 and d22 < d2:
                print("Ồ vậy thì!!!")
            if ans == 3 and d22 == d2:
                if d11 < d1:
                    print("Nếu bạn thử các phương pháp trên Chatbot nghi nghờ bạn có thể bị:")
                if d11 == d1:
                    print("Chúng tôi đã cố gắng hết sức!!!")
                    return
            d22 += 1
        d11 += 1


def tuVan():
    a = input("Bạn đang muốn tư vấn chấn thương đúng không [y or n]: \n")
    if a == 'y':
        vct = hoiVungChanThuong()
        dstc = hoiDanhSachTrieuChung(vct)
        print("dsct:")
        for x in dstc:
            print(x.id,x.moTa)
        luat = getLuatTheoDSTC(dstc)
        if luat == None:
            print("Xin lỗi vs danh sách triệu chứng như vậy Chatbot chưa thể đưa chuẩn đoán")
            return
        dschuandoan = getChuanDoanTheoLuat(luat)
        print(len(dschuandoan))
        duaRaLoiKhuyen(dschuandoan)


tuVan()
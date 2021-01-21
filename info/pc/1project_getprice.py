import requests
from bs4 import BeautifulSoup
import cx_Oracle
import config as cfg

con=cx_Oracle.connect('oneteam/enffl@localhost:1521/xe')
cur=con.cursor()
cur2=con.cursor()

sql1='select * from main_custom'
cur.execute(sql1)

def getprice(item):
    url='https://browse.gmarket.co.kr/search?keyword='+item+'&s=1&f=c:100000055'
    recvd=requests.get(url)
    dom = BeautifulSoup(recvd.text, 'lxml')
    price = dom.find('div', class_='box__price-seller').find(['strong']).text
    price = int(price.replace(",", ""))
    print(item)
    print(price)
    return price

def getprice_cpu(item):
    url='https://browse.gmarket.co.kr/search?keyword='+item+'&s=1&f=c:300028465'
    recvd=requests.get(url)
    dom = BeautifulSoup(recvd.text, 'lxml')
    price = dom.find('div', class_='box__price-seller').find(['strong']).text
    price = int(price.replace(",", ""))
    print(item)
    print(price)
    return price


def getprice_vga(item):
    url='https://browse.gmarket.co.kr/search?keyword='+item+'&s=8&f=c:300028463'
    recvd=requests.get(url)
    dom = BeautifulSoup(recvd.text, 'lxml')
    price = dom.find('div', class_='box__price-seller').find(['strong']).text
    price = int(price.replace(",", ""))
    print(item)
    print(price)
    return price


def getprice_ram(item):
    url='https://browse.gmarket.co.kr/search?keyword='+item+'&s=8&f=c:300028466'
    recvd=requests.get(url)
    dom = BeautifulSoup(recvd.text, 'lxml')
    price = dom.find('div', class_='box__price-seller').find(['strong']).text
    price = int(price.replace(",", ""))
    print(item)
    print(price)
    return price


def getprice_disk(item):
    url='https://browse.gmarket.co.kr/search?keyword='+item+'&s=8&f=c:100000075'
    recvd=requests.get(url)
    dom = BeautifulSoup(recvd.text, 'lxml')
    price = dom.find('div', class_='box__price-seller').find(['strong']).text
    price = int(price.replace(",", ""))
    print(item)
    print(price)
    return price


for row in cur:
    # row[0]이 유저 식별번호인 mcno
    # 각 부품군 가격 총 합 pri
    total_price = getprice_cpu(row[1]) + getprice_vga(row[2]) + getprice(row[3]) + getprice(row[4]) +\
          getprice_ram(row[5]) + getprice_ram(row[6]) + getprice_disk(row[7]) + getprice_disk(row[8])
    print('mcno : ', row[0])
    print('total : ', total_price)
    sql2 = "update main_custom set price={}, cpu_price={}, vga_price={}, power_price = {}, mb_price={}, ram1_price={}, ram2_price={}, hdd_price={}, ssd_price = {} where mcno = {} "
    cur2.execute(sql2.format(total_price, getprice_cpu(row[1]),getprice_vga(row[2]), getprice(row[3]), getprice(row[4]), getprice_ram(row[5]), getprice_ram(row[6]), getprice_disk(row[7]), getprice_disk(row[8]), row[0]))

# alter table main_custom add cpu_price number;
con.commit()
con.close()

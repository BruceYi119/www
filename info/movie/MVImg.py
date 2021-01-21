import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin
import time
import os
import datetime
import cx_Oracle

def saveImg(imglist1,titlelist):
    i=0;
    for imgurl in imglist1:
        imgext=imgurl[(imgurl.index('?')-4):imgurl.index('?')]
        i=i+1
        filename=os.path.join('movies1',titlelist[i-1].strip()+'_'+imgext)
        filename2=filename.replace(':',' -').replace('_','').replace('%','퍼센트').replace('#','')
        print(filename2)
        req1=requests.get(imgurl)
        with open(filename2,'wb') as f:
            f.write(req1.content)

url="https://movie.naver.com/movie/running/current.nhn"
hrefs=requests.get(url)
detaildom=BeautifulSoup(hrefs.text,'lxml')

#제목 (title)
t=detaildom.select('#content div.lst_wrap > ul > li > dl > dt > a')
titlelist=[]
for title1 in t:
    title=title1.text
    titlelist.append(title1.text)

imgs=detaildom.select('#content > div.article > div:nth-child(1) > div.lst_wrap > ul > li > div > a > img')
imglist1=[]
for img in imgs:
    imglist1.append(img['src'])

saveImg(imglist1,titlelist)


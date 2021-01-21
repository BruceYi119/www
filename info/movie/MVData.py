import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin
import time
import os
import datetime
import cx_Oracle

#테이블 작성
# drop sequence movies_seq;
# create sequence movies_seq;
# drop table movies;
# create table movies(
#     mno number constraint movies_no_p primary key,
#     title varchar2(200),
#     viewrating varchar2(200),
#     salesrating varchar2(200),
#     genre varchar2(200),
#     runtime varchar2(200),
#     releasedate varchar2(200),
#     filmdirector varchar2(200),
#     imgtitle varchar2(200)
# );

con=cx_Oracle.connect('oneteam/enffl@localhost:1521/xe')
cur=con.cursor()
sql="insert into movies values " \
    "(movies_seq.nextval,'{}','{}','{}','{}','{}','{}','{}','{}')"

# with open(os.path.join('data','movies.csv'),'w',encoding='utf-8') as f: #값의 value를 comma로 한다
url='https://movie.naver.com/movie/running/current.nhn'
recvd=requests.get(url)
dom = BeautifulSoup(recvd.text,'lxml')
ul = dom.find('ul',class_="lst_detail_t1")
lis = ul.find_all('li')
for li in lis:
    title=li.find('dt',class_='tit').find('a').text
    imgtitle=title.replace(':',' -').replace('_','').replace('%','퍼센트').replace('#','')
    viewrating=li.find('span',class_='num').text
    salesrating1=li.find('div',class_='star_t1 b_star')
    if salesrating1 == None:
        salesrating1 = ' '
    else:
        salesrating1 = li.find('div', class_='star_t1 b_star').text
        salesrating2 = salesrating1.strip()
        salesrating3 = salesrating2.replace('%','').replace('미만','')
        salesrating = salesrating3.strip()
    g=li.find('dl',class_='info_txt1').find('dd').text
    g1=g.strip().replace('\t','').replace('\r','').replace('\n','').replace('/',',').replace(' ','')
    g2=g1.split('|')
    if (len(g2) == 2):
        g2=[' ',g2[0].strip(),g2[1].strip()]
        genre = g2[0].strip()
        runtime = g2[1].strip()
        releasedate = g2[2].strip()
    else:
        genre = g2[0].strip()
        runtime = g2[1].strip()
        releasedate1 = g2[2].strip()
        releasedate2 = releasedate1.replace('개봉', '')
        releasedate3 = releasedate2.strip()
        releasedate = releasedate3.replace('.','-')
        if (releasedate == 'None'):
            releasedate == ' '

    dds=li.find('dl',class_='info_txt1').find_all('dd')
    filmdirector=dds[1].text.replace('\n','').replace('\t','').replace('\r','')
# time.sleep(1)
#     str = '%s | %s | %s | %s | %s | %s | %s | %s\n' % (title, viewrating, salesrating, genre, runtime, releasedate, filmdirector, imgtitle) # write 할때는 줄바꿈이 없으니 "\n" 삽입
#     print(str)
# f.write(str)
    cur.execute(sql.format(title, viewrating, salesrating, genre, runtime, releasedate, filmdirector, imgtitle))
con.commit()
con.close()




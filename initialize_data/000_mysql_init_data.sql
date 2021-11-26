drop   database if exists sample;
create database sample character set utf8mb4 collate utf8mb4_bin;
use sample;

drop   table if exists     users;
create table if not exists users
(
    id           int auto_increment primary key     not null,
    name         varchar(64)                        not null,
    kana         varchar(64)                        not null,
    gender       int(1)                             not null,
    home_phone   varchar(16)                        not null,
    mobile_phone varchar(16),
    mail         varchar(96)                        not null,
    postal_code  varchar(8)                         not null,

    address      varchar(80)                        not null,
    address_kana varchar(80)                        not null,

    birthday     date                               not null,
    created_at   datetime default current_timestamp not null,
    updated_at   datetime default current_timestamp not null
);

drop   table if exists     posts;
create table if not exists posts
(
    id         int auto_increment primary key     not null,
    user_id    int                                not null,
    title      varchar(255)                       not null,
    body       text,
    created_at datetime default current_timestamp not null,
    updated_at datetime default current_timestamp not null
);

alter table posts add foreign key (user_id) references users(id);

/* 擬似的な個人情報 https://hogehoge.tk/personal/ で生成 */
insert into users
(name, kana, gender, home_phone, mobile_phone, mail, postal_code, address, address_kana, birthday)
values
('片桐空','カタギリソラ',1,'0778801699','08048569329','sorakatagiri@rknyevgd.ic.fz','602-8057','京都府京都市上京区紹巴町1-1','キョウトフキョウトシカミギョウクショウハチョウ1-1','1993/12/15'),
('市川金治','イチカワキンジ',0,'0368156024','08071775080','uyfq=bfmqvceukinji71320@jtdrxfvcz.lte','107-0061','東京都港区北青山3-7-6パーク北青山207','トウキョウトミナトクキタアオヤマ3-7-6パークキタアオヤマ207','1978/11/04'),
('増田安子','マスダヤスコ',1,'0329351504','09083092340','yasukomasuda@bnkf.jk','134-0093','東京都江戸川区二之江町2-3-16','トウキョウトエドガワクニノエチョウ2-3-16','1967/03/15'),
('新保忍','シンポシノブ',0,'0871149020','09040798197','Shinobu_Shimpo@gswheg.dx','760-0052','香川県高松市瓦町3-5-14','カガワケンタカマツシカワラマチ3-5-14','1979/10/11'),
('竹中当麻','タケナカトウマ',1,'0439253323','09086336602','trseygyyqotouma0157@qjrgb.hmh','272-0834','千葉県市川市国分4-3-15','チバケンイチカワシコクブン4-3-15','1995/12/13'),
('大貫深雪','オオヌキミユキ',1,'0994891239','08047754286','miyuki5419@aausujr.hz','894-1852','鹿児島県大島郡瀬戸内町古志1-20','カゴシマケンオオシマグンセトウチチョウコシ1-20','1968/08/23'),
('米倉忍','ヨネクラシノブ',1,'0476324379','08087652190','shinobu_yonekura@qnrmylwm.ffy','299-5211','千葉県勝浦市松野1-5-7松野パレス415','チバケンカツウラシマツノ1-5-7マツノパレス415','1965/01/26'),
('木原祐司','キハラユウジ',0,'0184676012','08068582592','hjjyhbazyuuji67363@fbkeg.gym','015-0722','秋田県由利本荘市鳥海町下笹子1-19','アキタケンユリホンジョウシチョウカイマチシモジネゴ1-19','2001/07/22'),
('秋葉政志','アキバマサシ',0,'0291492963','08088655608','Masashi_Akiba@dckac.nk.ey','319-2201','茨城県常陸大宮市辰ノ口1-3-13辰ノ口ステーション416','イバラキケンヒタチオオミヤシタツノクチ1-3-13タツノクチステーション416','1979/09/26'),
('高井章一','タカイショウイチ',0,'0221531190','08092806272','shouichi_takai@nbazxe.gyf','989-2465','宮城県岩沼市志賀1-16','ミヤギケンイワヌマシシガ1-16','1994/02/28')
;

insert into posts
    (user_id, title, body)
values (1, 'ユーザー1、テスト1タイトル', 'ユーザー１、テスト１本文'),
       (3, 'ユーザー３、テスト２タイトル', 'ユーザー３、テスト２本文'),
       (3, 'ユーザー３、テスト３タイトル', 'ユーザー３、テスト３本文')
;


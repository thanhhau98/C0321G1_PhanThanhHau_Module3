drop database if exists case_study;

create database case_study;

use case_study;

create table vi_tri (
id_vi_tri int(10) primary key auto_increment,
ten_vi_tri varchar(45)
);

create table trinh_do (
id_trinh_do int(10) primary key auto_increment,
ten_trinh_do varchar(45)
);

create table bo_phan (
id_bo_phan int(10) primary key auto_increment,
ten_bo_phan varchar(45)
);

create table nhan_vien (
id_nhan_vien int(10) primary key auto_increment,
ho_va_ten varchar(45),
id_vi_tri int(10),
foreign key(id_vi_tri) references vi_tri(id_vi_tri) on delete cascade,
id_trinh_do int(10),
foreign key(id_trinh_do) references trinh_do(id_trinh_do) on delete cascade,
id_bo_phan int(10) ,
foreign key(id_bo_phan) references bo_phan(id_bo_phan) on delete cascade,
ngay_sinh date,
so_cmnd int (10),
luong int (10),
sdt int (10),
email varchar(45),
dia_chi varchar(45)
);

create table loai_khach (
id_loai_khach int (10) primary key auto_increment,
ten_loai_khach varchar(45)
);

create table khach_hang (
id_khach_hang int(10) primary key auto_increment,
id_loai_khach int(10),
foreign key(id_loai_khach) references loai_khach(id_loai_khach) on delete cascade,
ho_va_ten varchar(45),
ngay_sinh date,
so_cmnd int (10),
sdt int (10),
email varchar(45),
dia_chi varchar(45)
);

create table kieu_thue (
id_kieu_thue int(10) primary key auto_increment,
ten_kieu_thue varchar(45),
gia int
);

create table loai_dich_vu (
id_loai_dich_vu int(10) primary key auto_increment,
ten_loai_dich_vu varchar(45)
);

create table dich_vu (
id_dich_vu int(10) primary key auto_increment,
ten_dich_vu varchar(45),
dien_tich int(10),
so_tang int(10),
so_nguoi_toi_da int(10),
chi_phi_thue int(10),
id_kieu_thue int(10),
foreign key(id_kieu_thue) references kieu_thue(id_kieu_thue) on delete cascade ,
id_loai_dich_vu int(10),
foreign key(id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu) on delete cascade,
trang_thai varchar(45)
);

insert into dich_vu(ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue,id_loai_dich_vu,trang_thai)
value
('villa',12321,12,2,2,1,1,'new'),
('villa',12321,12,2,2,2,2,'new'),
('villa',12321,12,2,2,1,2,'new'),
('villa',12321,12,2,2,2,1,'new');

create table dich_vu_di_kem (
id_dich_vu_di_kem int(10) primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia int(10),
don_vi int(10),
trang_thai_kha_dung varchar(45)
);

create table hop_dong (
id_hop_dong int(10) primary key auto_increment,
id_nhan_vien int(10),
foreign key(id_nhan_vien) references nhan_vien(id_nhan_vien) on delete cascade,
id_khach_hang int(10),
foreign key(id_khach_hang) references khach_hang(id_khach_hang)on delete cascade ,
id_dich_vu int(10),
foreign key(id_dich_vu) references dich_vu(id_dich_vu)on delete cascade,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int(10),
tong_tien int(10)
);


create table hop_dong_chi_tiet (
id_hop_dong_chi_tiet int(10) primary key auto_increment,
id_hop_dong int(10),
foreign key(id_hop_dong) references hop_dong(id_hop_dong)on delete cascade,
id_dich_vu_di_kem int(10),
foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem) on delete cascade,
so_luong int(10)
);

-- 1.	Th??m m???i th??ng tin cho t???t c??? c??c b???ng c?? trong CSDL ????? c?? th??? th??a m??n c??c y??u c???u b??n d?????i. 
insert into vi_tri(ten_vi_tri)
values
('L??? T??n'),
('Ph???c V???'),
('Chuy??n Vi??n'),
('Gi??m S??t'),
('Qu???n L??'),
('Gi??m ?????c');

insert into trinh_do(ten_trinh_do)
values
('Trung C???p'),
('Cao ?????ng'),
('?????i H???c'),
('Sau ?????i H???c');

insert into bo_phan(ten_bo_phan)
value
('Sale-Marketing'),
('H??nh Ch??nh'),
('Ph???c V???'),
('Qu???n L??');

insert into nhan_vien(ho_va_ten,id_vi_tri,id_trinh_do,id_bo_phan,ngay_sinh,so_cmnd,luong,sdt,email,dia_chi)
value
('L?? ?????c Sang',1,2,1,'1993-10-18',123456879,800,12312312,'234@gmail.com','???? N???ng'),
('Phan Th??nh H???u',2,1,2,'1983-3-12',123456879,1000,123123123,'145623@gmail.com','Qu???ng Tr???'),
('Nguy???n Trung Ki??n',3,3,3,'1998-10-15',123456879,500,123123123,'dsg@gmail.com','H?? N???i'),
('??inh V??n Th??ng',4,4,4,'1999-10-17',123456879,700,123123123,'1sdgdfh23@gmail.com','Qu???ng Nam'),
('H??? Quang Kha',5,1,2,'1988-12-31',123456879,1200,123123123,'jkh@gmail.com','Qu???ng Nam'),
('Ph???m Gia ????ng',6,1,3,'1987-02-07',123456879,1000,123123123,'xcvcv@gmail.com','Qu???ng Nam');

insert into loai_khach(ten_loai_khach)
value
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into khach_hang(id_loai_khach,ho_va_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi)
value 
(1,'Qu??ch V??n M???t','1987-10-12',123123123,123123123,'fghf@gmail.com','???? N???ng'),
(2,'Nguy???n Tu???n H??ng','1999-11-18',123123123,123123123,'kkhjk@gmail.com','Qu???ng Nam'),
(3,'H??? Th??? Na','1998-12-23',123123123,123123123,'nmvhn@gmail.com','Qu???ng Tr???'),
(4,'???????ng Tam','1985-09-12',123123123,123123123,'cvz@gmail.com','Qu???ng Ng??i'),
(1,'Thi???t L???nh C??ng','1979-05-11',123123123,123123123,'dfgg@gmail.com','Vinh');


insert into kieu_thue(ten_kieu_thue,gia)
value
('N??m',5000),
('Th??ng',1000),
('Ng??y',200),
('Gi???',100);

insert into loai_dich_vu(ten_loai_dich_vu)
value
('Villa'),
('House'),
('Room');

insert into DichvuDikem(TenDichVuDikem,Gia,Donvi,TrangThaiKhaDung)
value
('massage',500,000,'c??'),
('karaoke',200,000,'c??'),
('Th???c ??n',100,000,'c??'),
('N?????c U???ng',50,000,'c??'),
('Thu?? Xe',300,000,'c??');



insert into HopDong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc,TongTien)
value
(1,1,1,'2020-12-11','2020-12-18',12121212,1231231231),
(1,2,3,'2020-12-11','2020-12-18',12121212,1231231231),
(2,1,3,'2020-12-11','2020-12-18',12121212,1231231231),
(3,3,3,'2020-12-11','2020-12-18',12121212,1231231231);

insert into HopDongChiTiet(IDHopDong,IDDichVuDiKem,SoLuong)
value
(1,1,2),
(2,2,3),
(1,2,4);

-- 2.	Hi???n th??? th??ng tin c???a t???t c??? nh??n vi??n c?? trong h??? th???ng c?? t??n b???t ?????u l?? m???t trong c??c k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t???.

select *
from NhanVien
where (HoVaTen like '%T%'
or HoVaTen like '%K%' 
or HoVaTen like '%H%')
and length(HoVaTen) <= 15 ;
insert into NhanVien(HoVaTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value
('Thangasdassdasdasdasdasda',1,1,1,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Qu???ng Nam');

insert into NhanVien(HoVaTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value
('Thai Thi Thang Sang',1,1,1,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Qu???ng Nam');

-- 3.	Hi???n th??? th??ng tin c???a t???t c??? kh??ch h??ng c?? ????? tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr??????.

select *
from khachhang
where (DiaChi = '???? N???ng'
or  DiaChi = 'Qu???ng Tr???')
and (timestampdiff(year,NgaySinh,curdate()) between 18 and 50) ;

-- 4.	??  ???m xem t????ng ???ng v???i m???i kh??ch h??ng ???? t???ng ?????t ph??ng bao nhi??u l???n. K???t qu??? hi???n th??? ???????c s???p x???p t??ng d???n theo s??? l???n ?????t ph??ng c???a kh??ch h??ng. Ch??? ?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond???.

select KhachHang.IDKhachHang, KhachHang.HoVaTen, LoaiKhach.TenLoaiKhach, count(*) as SoLanDatPhong 
from 
KhachHang inner join LoaiKhach on KhachHang.IDLoaiKhach = LoaiKhach.IDLoaiKhach 
			left join HopDong on khachhang.IDKhachHang = hopdong.IDKhachHang	
            where LoaiKhach.TenLoaiKhach = 'Diamond'
group by IDKhachHang
order by SoLanDatPhong ;



-- 5.	Hi???n th??? IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (V???i TongTien ???????c t??nh theo c??ng th???c nh?? sau: ChiPhiThue + SoLuong*Gia, v???i SoLuong v?? Gi?? l?? t??? b???ng DichVuDiKem) cho t???t c??? c??c Kh??ch h??ng ???? t???ng ?????t ph???ng. (Nh???ng Kh??ch h??ng n??o ch??a t???ng ?????t ph??ng c??ng ph???i hi???n th??? ra).
insert into HopDongChiTiet(IDHopDong,IDDichVuDiKem,SoLuong)
value
(4,4,2),
(4,2,3),
(3,3,4);
insert into HopDong(IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc,TongTien)
value
(1,1,4,'2020-12-11','2020-12-18',12121212,1231231231),
(1,2,3,'2020-12-11','2020-12-18',12121212,1231231231),
(2,1,3,'2020-12-11','2020-12-18',12121212,1231231231),
(3,1,3,'2020-12-11','2020-12-18',12121212,1231231231);

select khachhang.IDKhachHang, khachhang.HoVaTen, loaikhach.TenLoaiKhach,hopdong.IDHopDong,dichvu.TenDichVu,hopdong.NgayLamHopDong,hopdong.NgayKetThuc,sum(hopdong.TongTien-hopdong.TienDatCoc+dichvudikem.Gia*hopdongchitiet.SoLuong) as Tongtien
from khachhang
			left join hopdong on khachhang.IDKhachHang=hopdong.IDKhachHang
			left join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
			left join hopdongchitiet on hopdongchitiet.IDHopDong = hopdong.IDHopDong
			left join dichvudikem on hopdongchitiet.IDDichVuDiKem=dichvudikem.IDDichVuDiKem
			left join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
group by IDKhachHang;
                

-- 6.	Hi???n th??? IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i D???ch v??? ch??a t???ng ???????c Kh??ch h??ng th???c hi???n ?????t t??? qu?? 1 c???a n??m 2019 (Qu?? 1 l?? th??ng 1, 2, 3).

select DichVu.IDDichVu,DichVu.TenDichVu,DichVu.DienTich, dichvu.ChiPhiThue, loaidichvu.TenLoaiDichVu
from dichvu 
			inner join hopdong on hopdong.IDDichVu = dichvu.IDDichVu
            inner join loaidichvu on loaidichvu.IDLoaiDichVu= dichvu.IDLoaiDichVu
            where hopdong.NgayLamHopDong  > '2019-03-31';

-- 7.	Hi???n th??? th??ng tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu c???a t???t c??? c??c lo???i d???ch v??? ???? t???ng ???????c Kh??ch h??ng ?????t ph??ng trong n??m 2018 nh??ng ch??a t???ng ???????c Kh??ch h??ng ?????t ph??ng  trong n??m 2019.
select dichvu.IDDichVu,dichvu.TenDichVu,dichvu.DienTich,dichvu.ChiPhithue,loaidichvu.TenLoaiDichVu
from dichvu
			left join loaidichvu on dichvu.IDLoaiDichVu=loaidichvu.IDLoaiDichVu
            left join hopdong on hopdong.IDDichVu = dichvu.IDDichVu
where dichvu.IDDichVu in (
					select distinct IDDichVu 
                    from hopdong 
                    where year(NgayLamHopDong) = 2018
                    )
and dichvu.IDDichVu not in (
					select distinct IDDichVu 
                    from hopdong 
                    where year(NgayLamHopDong) =2019
                    )
group by IDDichVu;

-- 8.	Hi???n th??? th??ng tin HoTenKhachHang c?? trong h??? th???ng, v???i y??u c???u HoThenKhachHang kh??ng tr??ng nhau.H???c vi??n s??? d???ng theo 3 c??ch kh??c nhau ????? th???c hi???n y??u c???u tr??n

-- C??ch 1
select *
from khachhang 
group by HoVaTen;

-- C??ch 2
select * 
from khachhang
where HoVaTen in (
			 select distinct HoVaTen
             from khachhang
             );

-- 9.	Th???c hi???n th???ng k?? doanh thu theo th??ng, ngh??a l?? t????ng ???ng v???i m???i th??ng trong n??m 2019 th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng.

select dichvu.TenDichVu, count(*) as SoLanDat , month(hopdong.NgayLamHopDong)'ThangDat'
from dichvu 
			inner join hopdong on dichvu.IDDichVu = hopdong.IDDichVu
            where year(hopdong.NgayLamHopDong) =2019
group by TenDichVu;

-- 10.	Hi???n th??? th??ng tin t????ng ???ng v???i t???ng H???p ?????ng th?? ???? s??? d???ng bao nhi??u D???ch v??? ??i k??m. K???t qu??? hi???n th??? bao g???m IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (???????c t??nh d???a tr??n vi???c count c??c IDHopDongChiTiet).

select hopdong.IDHopDong,hopdong.NgayLamHopDong,hopdong.NgayKetThuc,hopdong.TienDatCoc,count(IDHopDongChiTiet) as SoLuongDichVuDiKem
from hopdong
			inner join hopdongchitiet on hopdongchitiet.IDHopDong = hopdong.IDHopDong
group by IDHopDong;

-- 11.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???? ???????c s??? d???ng b???i nh???ng Kh??ch h??ng c?? TenLoaiKhachHang l?? ???Diamond??? v?? c?? ?????a ch??? l?? ???Vinh??? ho???c ???Qu???ng Ng??i???.
select dichvudikem.IDDichVuDiKem,dichvudikem.TenDichVuDiKem,khachhang.IDKhachHang,dichvudikem.Gia,dichvudikem.DonVi,dichvudikem.TrangThaiKhaDung
from dichvudikem
				inner join hopdongchitiet on hopdongchitiet.IDdichVuDiKem = dichvudikem.IDdichVuDiKem
                inner join hopdong on hopdong.IDHopDong = hopdongchitiet.IDHopDong
                inner join khachhang on khachhang .IDKhachHang= hopdong.IDKhachHang
                inner join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
where loaikhach.TenLoaiKhach = 'Diamond' and khachhang.DiaChi in ('Vinh','Qu???ng Ng??i')
group by TenDichVuDiKem
order by IDdichVuDiKem asc;
-- 12.	Hi???n th??? th??ng tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (???????c t??nh d???a tr??n t???ng H???p ?????ng chi ti???t), TienDatCoc c???a t???t c??? c??c d???ch v??? ???? t???ng ???????c kh??ch h??ng ?????t v??o 3 th??ng cu???i n??m 2019 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2019.
select hopdong.IDHopDong,nhanvien.HoVaTen,khachhang.HoVaTen,khachhang.SDT,dichvu.TenDichVu,count(hopdongchitiet.IDHopDongChiTiet) as SoLuongdichVuDiKem,hopdong.TienDatCoc
from hopdong
			left join khachhang on hopdong.IDKhachHang = khachhang.IDKhachHang
			left join nhanvien on nhanvien.IDNhanVien = hopdong.IDNhanVien
			left join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
			left join hopdongchitiet on hopdong.IDHopDong = hopdongchitiet.IDHopDong
where hopdong.IDDichVu in (
					select distinct IDDichVu 
                    from hopdong 
                    where NgayLamHopDong between '2019-10-01' and '2019-12-31'
                    )
and hopdong.IDDichVu not in (
					select distinct IDDichVu 
                    from hopdong 
                    where NgayLamHopDong between '2019-01-01' and '2019-06-30'
                    )	
group by IDHopDong;
            
            

-- 13.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t b???i c??c Kh??ch h??ng ???? ?????t ph??ng. (L??u ?? l?? c?? th??? c?? nhi???u d???ch v??? c?? s??? l???n s??? d???ng nhi???u nh?? nhau).

create view so_lan_sd_dvdk as 
select dichvudikem.IDdichVuDiKem,dichvudikem.TenDichVuDiKem,dichvudikem.Gia,dichvudikem.DonVi,dichvudikem.TrangThaiKhaDung,sum(hopdongchitiet.SoLuong) as SoLanSuDung
from dichvudikem
				inner join hopdongchitiet on hopdongchitiet.IDDichVuDiKem = dichvudikem.IDdichVuDiKem
                inner join hopdong on hopdong.IDHopDong = hopdongchitiet.IDHopDong
group by IDdichVuDiKem;

set @max_use = (select
	max(SoLanSuDung)
	from so_lan_sd_dvdk);
    
select IDdichVuDiKem,TenDichVuDiKem,Gia,DonVi,TrangThaiKhaDung
from so_lan_sd_dvdk 
where SoLanSuDung = @max_use;
-- 14.	Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t. Th??ng tin hi???n th??? bao g???m IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.

create view so_lan_su_dung_dvdk as 
select hopdong.IDHopDong, loaidichvu.TenLoaiDichVu, dichvudikem.TenDichVuDiKem,sum(hopdongchitiet.SoLuong) as SoLanSuDung
from dichvudikem
				inner join hopdongchitiet on hopdongchitiet.IDdichVuDiKem = dichvudikem.IDdichVuDiKem
                inner join hopdong on hopdong.IDHopDong = hopdongchitiet.IDHopDong
                inner join dichvu on hopdong.IDDichVu = dichvu.IDDichVu
                inner join loaidichvu on dichvu.IDLoaiDichVu = loaidichvu.IDLoaiDichVu
group by TenDichVuDiKem;

select *
from so_lan_su_dung_dvdk;

select IDHopDong,TenLoaiDichVu,TenDichVuDiKem,SoLanSuDung
from so_lan_su_dung_dvdk
where SoLanSuDung = 1;

-- 15.	Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi m???i ch??? l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2018 ?????n 2019.

drop view so_lan_ky_hop_dong;

create view so_lan_ky_hop_dong as
select nhanvien.IDNhanVien, nhanvien.HoVaTen, trinhdo.TrinhDo, bophan.TenBoPhan, nhanvien.SDT, nhanvien.DiaChi,count(hopdong.IDNhanVien)as SoHopDong
from nhanvien
			inner join hopdong on hopdong.IDNhanVien = nhanvien.IDNhanVien
			inner join trinhdo on trinhdo.IDTrinhDo = nhanvien.IDTrinhDo
			inner join bophan on bophan.IDBoPhan = nhanvien.IDBoPhan
where year(hopdong.NgayLamHopDong) between 2018 and 2019
group by IDNhanVien;

select * 
from so_lan_ky_hop_dong;

select IDNhanVien,HoVaTen,TrinhDo,TenBoPhan,SDT,DiaChi
from so_lan_ky_hop_dong
where SoHopDong <=3 ;

-- 16.	X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2017 ?????n n??m 2019.

SET FOREIGN_KEY_CHECKS=0; 
delete 
from nhanvien 
where IDNhanVien not in (
select IDNhanVien
from hopdong
where year(hopdong.NgayLamHopDong ) between 2017 and 2019
) ;
SET FOREIGN_KEY_CHECKS=1;


-- 17.	C???p nh???t th??ng tin nh???ng kh??ch h??ng c?? TenLoaiKhachHang t???  Platinium l??n Diamond, ch??? c???p nh???t nh???ng kh??ch h??ng ???? t???ng ?????t ph??ng v???i t???ng Ti???n thanh to??n trong n??m 2019 l?? l???n h??n 10.000.000 VN??.

update loaikhach
set TenLoaiKhach = 'Diamond'
where IDLoaiKhach not in(
select IDLoaiKhach
from khachhang 
where IDKhachHang not in (
select hopdong.IDKhachHang, sum(hopdong.TongTien) as TongSoTien
from hopdong 
where TongSoTien > 10000000 ) 
)
and
(select IDLoaiKhach
from loaikhach
where TenLoaiKhach = 'Platinium' 
);



-- 18.	X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2016 (ch?? ?? r??ngbu???c gi???a c??c b???ng).

-- 19.	C???p nh???t gi?? cho c??c D???ch v??? ??i k??m ???????c s??? d???ng tr??n 10 l???n trong n??m 2019 l??n g???p ????i.

-- 20.	Hi???n th??? th??ng tin c???a t???t c??? c??c Nh??n vi??n v?? Kh??ch h??ng c?? trong h??? th???ng, th??ng tin hi???n th??? bao g???m ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.





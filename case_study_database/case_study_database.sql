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

-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa mãn các yêu cầu bên dưới. 
insert into vi_tri(ten_vi_tri)
values
('Lễ Tân'),
('Phục Vụ'),
('Chuyên Viên'),
('Giám Sát'),
('Quản Lý'),
('Giám Đốc');

insert into trinh_do(ten_trinh_do)
values
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học');

insert into bo_phan(ten_bo_phan)
value
('Sale-Marketing'),
('Hành Chính'),
('Phục Vụ'),
('Quản Lý');

insert into nhan_vien(ho_va_ten,id_vi_tri,id_trinh_do,id_bo_phan,ngay_sinh,so_cmnd,luong,sdt,email,dia_chi)
value
('Lê Đức Sang',1,2,1,'1993-10-18',123456879,800,12312312,'234@gmail.com','Đà Nẵng'),
('Phan Thành Hậu',2,1,2,'1983-3-12',123456879,1000,123123123,'145623@gmail.com','Quảng Trị'),
('Nguyễn Trung Kiên',3,3,3,'1998-10-15',123456879,500,123123123,'dsg@gmail.com','Hà Nội'),
('Đinh Văn Thăng',4,4,4,'1999-10-17',123456879,700,123123123,'1sdgdfh23@gmail.com','Quảng Nam'),
('Hồ Quang Kha',5,1,2,'1988-12-31',123456879,1200,123123123,'jkh@gmail.com','Quảng Nam'),
('Phạm Gia Đông',6,1,3,'1987-02-07',123456879,1000,123123123,'xcvcv@gmail.com','Quảng Nam');

insert into loai_khach(ten_loai_khach)
value
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into khach_hang(id_loai_khach,ho_va_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi)
value 
(1,'Quách Văn Một','1987-10-12',123123123,123123123,'fghf@gmail.com','Đà Nẵng'),
(2,'Nguyễn Tuấn Hưng','1999-11-18',123123123,123123123,'kkhjk@gmail.com','Quảng Nam'),
(3,'Hồ Thị Na','1998-12-23',123123123,123123123,'nmvhn@gmail.com','Quảng Trị'),
(4,'Đường Tam','1985-09-12',123123123,123123123,'cvz@gmail.com','Quảng Ngãi'),
(1,'Thiết Lệnh Công','1979-05-11',123123123,123123123,'dfgg@gmail.com','Vinh');


insert into kieu_thue(ten_kieu_thue,gia)
value
('Năm',5000),
('Tháng',1000),
('Ngày',200),
('Giờ',100);

insert into loai_dich_vu(ten_loai_dich_vu)
value
('Villa'),
('House'),
('Room');

insert into DichvuDikem(TenDichVuDikem,Gia,Donvi,TrangThaiKhaDung)
value
('massage',500,000,'có'),
('karaoke',200,000,'có'),
('Thức Ăn',100,000,'có'),
('Nước Uống',50,000,'có'),
('Thuê Xe',300,000,'có');



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

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.

select *
from NhanVien
where (HoVaTen like '%T%'
or HoVaTen like '%K%' 
or HoVaTen like '%H%')
and length(HoVaTen) <= 15 ;
insert into NhanVien(HoVaTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value
('Thangasdassdasdasdasdasda',1,1,1,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Quảng Nam');

insert into NhanVien(HoVaTen,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
value
('Thai Thi Thang Sang',1,1,1,'1998-10-18',123456879,8000000,123123123,'123@gmail.com','Quảng Nam');

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from khachhang
where (DiaChi = 'Đà Nẵng'
or  DiaChi = 'Quảng Trị')
and (timestampdiff(year,NgaySinh,curdate()) between 18 and 50) ;

-- 4.	Đ  ếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select KhachHang.IDKhachHang, KhachHang.HoVaTen, LoaiKhach.TenLoaiKhach, count(*) as SoLanDatPhong 
from 
KhachHang inner join LoaiKhach on KhachHang.IDLoaiKhach = LoaiKhach.IDLoaiKhach 
			left join HopDong on khachhang.IDKhachHang = hopdong.IDKhachHang	
            where LoaiKhach.TenLoaiKhach = 'Diamond'
group by IDKhachHang
order by SoLanDatPhong ;



-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
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
                

-- 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

select DichVu.IDDichVu,DichVu.TenDichVu,DichVu.DienTich, dichvu.ChiPhiThue, loaidichvu.TenLoaiDichVu
from dichvu 
			inner join hopdong on hopdong.IDDichVu = dichvu.IDDichVu
            inner join loaidichvu on loaidichvu.IDLoaiDichVu= dichvu.IDLoaiDichVu
            where hopdong.NgayLamHopDong  > '2019-03-31';

-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
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

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

-- Cách 1
select *
from khachhang 
group by HoVaTen;

-- Cách 2
select * 
from khachhang
where HoVaTen in (
			 select distinct HoVaTen
             from khachhang
             );

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select dichvu.TenDichVu, count(*) as SoLanDat , month(hopdong.NgayLamHopDong)'ThangDat'
from dichvu 
			inner join hopdong on dichvu.IDDichVu = hopdong.IDDichVu
            where year(hopdong.NgayLamHopDong) =2019
group by TenDichVu;

-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).

select hopdong.IDHopDong,hopdong.NgayLamHopDong,hopdong.NgayKetThuc,hopdong.TienDatCoc,count(IDHopDongChiTiet) as SoLuongDichVuDiKem
from hopdong
			inner join hopdongchitiet on hopdongchitiet.IDHopDong = hopdong.IDHopDong
group by IDHopDong;

-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
select dichvudikem.IDDichVuDiKem,dichvudikem.TenDichVuDiKem,khachhang.IDKhachHang,dichvudikem.Gia,dichvudikem.DonVi,dichvudikem.TrangThaiKhaDung
from dichvudikem
				inner join hopdongchitiet on hopdongchitiet.IDdichVuDiKem = dichvudikem.IDdichVuDiKem
                inner join hopdong on hopdong.IDHopDong = hopdongchitiet.IDHopDong
                inner join khachhang on khachhang .IDKhachHang= hopdong.IDKhachHang
                inner join loaikhach on khachhang.IDLoaiKhach = loaikhach.IDLoaiKhach
where loaikhach.TenLoaiKhach = 'Diamond' and khachhang.DiaChi in ('Vinh','Quảng Ngãi')
group by TenDichVuDiKem
order by IDdichVuDiKem asc;
-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
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
            
            

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

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
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.

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

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

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

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.

SET FOREIGN_KEY_CHECKS=0; 
delete 
from nhanvien 
where IDNhanVien not in (
select IDNhanVien
from hopdong
where year(hopdong.NgayLamHopDong ) between 2017 and 2019
) ;
SET FOREIGN_KEY_CHECKS=1;


-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.

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



-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).

-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.

-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.





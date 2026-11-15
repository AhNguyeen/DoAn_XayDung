# HỆ THỐNG QUẢN LÝ CÔNG TY XÂY DỰNG

## 1. Giới thiệu

**Hệ thống Quản lý Công ty Xây dựng** là phần mềm desktop được xây dựng nhằm hỗ trợ quản lý các hoạt động và thông tin trong doanh nghiệp xây dựng.

Phần mềm cung cấp giao diện quản lý dữ liệu thông qua Windows Forms, kết nối với cơ sở dữ liệu SQL Server để lưu trữ và xử lý thông tin về nhân sự, phòng ban, dự án, khách hàng, nhà cung cấp, vật tư, thiết bị và đơn nhập hàng.

Dự án được thực hiện với mục đích vận dụng kiến thức lập trình C#, thiết kế giao diện Windows Forms và quản lý cơ sở dữ liệu SQL Server vào một bài toán thực tế.

## 2. Công nghệ sử dụng

| Công nghệ | Mục đích |
|---|---|
| C# | Ngôn ngữ lập trình chính |
| Windows Forms | Xây dựng giao diện ứng dụng desktop |
| .NET Framework 4.7.2 | Nền tảng phát triển ứng dụng |
| Microsoft SQL Server | Quản lý và lưu trữ dữ liệu |
| ADO.NET | Kết nối và thao tác với cơ sở dữ liệu |
| SQL | Truy vấn và xử lý dữ liệu |
| Stored Procedure | Xây dựng các thủ tục xử lý dữ liệu trong SQL Server |
| Visual Studio | Môi trường phát triển |

## 3. Các chức năng chính

### 3.1. Quản lý nhân sự

- Quản lý thông tin nhân viên.
- Quản lý phòng ban.
- Quản lý chức vụ.
- Theo dõi thông tin nhân sự thuộc các phòng ban.

### 3.2. Quản lý dự án

- Quản lý danh sách dự án xây dựng.
- Theo dõi thông tin và địa điểm dự án.
- Quản lý kinh phí dự án.
- Theo dõi ngày khởi công và ngày kết thúc dự kiến.
- Quản lý trạng thái dự án.
- Liên kết dự án với khách hàng và phòng ban phụ trách.

### 3.3. Quản lý phân công công việc

- Quản lý thông tin phân công nhân viên vào dự án.
- Theo dõi vai trò của nhân viên trong từng dự án.
- Quản lý thời gian bắt đầu và kết thúc công việc.

### 3.4. Quản lý khách hàng và nhà cung cấp

- Quản lý thông tin khách hàng.
- Quản lý thông tin nhà cung cấp.
- Lưu trữ thông tin liên hệ như số điện thoại, email và địa chỉ.
- Phân loại nhà cung cấp theo loại hình cung ứng.

### 3.5. Quản lý kho

**Kho vật tư:**
- Quản lý danh sách vật tư xây dựng.
- Theo dõi tên vật tư, đơn vị tính và mô tả.

**Kho thiết bị:**
- Quản lý thông tin thiết bị.
- Theo dõi số serial.
- Quản lý trạng thái thiết bị như sẵn sàng, đang sử dụng, đang sửa chữa và thanh lý.

### 3.6. Quản lý đơn nhập hàng

- Quản lý thông tin đơn nhập hàng.
- Liên kết đơn hàng với dự án và nhà cung cấp.
- Theo dõi ngày đặt hàng.
- Theo dõi tổng giá trị đơn hàng.
- Quản lý trạng thái đơn hàng.
- Quản lý chi tiết hóa đơn nhập hàng, vật tư, thiết bị, số lượng và đơn giá.

## 4. Cấu trúc dự án

```text
DoAn_XayDung/
│
├── DoAn_XayDung.sln
│
├── DoAn_XayDung/
│   ├── Program.cs
│   ├── App.config
│   ├── DoAn_XayDung.csproj
│   │
│   ├── Frm_Menu.cs
│   ├── FrmNhanVien.cs
│   ├── FrmPhongBan.cs
│   ├── FrmChucVu.cs
│   ├── FrmKhachHang.cs
│   ├── FrmDuAn.cs
│   ├── FrmPhanCong.cs
│   ├── FrmNhaCungCap.cs
│   ├── FrmKhoVatTu.cs
│   ├── FrmKhoThietBi.cs
│   ├── FrmThongTinDonHang.cs
│   ├── FrmChiTietHoaDonNhapHang.cs
│   │
│   ├── Properties/
│   │
│   └── Resources/
│
├── Project_Database_CongTyXayDung.sql
├── Data_Project.sql
├── Store_Project.sql
│
└── README.md
```

*Lưu ý: Cấu trúc trên thể hiện các thành phần chính trong repository; các file Designer và Resource đi kèm từng Form được lược bớt để dễ theo dõi.*

## 5. Cài đặt và chạy chương trình

### 5.1. Yêu cầu môi trường

Trước khi chạy dự án, cần chuẩn bị:

- Windows 10 hoặc Windows 11.
- Visual Studio có hỗ trợ Windows Forms và .NET Framework 4.7.2.
- Microsoft SQL Server.
- SQL Server Management Studio (SSMS).

### 5.2. Tải source code

Clone repository về máy:

```bash
git clone https://github.com/AhNguyeen/DoAn_XayDung.git
```

Di chuyển vào thư mục dự án:

```bash
cd DoAn_XayDung
```

Mở file solution:

```text
DoAn_XayDung.sln
```

### 5.3. Khởi tạo cơ sở dữ liệu

Mở SQL Server Management Studio và thực hiện lần lượt các script SQL trong repository:

**Bước 1: Tạo cấu trúc cơ sở dữ liệu**

Chạy file:

```text
Project_Database_CongTyXayDung.sql
```

File này chứa các lệnh tạo cơ sở dữ liệu `CongTyXayDung`, các bảng dữ liệu, khóa chính, khóa ngoại và những ràng buộc cần thiết.

**Bước 2: Tạo Stored Procedure**

Chạy file:

```text
Store_Project.sql
```

File này chứa các Stored Procedure phục vụ thao tác dữ liệu của chương trình.

**Bước 3: Khởi tạo dữ liệu mẫu**

Chạy file:

```text
Data_Project.sql
```

File này cung cấp dữ liệu mẫu để phục vụ quá trình kiểm tra và sử dụng chương trình.

### 5.4. Cấu hình kết nối SQL Server

Source code hiện tại khai báo kết nối SQL Server trực tiếp trong các Form.

Ví dụ:

```csharp
SqlConnection conn = new SqlConnection(
    "Data Source=AnhNguyeen;Initial Catalog=CongTyXayDung;Integrated Security=True"
);
```

Trước khi chạy, cần kiểm tra và điều chỉnh:

- `Data Source`: Tên SQL Server hoặc SQL Server Instance trên máy tính.
- `Initial Catalog`: Tên cơ sở dữ liệu, mặc định là `CongTyXayDung`.
- `Integrated Security=True`: Sử dụng tài khoản Windows để xác thực SQL Server.

Nếu sử dụng SQL Server Authentication, cần cấu hình lại chuỗi kết nối cho phù hợp với tài khoản SQL Server.

**Lưu ý:** Cần kiểm tra chuỗi kết nối ở các Form có thao tác với cơ sở dữ liệu, tránh trường hợp một số Form vẫn sử dụng tên máy chủ cũ.

### 5.5. Chạy chương trình

1. Mở `DoAn_XayDung.sln` bằng Visual Studio.
2. Kiểm tra cấu hình kết nối SQL Server.
3. Đảm bảo cơ sở dữ liệu và các Stored Procedure đã được tạo thành công.
4. Chọn cấu hình `Debug` hoặc `Release`.
5. Nhấn `F5` hoặc chọn **Start** để chạy chương trình.

Ứng dụng khởi chạy thông qua Form menu chính được khai báo trong `Program.cs`.

## 6. Cơ sở dữ liệu

Cơ sở dữ liệu chính:

```text
CongTyXayDung
```

Các bảng dữ liệu chính được định nghĩa trong script SQL bao gồm:

| Bảng | Chức năng |
|---|---|
| ChucVu | Lưu thông tin chức vụ |
| PhongBan | Lưu thông tin phòng ban |
| NhanVien | Lưu thông tin nhân viên |
| KhachHang | Lưu thông tin khách hàng |
| DuAn | Lưu thông tin dự án |
| PhanCong | Lưu thông tin phân công nhân viên |
| NhaCungCap | Lưu thông tin nhà cung cấp |
| KhoVatTu | Lưu thông tin vật tư |
| KhoThietBi | Lưu thông tin thiết bị |
| ThongTinDonNhapHang | Lưu thông tin đơn nhập hàng |
| ChiTietHoaDonNhapHang | Lưu chi tiết hàng hóa trong đơn nhập |

Các mối quan hệ giữa những bảng được thiết lập thông qua khóa chính, khóa ngoại và các ràng buộc dữ liệu trong SQL Server.

## 7. Hướng phát triển

Một số định hướng có thể tiếp tục phát triển cho hệ thống:

- Hoàn thiện cơ chế đăng nhập và phân quyền người dùng.
- Chuẩn hóa quản lý chuỗi kết nối cơ sở dữ liệu.
- Bổ sung chức năng tìm kiếm, lọc và sắp xếp dữ liệu.
- Hoàn thiện thống kê và báo cáo tình hình hoạt động dự án.
- Mở rộng quản lý nhập, xuất và tồn kho vật tư, thiết bị.
- Nâng cao khả năng kiểm tra dữ liệu đầu vào và xử lý ngoại lệ.
- Cải thiện giao diện và trải nghiệm người dùng.

## 8. Tác giả

**GitHub:** [AhNguyeen](https://github.com/AhNguyeen)

**Repository:** [DoAn_XayDung](https://github.com/AhNguyeen/DoAn_XayDung)

---

*Dự án được thực hiện phục vụ mục đích học tập và nghiên cứu trong lĩnh vực phát triển phần mềm quản lý doanh nghiệp.*

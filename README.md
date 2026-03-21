PROJECT SETUP GUIDE - HEALTHCARE BOOKING SYSTEM
---

1. YÊU CẦU HỆ THỐNG

---

* NodeJS (>= 14)
* MySQL Server
* MySQL Workbench (khuyến nghị)

---

2. CÀI ĐẶT BACKEND

---

Mở terminal tại thư mục project và chạy:

npm init -y
npm install express mysql2 cors

---

3. CẤU HÌNH DATABASE

---

Mở MySQL Workbench và chạy file:

database/init.sql

---

4. CẤU HÌNH KẾT NỐI DATABASE

---

Trong file server.js, chỉnh lại thông tin:

host: "localhost"
user: "root"
password: "123456"
database: "HealthCare"

(Lưu ý: thay password theo máy của bạn)

---

5. LƯU Ý

---

* Đảm bảo MySQL đang chạy
* Port mặc định: 3306
* Không commit file .env lên GitHub

---

END

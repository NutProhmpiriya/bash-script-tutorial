# บทเรียน Bash Scripting สำหรับ DevOps

## 1. การจัดการไฟล์และโฟลเดอร์ (File & Directory Management)

### การสร้างและลบ

```bash
# สร้างโฟลเดอร์
mkdir folder_name              # สร้างโฟลเดอร์เดียว
mkdir -p path1/path2/path3    # สร้างโฟลเดอร์ซ้อนกัน

# ลบไฟล์และโฟลเดอร์
rm filename                   # ลบไฟล์
rm -r foldername             # ลบโฟลเดอร์และเนื้อหา
rm -f filename               # ลบโดยไม่ถามยืนยัน
```

### การย้ายและคัดลอก

```bash
# ย้ายและเปลี่ยนชื่อ
mv old_name new_name         # เปลี่ยนชื่อ
mv file /path/to/dest        # ย้ายไฟล์

# คัดลอก
cp file new_file            # คัดลอกไฟล์
cp -r folder new_folder     # คัดลอกโฟลเดอร์
```

## 2. การกำหนดสิทธิ์ไฟล์ (File Permissions)

### โครงสร้างสิทธิ์

- `r` (read) = 4
- `w` (write) = 2
- `x` (execute) = 1

### คำสั่งจัดการสิทธิ์

```bash
# รูปแบบตัวเลข
chmod 755 file.sh           # rwxr-xr-x
chmod 644 file.txt          # rw-r--r--

# รูปแบบตัวอักษร
chmod u+x file.sh           # เพิ่มสิทธิ์ execute ให้ user
chmod g-w file.txt          # ลบสิทธิ์ write จาก group

# เปลี่ยนเจ้าของ
chown user:group file.txt   # เปลี่ยนเจ้าของและกลุ่ม
```

## 3. การส่งต่อข้อมูลระหว่างคำสั่ง (Redirection & Pipes)

### การ Redirect

```bash
# Redirect output
echo "log" > file.txt       # เขียนทับ
echo "log" >> file.txt      # เขียนต่อท้าย

# Redirect error
command 2> error.log        # redirect stderr
command &> all.log          # redirect ทั้ง stdout และ stderr
```

### การใช้ Pipes

```bash
# พื้นฐาน Pipe
ls -l | grep ".txt"         # กรองไฟล์ .txt
ps aux | grep "nginx"       # หาโปรเซส nginx

# Pipe หลายคำสั่ง
cat log.txt | grep "ERROR" | sort | uniq -c
```

### ตัวอย่างการใช้งานจริง

```bash
# ค้นหาและนับจำนวน error ในไฟล์ log
grep "ERROR" /var/log/app.log | wc -l

# Monitor log realtime
tail -f access.log | grep "404"

# หาไฟล์ขนาดใหญ่และเรียงลำดับ
find . -type f -size +100M | xargs ls -lh | sort -k5 -rh
```

## แบบฝึกหัด

1. สร้าง script เพื่อ:

   - สร้างโครงสร้างโฟลเดอร์สำหรับ project
   - กำหนดสิทธิ์ที่เหมาะสม
   - สร้างไฟล์ log
   - จัดการ rotate log เก่า

2. สร้าง script monitor ระบบ:
   - ตรวจสอบพื้นที่ดิสก์
   - ถ้าใช้งานเกิน 80% ให้ archive log เก่า
   - ส่ง notification
   - บันทึกการทำงานทั้งหมด

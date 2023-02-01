## S3 - Simple Storage Service

#### Object-based storage

- Max file size: 5TB
- Unlimite storage
- File được lưu trong bucket
- Upload file thành cồng => trả về http code 200
- Bucket name là global và unique
- Normal url: https://{bucket-name}.s3-{region}.amazonaws.com`
- Static website hosting url: http://{bucket-name}.s3-website-{AWS-region}.amazonaws.com
- Có thể enable MFA Delete

#### Object-based storage

- File được lưu dưới dạng object, gồm các thông tin:
  + Key: tên object
  + Value: data của file (một chuỗi các byte)
  + Version ID: dùng cho versioning
  + Metadata: thông tin về data của file (người tạo, nguồn download file, …)

#### Data Consistency Model
- Read after write consistency for PUTS of new objects
  + Sau khi upload file mới, có thể đọc được ngay
- Eventual consistency for overwrite PUTS and DELETES
  + Sau khi update hoặc xóa file, ngay sau đó đọc file có thể sẽ trả về version cũ

#### Guarantees
- Availability: 99.99%
- Durability: 99.999999999 (11 số 9)

#### Storage classes
- Standard:
  + Lưu trữ trên nhiều AZ
  + Vẫn có thể hoạt động nếu 2 AZ down

#### IA (Infrequently Access):
- Phù hợp với data ít được access nhưng vẫn yêu cầu tốc độ access nhanh
- Rẻ hơn Srandard, tính phí mỗi lần request file

#### One zone - IA:
- Tương tự IA class
- Data chỉ lưu trên 1 AZ

#### Intelligent Tiering:
- Tự động chuyển đổi storage class của object nhằm tiếp kiệm chi phí
- Quyết định bởi tần suất access object

#### Glacier:
- Giá thành rẻ
- Thời gian get file có thể config từ vài phút cho tới 12h

#### Glacier deep Archive:
- Storage class có giá thành rẻ nhất
- Thời gian get file nằm trong khoảng 12-48h

Ngoại trừ One zone - IA, tất cả các class còn lại đều lưu file trên tối thiểu 3 AZ

#### Charges
- Storage
- Số lần request file
- Storage management Pricing
- Data transfer pricing
- Transfer Acceleration
- Sử dụng CloudFront để tăng tốc độ truyền tải file
- Cross region replication pricing

### Security & Encryption

#### Security:
- Access Control List: set permission cho từng object trong bucket
- Bucket Policies: set permisson cho toàn bộ object trong bucket
- CORS: config cross-origin resource sharing

#### Encryption:
- Encryption in Transit: Mã hóa dữ liệu khi di chuyển trên network (SSL/TLS)
- Encryption at Rest: Mã hóa dữ liệu trên ổ cứng, sử dụng key để mã hóa file:
- S3 Managed Keys (SSE-S3): key được quản lý hoàn toàn bởi amazon
- AWS Key Management Service (SSE-KMS): người dùng quản lý key thông qua service của amazon
- SSE-C: AWS dùng custom key của user để encryption

#### Version Control
- Lưu lại tất cả version của một object ngay cả khi xóa object
- Là công cụ backup hưu hiệu
- Một khi enable Versioning, không thể disable, chỉ có thể tạm dừng
- Có thể tương tác với Lifecycle rule
- Có thể sử dụng MFA Delete

#### Lifecycle Management

- Dùng để chuyển đổi storage class của các object một cách tự động
- Có thể sử dụng với Versioning
- Có thể set rule cho version hiện tại và version cũ

#### Cross region replication
- Yêu cầu enable Versioning trên source và destination bucket
- Source và destination bucket phải nằm trên 2 region khác nhau
- File tồn tài trước khi enable CRR sẽ không được replicate
- Delete file sẽ không replicate
- Delete version của file sẽ không replicate

#### CloudFront
- Content Delivery Nextwork (CDN) của Amazon
- Edge Location: Nơi cache file, nằm tách biệt khỏi region
- Origin: Nơi chứa file gốc (S3, EC2, ELB, …)
- Distribution: Tên tập hợp các Edge Location
- Distribution type:
- Web distribution: dùng cho nội dung web
- RTMP: dành cho Media Streaming
- Có thể set thời gian cache TTL
- Có thể yêu cầu clear cache trên Edge Location, mất phí
- Dùng Invalidations setting để list file ko cache lên Egde Location (hình dung như .gitinore)

#### Snowball
- Phục vụ cho việc transfer lượng data lớn lên tới petabyte
- Data được vận chuyển bằng đường bộ thay vì thông qua internet
- Có khả năng import/export data trên S3

#### Storage gateway
- Service cho phép kết nối môi trường có sẵn của doanh nghiệp với storage infrastructure của AWS
- Cung cấp đường truyền bảo mật, có khả năng scale và chi phí thấp
- Storage Gateway types:
- File Gateway: transfer file từ server người dùng tới S3 thông qua Network File System (NFS)
- Volume Gateway: backup bất động bộ volume từ server người dùng, tạo thành EBS snapshot trên AWS

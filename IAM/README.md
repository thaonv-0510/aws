## IAM - Identity Access Management

#### Thuật ngữ chính

- Root account: Là account đăng ký với AWS, có toàn quyền access tất cả resource trên AWS.
- Users: Là account được tạo ra bởi root account, chỉ được access các resource mà root account cho phép.
- Groups: Một nhóm các user, user có thể kế thừa các permission được gán cho group.

#### Policies:

- Một JSON document, định nghĩa một set các permission.
- Assign policy documment cho User/Group/Role để định nghĩa permission cho các thực thể đó

#### Roles:

- Có thể tạo và assign role cho các resource trên AWS để định nghĩa permission cho các resource đó
- VD: định nghĩa role full permission access S3 và gàn role cho instance EC2 => instance EC2 có toàn quyền thao tác với S3

#### Note

- IAM là một global service (không apply cho một region cụ thể nào cả)
- User mới tạo không có permission
- User có 2 cách để access aws (có thể dùng 1 trong 2 hoặc cả , tùy vào admin set):
  + Programmatic access: dùng Access Key ID và Secret Access Key để access thông qua AWS API, CLI, SDK
  + AWS Management Console access: dùng username/password để login vào AWS Console
    - Chỉ có thể nhận được Access Key ID và Secret Access Key một lần duy nhất khi tạo user. Nếu bị thất lạc key, dùng root account để generate cặp key mới.
    - Enable Multifacter Authentication (MFA) trên root account: để login vào AWS Console, ngoài việc cung cấp email/password, cần cùng cấp thêm một mã code sinh tự động được thay đổi liên tục
    - Có thể setup rule yêu cầu thay đổi password sau một khoảng thời gian nào đó, độ dài tối thiếu của password, …

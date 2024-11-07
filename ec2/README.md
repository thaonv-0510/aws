### EC2 - Elastic Compute Cloud
- Tên của instance được đặt theo quy tắc sau:
    + m5.2xlarge: size trong instance class
    + m: instace class
    + 5: generation (AWS có thể cải tiến và nâng cấp trong tương lai)
    + 2xlarge: kích thước của instance

- Sử dụng web server hiệu suất cao trong các trường hợp sau:
    + Xử lý batch (xử lý đồng loạt)
    + Media trancoding
    + High performance web server
    + High performance computing
    + Dedicated gaming server
EC2 purchasing options
- On-Demand instances: short workload, predictable pricing, pay by second
    + Chỉ trả cho những gì mình sử dụng(theo thời gian).
    + Linux, Window: Chi phí tính theo giây, tính sau phút đầu tiên.
    + OS khác: chi phí tính theo giờ.
    + Có giá cao nhất nhưng không phải trả trước.
    + Không cam kết dài hạn
    + Recommended cho short-term và un-interrupted workload và không thể dự đoán ứng dụng sẽ hoạt động như thế nào.
- Reserved:
    + Reserved instances: long workload
    + Convertible Reserved instances: long workload with fexible instances.

    + Upto 72% discount compared with on-demand
    + đặt trước một thuộc tính cụ thể của instacne(instance type, Region, Tenancy, OS)
    + Chỉ định thợi hạn đặt trước 1 năm hoặc 3 năm để nhận được nhiều discount.
    + Payment options: Không trả trước (+), Trả trước 1 phần(++), Trả trước toàn bộ(+++)
    + Scope: reserved instance nằm trong một region hoặc AZ cụ thể.
    + Recommended cho các ứng dụng yêu cầu sự ổn định(DB)
    + Có thể mua hoặc bán ở Reserved instance Marketplace.

    + Convertible Reserved instances: Có thể thay đổi Instance type, instance family, OS, scope and tenancy.
        Upto 66% discount.
- Saving Plans:
    + Nhận discount dựa trên việc sử dụng dài hạn(Upto 72% - giống với Reserved instance)
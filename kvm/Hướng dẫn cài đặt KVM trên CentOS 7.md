# Hướng dẫn cài đặt KVM trên CentOS 7
## 1. KVM là gì?
KVM (kernel-base Virtual Machine) là một phần mềm ảo hóa cho các hệ điều hành chạy nhân Linux, dành cho CPU hỗ trợ công nghệ ảo hóa Intel-VT/ AMD-V. KVM biến máy host/server trở thành một hypervisor.
## 2. Cài đặt KVM trên CentOS 7
### 2.1. Kiểm tra xem CPU Có hỗ trợ ảo hóa không?
Chạy lệnh sau kiểm tra xem CPU có hỗ trợ ảo hóa không    
`[root@thk_02 ~]# lscpu | grep Virtualization`  
`Virtualization:        VT-x`  
`Virtualization type:   full`     
`[root@thk_02 ~]# egrep -c "svm|vmx" /proc/cpuinfo`    
`4`

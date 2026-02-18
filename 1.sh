# 1. 确保服务器直连 (10.211.55.1 是你 PD 的网关)
sudo route add 182.237.2.41 10.211.55.1

# 2. 强制覆盖所有 IPv4 网段到 Xray 接口
sudo route -n add -net 1.0.0.0/8 -interface utun4
sudo route -n add -net 2.0.0.0/7 -interface utun4 
sudo route -n add -net 4.0.0.0/6 -interface utun4 
sudo route -n add -net 8.0.0.0/5 -interface utun4 
sudo route -n add -net 16.0.0.0/4 -interface utun4 
sudo route -n add -net 32.0.0.0/3 -interface utun4 
sudo route -n add -net 64.0.0.0/2 -interface utun4 
sudo route -n add -net 128.0.0.0/1 -interface utun4

# 3. 设置 DNS (让系统请求触发 Xray 的 FakeDNS)
sudo networksetup -setdnsservers virtio 1.1.1.1

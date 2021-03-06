global
    maxconn 4096                    
    daemon
    log 127.0.0.1   local0
    log 127.0.0.1   local1 notice

defaults
    timeout connect 10s
    timeout client 30s
    timeout server 30s

    log global
    mode http                         
    option httplog                     
    maxconn 3000

    stats enable
    stats uri /haproxyStats             
    stats auth admin:admin123           


frontend http-in
        bind *:80
        acl host_test1 hdr_dom(host) -i  testhaproxy1.com
        acl host_test2 hdr_dom(host) -i  testhaproxy2.com 

        use_backend bke_80_test1 if host_test1            
        use_backend bke_80_test2 if host_test2            

frontend https-in
        bind *:443
        mode tcp                                          
        option tcplog
        tcp-request inspect-delay 10s
        tcp-request content accept if { req_ssl_hello_type 1 }

        acl acl1 req.ssl_sni -m end testhaproxy1.com      
        acl acl2 req.ssl_sni -m end testhaproxy2.com       

        use_backend bke_443 if acl1 || acl2                


backend bke_80_test1
        balance roundrobin 
        option httpclose
        option forwardfor
        server server1 yahoo.com:80 check

backend bke_80_test2
        balance roundrobin
        option httpclose
        option forwardfor
        server server1 wikipedia.org:80 check
        server server2 bing.com:80 check
        server server3 google.com:80 check

 backend bke_443
        mode tcp
        balance source
        option ssl-hello-chk
        server server1 wikipedia.org:443 check
      
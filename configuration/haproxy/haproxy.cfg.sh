global
#        log 127.0.0.1   local0
#        log 127.0.0.1   local1 notice
#        log 127.0.0.1   local2
        log 127.0.0.1   local2 debug
        maxconn 45000                   # Total Max Connections. This is dependent on ulimit
        daemon
        nbproc  1                       # Number of processing cores. Dual Dual-core Opteron is 4 cores for example.
defaults
        log  global
        timeout server  86400000ms
        timeout connect 86400000ms
        timeout client  86400000ms
        timeout queue   1000s
	mode    http

listen  vt-01-webservice
        bind *:8686
        mode http
        cookie HTTP insert nocache
        balance roundrobin
        option forwardfor
        option httplog
        stats enable
        reqadd X-Forwarded-Proto:\ http
	server ivr-app1 10.58.98.231:8086 check
        server ivr-app2 10.58.98.232:8086 check

listen  vt-02-webservice
        bind *:8787
        mode http
        cookie HTTP insert nocache
        balance roundrobin
        option forwardfor
        option httplog
        stats enable
        reqadd X-Forwarded-Proto:\ http
        server ivr-app1 192.168.0.79:8087 check
        server ivr-app2 192.168.0.80:8087 check

listen  vt-03-lucky-webservice
        bind *:8989
        mode http
        cookie HTTP insert nocache
        balance roundrobin
        option forwardfor
        option httplog
        stats enable
        reqadd X-Forwarded-Proto:\ http
        server ivr-app1 192.168.0.79:8089 check
        server ivr-app2 192.168.0.80:8089 check

listen  vt-03-webservice
        bind *:8300
        mode http
        cookie HTTP insert nocache
        balance roundrobin
        option forwardfor
        option httplog
        stats enable
        reqadd X-Forwarded-Proto:\ http
        server ivr-app1 10.58.98.231:5100 check
        server ivr-app2 10.58.98.232:5100 check
		
listen  vt-04-webservice
        bind *:8400
        mode http
        cookie HTTP insert nocache
        balance roundrobin
        option forwardfor
        option httplog
        stats enable
        reqadd X-Forwarded-Proto:\ http
        server ivr-app1 10.58.98.231:3800 check
        server ivr-app2 10.58.98.232:3800 check		

listen  vt-05-lucky-webservice
        bind *:8585
        mode http
        cookie HTTP insert nocache
        balance roundrobin
        option forwardfor
        option httplog
        stats enable
        reqadd X-Forwarded-Proto:\ http
        server ivr-app1 192.168.0.79:8489 check
#        server ivr-app2 192.168.0.80:8085 check

listen  vt-06-xonefm-webservice
        bind *:8484
        mode http
        cookie HTTP insert nocache
        balance roundrobin
        option forwardfor
        option httplog
        stats enable
        reqadd X-Forwarded-Proto:\ http
        server ivr-app1 192.168.0.79:8289 check
        server ivr-app2 192.168.0.80:8289 check

listen stats 
	bind *:2345
        mode http
        stats enable
        stats uri /stats
        stats hide-version
        stats auth admin:g3P/h~YP
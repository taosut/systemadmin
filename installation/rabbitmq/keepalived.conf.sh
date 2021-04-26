! Configuration File for keepalived

vrrp_script chk_rabbitmq {
    script "nc -zv localhost 5672" 
    interval 5                   # default: 1s
}

vrrp_script chk_mysql {
    script "nc -zv localhost 3306"
    interval 5                   # default: 1s
}
vrrp_instance VI_1 {
    state MASTER
    interface ens192
    virtual_router_id 23
    priority 100
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass keepalived
    }
    virtual_ipaddress {
        10.54.150.123/27 dev ens192
    }
    track_script {
        chk_rabbitmq
    }
    track_script {
        chk_mysql
    }
}
vrrp_instance VI_2 {
    state MASTER
    interface ens224
    virtual_router_id 8
    priority 100
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass keepalived
    }
    virtual_ipaddress {
        192.168.13.8/24 dev ens224
    }
    track_script {
        chk_rabbitmq
    }
    track_script {
        chk_mysql
    }
}

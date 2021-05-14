import socket
client_socket = socket.socket()
port = 12345
client_socket.connect(('127.0.0.1',port))
#recieve connection message from server
recv_msg = client_socket.recv(1024)
print (recv_msg)
#send user details to server
raw_input = input()
send_msg = raw_input("Enter your user name(prefix with #): Namdp")
client_socket.send(send_msg)
#receive and send message from/to different user/s
while True:
    recv_msg = client_socket.recv(1024)
    print (recv_msg)
    send_msg = raw_input("Send your message in format [@user:message] ")
    if send_msg == 'exit':
        break;
    else:
        client_socket.send(send_msg)
client_socket.close()
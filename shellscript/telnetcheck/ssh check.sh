# ID chat Telegram
USERID="-308566103"

# API Token bot
TOKEN="1480902290:AAE1R5MrVakkj-5BlxczZ2VKhG_AOpKfOL4"

TIMEOUT="10"

# URL gửi tin nhắn của bot
URL="https://api.telegram.org/bot$TOKEN/sendMessage"

# Thời gian hệ thống
DATE_EXEC="$(date "+%d %b %Y %H:%M")"

# File temp
TMPFILE='/tmp/ipinfo.txt'

if [ -n "$SSH_CLIENT" ]; then
    IP=$(echo $SSH_CLIENT | awk '{print $1}')
    PORT=$(echo $SSH_CLIENT | awk '{print $3}')
    HOSTNAME=$(hostname -f)
    IPADDR=$(echo $SSH_CONNECTION | awk '{print $3}')

    # Lấy các thông tin từ IP người truy cập theo trang ipinfo.io
    curl http://ipinfo.io/$IP -s -o $TMPFILE
    CITY=$(cat $TMPFILE | jq '.city' | sed 's/"//g')
    REGION=$(cat $TMPFILE | jq '.region' | sed 's/"//g')
    COUNTRY=$(cat $TMPFILE | jq '.country' | sed 's/"//g')
    ORG=$(cat $TMPFILE | jq '.org' | sed 's/"//g')

    # Nội dung cảnh báo
    TEXT=$(echo -e "Thời gian: $DATE_EXEC\nUser: ${USER} logged in to $HOSTNAME($IPADDR) \nFrom $IP - $ORG - $CITY, $REGION, $COUNTRY on port $PORT")

    # Gửi cảnh báo
    curl -s -X POST --max-time $TIMEOUT $URL -d "chat_id=$USERID" -d text="$TEXT" > /dev/null

    # Xóa file temp khi script thực hiện xong
    rm $TMPFILE
fi


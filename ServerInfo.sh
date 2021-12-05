#!/bin/bash

export PATH="$PATH:/usr/local/bin/"

api_key="XXXX:XXXXXX"
chat_id="XXXXXXX"

function send_message {
curl -v --connect-timeout 5 --max-time 10 --retry 10 --retry-delay 0 --retry-max-time 120 "https://api.telegram.org/bot${api_key}/sendMessage" -d "chat_id=${chat_id}" -d "parse_mode=HTML" -d "text=${message}"
}

#Commands to be executed
df=$(df -h )
uname=$(uname -a)
uptime=$(uptime)

#HTML Style message
read -r -d '' message <<EOT
<b>Espacio en disco </b>
<b>${df}</b>
<b></b>
<b>Sistema Operativo</b>
<pre>${uname}</pre>
<b></b>
<b>Server Uptime</b>
<pre>${uptime}</pre>
EOT

send_message

#!/bin/bash
# Деплой мини-аппа + сброс кэша Telegram WebView через ?v=<epoch> в кнопке меню.
# После setChatMenuButton проверяет, что кнопка реально обновилась (с ретраями).
set -e
cd "$(dirname "$0")"

MSG="${1:-update}"
git add -A
git commit -m "$MSG" >/dev/null 2>&1 || true
git push -q origin main

V="$(date +%s)"
URL="https://mrden12.github.io/ne-kuri/?v=$V"

python3 - "$URL" <<'PY'
import json,sys,time,urllib.request
url=sys.argv[1]
tok=open('.bot_token').read().strip()
def api(m,p=None):
    u='https://api.telegram.org/bot%s/%s'%(tok,m)
    d=json.dumps(p).encode() if p is not None else None
    r=urllib.request.Request(u,data=d,headers={'Content-Type':'application/json'})
    return json.load(urllib.request.urlopen(r))
api('setChatMenuButton',{"menu_button":{"type":"web_app","text":"🚭 Не курю","web_app":{"url":url}}})
ok=False
for i in range(8):
    time.sleep(3)
    cur=api('getChatMenuButton',{})['result']['web_app']['url']
    if cur==url:
        print('menu button verified ✅', cur); ok=True; break
if not ok:
    print('WARN: menu button не обновился, текущий:', cur)
PY
echo "deployed: $URL"

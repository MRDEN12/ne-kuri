#!/bin/bash
# Деплой мини-аппа «Не курю»:
#  1) генерит новый APP_ID, пишет его в index.html и version.json (для само-обновления клиента);
#  2) коммитит и пушит в GitHub Pages;
#  3) best-effort обновляет кнопку-меню бота (?v=<id>) — для сброса кэша вебвью.
set -e
cd "$(dirname "$0")"

MSG="${1:-update}"
ID="$(date +%Y%m%d%H%M%S)"

python3 - "$ID" <<'PY'
import sys,re,json
i=sys.argv[1]
h=open('index.html',encoding='utf-8').read()
h2=re.sub(r"const APP_ID='[^']*';", "const APP_ID='%s';"%i, h)
assert h2!=h or "const APP_ID='%s';"%i in h2, "APP_ID не найден в index.html"
open('index.html','w',encoding='utf-8').write(h2)
json.dump({"id":i}, open('version.json','w'))
print("APP_ID ->",i)
PY

git add -A
git commit -m "$MSG" >/dev/null 2>&1 || true
git push -q origin main

python3 - "$ID" <<'PY'
import json,sys,time,urllib.request
i=sys.argv[1]
url="https://mrden12.github.io/ne-kuri/?v=%s"%i
tok=open('.bot_token').read().strip()
def api(m,p=None):
    u='https://api.telegram.org/bot%s/%s'%(tok,m)
    d=json.dumps(p).encode() if p is not None else None
    r=urllib.request.Request(u,data=d,headers={'Content-Type':'application/json'})
    return json.load(urllib.request.urlopen(r))
try:
    api('setChatMenuButton',{"menu_button":{"type":"web_app","text":"🚭 Не курю","web_app":{"url":url}}})
    cur=api('getChatMenuButton',{})['result']['web_app']['url']
    print('menu button:',cur, '(ok)' if cur==url else '(лаг/лимит, не критично — есть само-обновление)')
except Exception as e:
    print('menu button set failed (не критично):',e)
PY
echo "deployed id=$ID"

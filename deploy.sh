#!/bin/bash
# Деплой мини-аппа + сброс кэша Telegram WebView через ?v=<epoch> в кнопке меню.
set -e
cd "$(dirname "$0")"

MSG="${1:-update}"
git add -A
git commit -m "$MSG" >/dev/null 2>&1 || true
git push -q origin main

TOKEN="$(cat .bot_token)"
V="$(date +%s)"
URL="https://mrden12.github.io/ne-kuri/?v=$V"

curl -s -X POST "https://api.telegram.org/bot$TOKEN/setChatMenuButton" \
  -H 'Content-Type: application/json' \
  -d "{\"menu_button\":{\"type\":\"web_app\",\"text\":\"🚭 Не курю\",\"web_app\":{\"url\":\"$URL\"}}}" \
  | python3 -c "import sys,json;d=json.load(sys.stdin);print('menu_button ok:',d.get('ok'))"

echo "deployed: $URL"

#!/usr/bin/env bash
# 将旧用户站静态产物改写为 /yu-peng-stack/ 子路径并输出到 out/
set -euo pipefail

SRC="${1:-site}"
OUT="${2:-out}"
BASE="/yu-peng-stack"

rm -rf "$OUT"
mkdir -p "$OUT"

# 只复制已发布的静态资源（排除 Hexo 源码目录）
rsync -a \
  --exclude 'source/' \
  --exclude 'themes/' \
  --exclude 'scaffolds/' \
  --exclude 'package.json' \
  --exclude 'package-lock.json' \
  --exclude '_config.yml' \
  --exclude '.git/' \
  --exclude '.github/' \
  --exclude 'README.md' \
  "$SRC/" "$OUT/"

# 改写站内绝对路径（保留协议相对 URL：//cdn...）
while IFS= read -r -d '' f; do
  sed -i \
    -e 's|href="//|href="__HEXO_PROTO__|g' \
    -e 's|src="//|src="__HEXO_PROTO__|g' \
    -e "s|href=\"/|href=\"${BASE}/|g" \
    -e "s|src=\"/|src=\"${BASE}/|g" \
    -e "s|content=\"/|content=\"${BASE}/|g" \
    -e "s|url(/|url(${BASE}/|g" \
    -e 's|href="__HEXO_PROTO__|href="//|g' \
    -e 's|src="__HEXO_PROTO__|src="//|g' \
    "$f"
done < <(find "$OUT" -type f \( -name '*.html' -o -name '*.css' \) -print0)

test -s "$OUT/index.html"
echo "OK: $(wc -c < "$OUT/index.html") bytes index.html"
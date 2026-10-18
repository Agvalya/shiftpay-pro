#!/usr/bin/env bash
set -euo pipefail
read -rp "GitHub username: " GH_USER
read -rp "Repository name: " REPO
read -rp "Google Play URL: " PLAY_URL
read -rp "Real support email: " SUPPORT_EMAIL
read -rp "Custom domain (leave blank for github.io): " DOMAIN
if [[ -n "$DOMAIN" ]]; then
  SITE_URL="https://$DOMAIN"; BASEURL=""
  printf '%s\n' "$DOMAIN" > CNAME
else
  SITE_URL="https://$GH_USER.github.io"; BASEURL="/$REPO"
  rm -f CNAME
fi
python3 - "$SITE_URL" "$BASEURL" "$PLAY_URL" "$SUPPORT_EMAIL" <<'PY'
from pathlib import Path
import sys
site_url, baseurl, play, email = sys.argv[1:]
p=Path('_config.yml')
s=p.read_text()
repl={
'https://YOUR-GITHUB-USERNAME.github.io':site_url,
'/YOUR-REPOSITORY-NAME':baseurl,
'https://play.google.com/store/apps/details?id=YOUR.PACKAGE.ID':play,
'YOUR-REAL-SUPPORT-EMAIL@example.com':email,
}
for a,b in repl.items(): s=s.replace(a,b)
p.write_text(s)
r=Path('robots.txt').read_text()
r=r.replace('https://YOUR-GITHUB-USERNAME.github.io/YOUR-REPOSITORY-NAME', site_url+baseurl)
Path('robots.txt').write_text(r)
PY
if grep -R --exclude='setup-site.sh' --exclude='README.md' -E 'YOUR-|example\.com' .; then
  echo "Unresolved placeholders remain. Fix them before publishing." >&2; exit 1
fi
echo "Configured. Review privacy.html and terms.html before publishing."


set -euo pipefail

cd "$(dirname "$0")"

export PATH="/Library/TeX/texbin:$PATH"


if ! command -v pdflatex >/dev/null 2>&1; then
  echo "Error: pdflatex not found on PATH. Check BasicTeX install and PATH."
  exit 1
fi

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Error: pandoc not found. Install with: brew install pandoc"
  exit 1
fi

echo "Building mitchopolis_master_cheat_sheet_v2.pdf ..."
pandoc mitchopolis_master_cheat_sheet_v2.md \
  -o mitchopolis_master_cheat_sheet_v2.pdf \
  --pdf-engine=pdflatex

echo "Done."
ls -lh mitchopolis_master_cheat_sheet_v2.pdf

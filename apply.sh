#!/bin/sh

# 実行ファイルのパスを保持
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# 既存の設定ファイルをバックアップ
cd $HOME
TIMESTAMP=`date +%s`

BASH_PROFILE=".bash_profile"
if [ -e $BASH_PROFILE ]; then
  mv "${BASH_PROFILE}" "${BASH_PROFILE}_${TIMESTAMP}.bak"
fi

BASHRC=".bashrc"
if [ -e $BASHRC ]; then
  mv "${BASHRC}" "${BASHRC}_${TIMESTAMP}.bak"
fi

# 設定ファイルをホームディレクトリにコピー
cp -rp "${SCRIPT_DIR}/${BASH_PROFILE}" "${HOME}/${BASH_PROFILE}"
cp -rp "${SCRIPT_DIR}/${BASHRC}" "${HOME}/${BASHRC}"

# .bash_profileを読み込み直す
source "${HOME}/${BASH_PROFILE}"

echo "Applied setting files."
exit 0


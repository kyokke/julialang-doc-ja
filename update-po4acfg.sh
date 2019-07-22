#!/bin/bash

DIR=$(cd $(dirname $0); pwd)

SOURCE_REPO=https://github.com/JuliaLang/julia.git
SOURCE_REVISION=55e36cc308b66d3472990a06b2797f9f9154ea0a
REPO_DIR=ext/julia

SOURCE_DIR=doc/src
TRANSLATED_DIR=translated
TARGET_LANG=ja_JP

# ここを変える必要がある
DOCS="\
  . \
  manual \
  base \
  devdocs"

TARGET_EXT=md
OUT_FILE=po4a.cfg
IGNORE_FILE=#topics.adoc
# FORCE_TEXT_FILE="topics/templates/document-attributes-community.adoc|topics/templates/document-attributes-product.adoc"

OUT_FILE=$DIR/$OUT_FILE

# Clone
#git clone $SOURCE_REPO $REPO_DIR
cd $REPO_DIR
#git checkout $SOURCE_REVISION
git reset --hard HEAD && git clean -f

# Generate base config
cat << EOS > $OUT_FILE
# Don't edit this file directly!
[po_directory] po4a/po
[po4a_alias:mymd] text opt:"-k 0 -M utf-8 -L utf-8 -o markdown"

EOS

# Generate config per document
cd $SOURCE_DIR
for doc in $DOCS; do
    echo "# $doc" >> $OUT_FILE

    # for file in `\find $doc -maxdepth 0 -name "*.$TARGET_EXT" -not -name "index.$TARGET_EXT"`; do
    for file in `\find $doc -maxdepth 1 -name "*.$TARGET_EXT"`; do
        if [[ "$file" =~ /${IGNORE_FILE}$ ]]; then
            echo "Ignore: $file"
            continue
        fi

        # Checking the size because po4a can't handle 0 byte file
        if [[ ! -s "$file" ]]; then
            echo "Skipped (0 byte): $file"
            continue
        fi

        PO4A_TYPE=mymd
        # grep "^\`\`\`" $file > /dev/null
        # HAS_CODE=$?
        # grep "^|===" $file > /dev/null
        # HAS_TABLE=$?
        # if [[ "$HAS_CODE" -eq 0 ]] || [[ "$HAS_TABLE" -eq 0 ]]; then
        #     echo "Handling as text: $file"
        #     PO4A_TYPE=mytext
        # fi
        # if [[ "$file" =~ ${FORCE_TEXT_FILE} ]]; then
        #     echo "Handling as text: $file"
        #     PO4A_TYPE=mytext
        # fi

        MASTER_FILE=`echo $file | sed -e "s|^$DIR||"`
        OUT_MASTER_FILE=`echo $MASTER_FILE | sed -e "s|\.$TARGET_EXT$||"`
        #echo "[type: $PO4A_TYPE] $REPO_DIR/$SOURCE_DIR/$MASTER_FILE \$lang:$TRANSLATED_DIR/\$lang/$MASTER_FILE master:file=$OUT_MASTER_FILE" >> $OUT_FILE
        echo "[type: $PO4A_TYPE] $REPO_DIR/$SOURCE_DIR/$MASTER_FILE \$lang:$TRANSLATED_DIR/\$lang/$MASTER_FILE" >> $OUT_FILE
        echo "Add: $file"

        # MASTER_DIR=`echo $MASTER_FILE | sed -s "s|\(.*\)/.*|\1|"`
        # mkdir -p $DIR/i18n/pot/$MASTER_DIR
        # for tl in $TARGET_LANG; do
        #     mkdir -p $DIR/i18n/po/$tl/$MASTER_DIR
        # done
    done

    echo "" >> $OUT_FILE
done


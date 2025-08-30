#!/bin/sh

if [ "$ROFI_RETV" = "1" ]; then
    nohup xdg-open "$1"
    exit 0
fi

FIREFOX_DIR=$HOME/.mozilla/firefox
PROFILE_ID=$(sed -n 's/^Default=//p' $FIREFOX_DIR/installs.ini)
BOOKMARKS_FILE="$FIREFOX_DIR/$PROFILE_ID/places.sqlite"

SQL="
WITH RECURSIVE bookmarks_tree(bookmark_id, root_id) AS (
    SELECT id AS bookmark_id, id AS root_id
    FROM moz_bookmarks
    WHERE parent = 1
    UNION ALL
    SELECT b.id AS bookmark_id, tree.root_id
    FROM moz_bookmarks b
    JOIN bookmarks_tree tree ON b.parent = tree.bookmark_id
)
SELECT bookmark.title, place.url, place.preview_image_url, place.frecency
FROM bookmarks_tree tree
JOIN moz_bookmarks bookmark ON bookmark.id = tree.bookmark_id
JOIN moz_bookmarks root ON root.id = tree.root_id
JOIN moz_places place ON place.id = bookmark.fk
WHERE tree.bookmark_id != tree.root_id
    AND root.title = 'toolbar'
ORDER BY place.frecency DESC
LIMIT 100
"

sqlite3 -json "file:${BOOKMARKS_FILE}?immutable=1" "$SQL" | jq -r '.[] | "\(.url)\u0000display\u001f\(.title)\u001fmeta\u001f\(.title)"'

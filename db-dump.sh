sqlite3 ebilltoy-main.sqlite3 ".dump ebills"
sqlite3 ebilltoy-main.sqlite3 ".dump payments"
sqlite3 ebilltoy-main.sqlite3 ".dump ebill_updates"

echo -- ebills  -----------------------------------
sqlite3 ebilltoy-main.sqlite3 -line "select * from ebills"

echo -- payments -----------------------------------
sqlite3 ebilltoy-main.sqlite3 -line "select * from payments"

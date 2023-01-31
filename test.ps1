echo "`n`n`n`n`n"

function fmtjson($json)
{
    # dn why we need the \ but it works
    return $json -replace "\s+"," "  -replace '"', '\"'
}



echo "Before -----------------------------------------"
curl http://localhost:4567/ebills | jq | bat -P -l json



echo "Creating ebill..."
$json = fmtjson '
    {
        "userRef":"1",
        "ebillRef":"10",
        "amount":10.01,
        "dateDue":"2022-12-31",
        "billerRef":"1"
    }'
echo "Posting content: $json"
curl.exe http://localhost:4567/ebills -d $json | jq | bat -P -l json



echo "Creating payments..."
$json = fmtjson '
    {
        "paymentRef":"1",
        "dateSubmitted":"2022-11-27",
        "ebillRef":"10",
        "amount":5.01,
        "fromAccountRef":"USBANK:10001234"
    }'

curl.exe http://localhost:4567/payments -d $json | bat -P -l json
curl.exe http://localhost:4567/payments -d $json | bat -P -l json



echo "After -----------------------------------------"
curl http://localhost:4567/ebills  | jq | bat -P -l json

# this gives a flattened view
curl http://localhost:4567/ebills2 | jq | bat -P -l json





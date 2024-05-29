import requests
def get_naver(query):
    s = 1
    url = "https://openapi.naver.com/v1/search/local?query={0}&start={1}&display=20".format(query,s)
    CLIENT_ID = "lfSg8_GIvPjg_23n4SRf"
    SECRET = "HxNwvFne4C"
    header = {"X-Naver-Client-Id": CLIENT_ID
              ,"X-Naver-Client-Secret":SECRET}
    res = requests.get(url, headers=header)
    json_data = res.json()
    return json_data
# items = json_data['items']
# for i, v in enumerate(items):
#     print(v)
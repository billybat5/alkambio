import requests

session = requests.session()

burp0_url = "https://api.alcambio.app/graphql"
burp0_headers = {
    "Sec-Ch-Ua-Platform": '"Linux"',
    "Accept-Language": "es-419,es;q=0.9",
    "Sec-Ch-Ua": '"Not=A?Brand";v="24", "Chromium";v="140"',
    "Sec-Ch-Ua-Mobile": "?0",
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36",
    "Accept": "*/*",
    "Apollographql-Client-Version": "1.0.0",
    "Content-Type": "application/json",
    "Apollographql-Client-Name": "web",
    "Origin": "https://alcambio.app",
    "Sec-Fetch-Site": "same-site",
    "Sec-Fetch-Mode": "cors",
    "Sec-Fetch-Dest": "empty",
    "Referer": "https://alcambio.app/",
    "Accept-Encoding": "gzip, deflate, br",
    "Priority": "u=1, i",
}
burp0_json = {
    "operationName": "getCountryConversions",
    "query": "query getCountryConversions($countryCode: String!) {\n  getCountryConversions(payload: {countryCode: $countryCode}) {\n    _id\n    baseCurrency {\n      code\n      decimalDigits\n      name\n      rounding\n      symbol\n      symbolNative\n      __typename\n    }\n    country {\n      code\n      dial_code\n      flag\n      name\n      __typename\n    }\n    conversionRates {\n      baseValue\n      official\n      principal\n      usesRateValue\n      rateCurrency {\n        code\n        decimalDigits\n        name\n        rounding\n        symbol\n        symbolNative\n        __typename\n      }\n      rateValue\n      type\n      __typename\n    }\n    dateBcvFees\n    dateParalelo\n    dateBcv\n    createdAt\n    __typename\n  }\n}",
    "variables": {"countryCode": "VE"},
}
session.post(burp0_url, headers=burp0_headers, json=burp0_json)

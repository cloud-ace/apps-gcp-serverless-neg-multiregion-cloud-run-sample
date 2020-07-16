import os
import requests
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    url = 'http://metadata.google.internal/computeMetadata/v1/instance/zone'
    request_headers = {
        'Metadata-Flavor': 'Google'
    }
    try:
        response = requests.get(url=url, headers=request_headers)
    except:
        return 'unknown zone.'

    print(response)
    return 'Zone: {}\n'.format(response.text), response.status_code

if __name__ == "__main__":
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))

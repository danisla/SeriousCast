# SeriousCast

This is a SiriusXM Internet Radio to SHOUTcast bridge server.
It handles authentication and decryption of SiriusXM streams and remuxes them
into a format appropriate for standard internet radio streaming clients.

SeriousCast also offers a simple web streaming interface for all of its streams
using the VLC browser plugin.

## Requirements

SeriousCast is written in Python 3.

It has dependencies on:
* [cryptography](https://cryptography.io/en/latest/)
* [Requests](http://docs.python-requests.org/en/latest/)
* [Jinja2](http://jinja.pocoo.org/docs/)
* [bitstring](http://pythonhosted.org//bitstring/)

You can use `pip install -r requirements.txt` to install these packages. Windows users will need to
get an [OpenSSL binary](https://www.openssl.org/related/binaries.html). Linux users will need the
relevant packages installed to [build cryptography](https://cryptography.io/en/latest/installation/#building-cryptography-on-linux).

An experimental HTTP Live Streaming server is being implemented using Flask, in `flask_server.py`.
Flask is not required to run the SHOUTcast server.

## Setup

Make a copy of settings-example.cfg named settings.cfg.
Replace the `username` and `password` fields with your SiriusXM credentials.
The `hostname` field should be set to the publicly accessible hostname (or IP
address) for your server.

After editing the configuration file, you should be able to run `server.py`
to start the service. Navigate to the configured port (default 30000) in a web
browser to get a list of available channels. Each channel has a "Stream" option,
which plays in your browser window, and a "Playlist" option, which downloads
a .pls file for use in your SHOUTcast player of choice.

## Docker

Building docker container:

    docker build -t seriouscast:latest .

Starting container:


    export XM_USERNAME=<your XM username>
    export XM_PASSWORD=<your XM password>
    docker run -d --name seriouscast \
      -e XM_USERNAME=$XM_USERNAME \
      -e XM_PASSWORD=$XM_PASSWORD \
      -e PUBLISH_HOST=example.com \
      -e PUBLISH_PORT=30000 \
      -e URL_SCHEME=http \
      -e LISTEN_PORT=30000 \
      seriouscast:latest

## License

SeriousCast is licensed under the MIT (Expat) License.

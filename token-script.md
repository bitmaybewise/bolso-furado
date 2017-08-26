# Getting your token the easy way

The bolso-furado gem comes with a script to help you get your pocket token. Just run the following script passing your consumer key:

    $ bolso-furado-token -k 68583-ceb7f902cac956bc671bd299

    [2017-08-25 21:41:04] INFO  WEBrick 1.3.1
    [2017-08-25 21:41:04] INFO  ruby 2.4.0 (2016-12-24) [x86_64-linux]
    [2017-08-25 21:41:04] INFO  WEBrick::HTTPServer#start: pid=29060 port=9999
    Authorize bolso-furado-token script using the following url:
    https://getpocket.com/auth/authorize?redirect_uri=http%3A%2F%2F127.0.0.1%3A9999%2F&request_token=a505aae8-fa08-07de-f578-42cd04
    [2017-08-25 21:41:11] INFO  going to shutdown ...
    127.0.0.1 - - [25/Aug/2017:21:41:11 -03] "GET / HTTP/1.1" 200 31
    - -> /
    [2017-08-25 21:41:11] INFO  WEBrick::HTTPServer#start done.
    Your token is
    91142ba0-acfb-373c-735c-8e072b
  
A webrick server will be started to create a temporary app to be used in order to authorize the pocket app and get your token.

After that just run bolso-furado along with consumer key and your token. Check on [README](README.md).
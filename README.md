# bolso-furado

Tag your old articles on Pocket as "bolso-furado"

# How to use

Install the gem:

    $ gem install bolso-furado

Create a Pocket application.

Get consumer key and token (if you don't have one, use [bolso-furado-token](token-script.md) script).

Run script with consumer key and token:

    $ bolso-furado -k 68583-ceb7f902cac956bc671bd299 -t 91142ba0-acfb-373c-735c-8e072b -d 20
    21 item(s) untagged
    17 recent item(s) untagged
    4 item(s) tagged as bolso-furado

Day parameter is optional. Default will be 30 days.
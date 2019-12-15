### send-mail: A simple Windows MTA to send mail using SMTP SSL.

Perform the following steps to setup send-mail to the SMTP server:

- Configure the SMTP Server IP at [send-mail.bat](send-mail.bat)
- Check the send mail works invoking: [send-mail.bat](send-mail.bat)
- Once the configuration is working schedule a daily task: `send-mail.bat daily`

#### Usage

~~~
C:\send-mail> send-mail.bat usage

usage: send-mail.bat [usage|daily|disable|status]
- usage: show send-mail.bat usage
- daily: schedule daily send-mail.bat task
- disable: delete send-mail.bat daily schedule task
- status: show send-mail.bat status
- otherwise, run the send-mail
~~~

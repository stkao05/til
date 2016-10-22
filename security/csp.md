# Content Security Policy (CSP)

CSP allows web application to inform browser what resources (i.e. js, css, images,...) are considered safe/authorized and hence safe to be loaded. CSP could be delcared in both HTTP header or in a HTML <meta> tags.

```
Content-Security-Policy: script-src 'self' https://apis.google.com
```

The above CSP declares that any JavaScript from the same origin or from https://apis.google.com are safe to load. The browser will throw error if the page try to load script file from other source, such as https://evil.com.



## Use CSP to prevent inline script injection

One most commnon XSS attacks is inline script injection. For instance, attacker could try to inject a malicious script by saving it as a part of web app datas. When the web app re-display the data, the script could get executed.

```
<script>sendMyDataToEvilDotCom();</script>
```

CSP solves this problem by banning inline script entirely.






Reference:
http://www.html5rocks.com/en/tutorials/security/content-security-policy/

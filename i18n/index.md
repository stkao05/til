


# String localization tool trade-off


__gettext _()__

```
<a>_("Add to car")</a>
```


Good
- Development friendly. Easy to define (directly defined in your code file) and easy to read.

Bad
- Slightly cache unfriendly, as your localized string is part of app JS file. When making the update to a existing string, for instance:

```
// old string
<a>_("Add to car")</a>

// new string
<a>_("Add to my car")</a>
```

You app's JS file will need to be updated.


__ID placeholder approach__

You assigned each localized string a ID

```
t("add_car")
```

And you define a mapping between ID and the actual string somewhere
```
{
    "add_car": "Add to my car"
}
```

Good
- Cache friendly: updating a existing string won't need to update the main app JS file


Bad
- Development unfriendly. You need to touch two files to define your string (code file and the mapping file)

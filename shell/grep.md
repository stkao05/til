# grep
- Use the extended flag `-E` to enable full regular expression
- Enclose the whole regular expression with double quote. i.e. `".*"`

# sed

caveat:
- The `$` character means the end of the line, not capture group
- Capture group syntax is `\(PATTERN\)`. The `\1` reference first capture group

Example:
```
sed -e "s/require(['\"]\(.*\)\.coffee\.\(.*\)\.js['\"])/require(\"\1\2\")/g"
```

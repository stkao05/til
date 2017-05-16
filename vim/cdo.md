Use `:cdo` command to run command on each files listed in the quickfix window.

Example: To find and replace string.
```
# search 'foo'
:Ack foo

# replace 'foo' with 'bar'
:cdo s/foo/bar/g | update
```

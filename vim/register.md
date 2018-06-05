Register syntax
```
"{register_key}{command}
```

Example:
```
// yank the current line to regsiter 'a'
"ayy

// paste the stored line in regsiter 'a'
"ap
```

You can also copy text selected from the visual mode:
- select text in virsual mode
- type `"ay` to copy text into register "a"

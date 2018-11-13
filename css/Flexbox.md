# Flexbox 

Feature 
- flexible sizing of containing items
- horizontal and vertical alignment of items


# Basic 

`main axis`
`cross axis`


# Flexible sizing of flex items

```
article {
  flex: 1;
}
article:nth-of-type(3) {
  flex: 2;
}
```

This is a unitless proportion value that dictates how much of the available space along the main axis each flex item will take up.

You can also specify a minimum size value inside the flex value. Try updating your existing article rules like so:

```
article {
  flex: 1 200px;
}

article:nth-of-type(3) {
  flex: 2 200px;
}
```

This basically states "Each flex item will first be given 200px of the available space. After that, the rest of the available space will be shared out according to the proportion units." Try refreshing and you'll see a difference in how the space is shared out.



# Horizontal and vertical alignment

`align-items`: controls where the flex items sit on the cross axis.

- By default, the value is `stretch`, which stretches all flex items to fill the parent in the direction of the cross axis. If the parent hasn't got a fixed width in the cross axis direction, then all flex items will become as long as the longest flex items. This is how our first example got equal height columns by default.

- `center` causes the items to maintain their intrinsic dimensions, but be centered along the cross axis. This is why our current example's buttons are centered vertically.

- You can also have values like flex-start and flex-end, which will align all items at the start and end of the cross axis respectively. See align-items for the full details.


`align-self`: override the align-items behavior for individual flex items


`justify-content` controls where the flex items sit on the main axis.


# Problem with using genetic name

```
<body>
    <h1 class="header"> </h1>
    <svg class="close-icon"> </svg>

    <div class="some-children-component">
        <h6 class="header"> </h6>
    </div>
</body>
```

The CSS style should leak down to children component.

Solution: Children component could use BEM style


# Use modifier class

```
// No modifier
// `ist-btn-sm` CSS has to have all the btn style,
// which makes CSS larger
<a class="ist-btn-sm" />


// Modifier class
// `ist-btn--sm` CSS just needs to contain
// all the variant style needed.
<a class="ist-btn ist-btn--sm" />
```

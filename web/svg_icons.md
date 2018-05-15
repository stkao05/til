# SVG Icons System

SVG is a XML, and you can’t load a XML file from different locations.








## Approaches

### Inlined SVG
Directly include the SVG in HTML.

```
//somewhere in your HTML
<div>
	<svg aria-hidden="true" class="octicon octicon-plus" width="12" height="16" role="img" version="1.1" viewBox="0 0 12 16">
	    <path d="M12 9H7v5H5V9H0V7h5V2h2v5h5v2z"></path>
	</svg>
</div>
```

Pros:
- You can apply various CSS rule to style or animate the icon.
- Most appropriate for server-side rendering pages. (Github use such an approach).

Cons: 
- Difficult to apply for dynamic single-page app - icon will have to be created via JavaScript.


## SVG Sprite
Inject a SVG sprite at top of your DOM

```
<body>
	<svg>
	  <defs>
	    <g id="shape-icon-1"><g>
	    <g id="shape-icon-2"><g>
	  </defs>
	</svg>
</body>
```

And you can use individual icon via `<use>`
```
<svg viewBox="0 0 100 100" class="icon shape-codepen">
  <use xlink:href="#shape-icon-1"></use>
</svg>
```

Pros: 
- Reusability

Cons:
- HTML size could bloat if there are many icons. Also often not all icons are used in a page, a lot of icons are wasted.

## External SVG Sprite
SVG sprite as a separate file.

```
// sprite.svg (as separate file)s
<svg xmlns="http://www.w3.org/2000/svg">
  <symbol id="icon-1" viewBox="0 0 1024 1024">
    <path class="path-1" d="..."></path>
  </symbol>
</svg>

// Individual sprite
<svg>
  <use xlink:href="sprite.svg#icon-1"></use>
</svg>
```

Pros:
- Leverage browser cache.

Cons:
- Cross-domain issue, if sprite file is served at different origin.
- External reference is not supported by IE. Some workaround is needed, such as [AJAX](https://css-tricks.com/ajaxing-svg-sprite/).
- `<use>` is treated as Shadow DOM. You can't apply CSS `fill` property 

```
.icon-1 /* ~shadow~ */ .path-1 {
  fill: yellow;
}
```

Ref: 
https://css-tricks.com/svg-use-external-source/

# Others approaches 
- SVG background images — This wouldn’t let us color our icons on the fly.
- SVGs linked via <img> and the src attribute — This wouldn’t let us color our icons on the fly.

Reference from [GitHub](https://github.com/blog/2112-delivering-octicons-with-svg)

# Notes on creating SVG icon
- Remove SVG Fills for Single-Color Icons. 
For single-color icons, all fill definitions should be removed from each svg icon before being compiled into a sprite so that the icons can inherit the body color and be colored using CSS. Just open up each svg in your favorite text editor and remove any "fill=" that you see and save the file. For multi-colored icons, the fill definitions may remain.

# Reference
- [SVG ON THE WEB](https://svgontheweb.com)
- [An Overview of SVG Sprite Creation Techniques](https://24ways.org/2014/an-overview-of-svg-sprite-creation-techniques/)
- [Icon System with SVG Sprites](https://css-tricks.com/svg-sprites-use-better-icon-fonts): Introduction on SVG Sprites
- [Github migrate its icon to use inlined svg](https://github.com/blog/2112-delivering-octicons-with-svg). Good use case for content-base web page, but be difficult to apply on a single page web app.
- [Example of External SVG sprite](http://mcraiganthony.github.io/svg-icons)
- [An Overview of SVG Sprite Creation Techniques](https://24ways.org/2014/an-overview-of-svg-sprite-creation-techniques/)





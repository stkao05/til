# Critical Rendering path

Intermediate steps between receiving the HTML, CSS, and JavaScript bytes and the required processing to turn them into rendered pixels



# Steps

__Parse__
- Bytes → characters → tokens → nodes → object model.
- Process HTML markup and build the DOM tree.
- Process CSS markup and build the CSSOM tree.
- The `DOMContentLoaded` event is fired when the initial HTML document has been completely loaded and parsed, without waiting for stylesheets, images, and subframes to finish loading
- `onload` event marks the point at which all resources that the page requires have been downloaded and processed

__Render tree__
CSSOM and DOM trees are combined into a render tree, containing information about style properties of visible each nodes in the tree

__Layout (reflow)__
Use render tree to calculated their exact position and size within the viewport of the device The output of the layout process is a "box model," which precisely captures the exact position and size of each element within the viewport: all of the relative measurements are converted to absolute pixels on the screen.

__Painting__
Which converts each node in the render tree to actual pixels on the screen, using the information from layout


# Rendering blocking 
CSS is treated as a render blocking resource, which means that the browser won't render any processed content until the CSSOM is constructed



# JavaScript 
- The location of the script in the document is significant.
- When the browser encounters a script tag, DOM construction pauses until the script finishes executing.
- JavaScript can query and modify the DOM and the CSSOM.
- JavaScript execution pauses until the CSSOM is ready.
- async: A signal to the browser that the script does not need to be executed at the exact point where it's referenced allows the browser to continue to construct the DOM and let the script execute when it is ready















# Reference

https://developers.google.com/web/fundamentals/performance/critical-rendering-path/analyzing-crp
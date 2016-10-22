TIP
- Use the delete operator sparingly. Most modern JavaScript engines optimize the performance of instances created by constructors if their “shape” doesn’t change (roughly: no properties are removed or added). Deleting a property prevents that optimization.



## "this: as an Implicit Parameter of Functions and Methods
When you call a function, this is always an (implicit) parameter:


- Normal functions in sloppy mode
Even though normal functions have no use for this, it still exists as a special variable whose value is always the global object (window in browsers; see The Global Object):
```
> function returnThisSloppy() { return this }
> returnThisSloppy() === window
true
```

- Methods
this refers to the object on which the method has been invoked:
```
> var obj = { method: returnThisStrict };
> obj.method() === obj
true
```

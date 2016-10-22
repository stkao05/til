
# Variables Are Function-Scoped

Most mainstream languages are block-scoped: variables “live inside” the innermost surrounding code block. Here is an example from Java:

```
public static void main(String[] args) {
    { // block starts
        int foo = 4;
    } // block ends
    System.out.println(foo); // Error: cannot find symbol
}
```

In the preceding code, the variable foo is accessible only inside the block that directly surrounds it. If we try to access it after the end of the block, we get a compilation error.
In contrast, JavaScript’s variables are function-scoped: only functions introduce new scopes; blocks are ignored when it comes to scoping. For example:

```
function main() {
    { // block starts
        var foo = 4;
    } // block ends
    console.log(foo); // 4
}
```
Put another way, foo is accessible within all of main(), not just inside the block.


# Variable Declarations Are Hoisted

JavaScript hoists all variable declarations, it moves them to the beginning of their direct scopes. This makes it clear what happens if a variable is accessed before it has been declared


# Closure 
A closure is a function plus the connection to the scope in which the function was created. The name stems from the fact that a closure “closes over” the free variables of a function. A variable is free if it is not declared within the function—that is, if it comes “from outside.”


# Environments


## Cross-Platform Considerations
- Browsers and Node.js have global variables for referring to the global object. Unfortunately, they are different:
- Browsers include window, which is standardized as part of the Document Object Model (DOM), not as part of ECMAScript 5. There is one global object per frame or window.

Node.js contains global, which is a Node.js-specific variable. Each module has its own scope in which this points to an object with that scope’s variables. Accordingly, this and global are different inside modules.
On both platforms, this refers to the global object, but only when you are in global scope. That is almost never the case on Node.js. If you want to access the global object in a cross-platform manner, you can use a pattern such as the following:

```
(function (glob) {
        // glob points to global object
}(typeof window !== 'undefined' ? window : global));
```

From now on, I use window to refer to the global object, but in cross-platform code, you should use the preceding pattern and glob instead.


# Promise


Syntax

```
new Promise( /* executor */ function(resolve, reject) { ... } );
```

- The executor function is immediately invoke when Promise object is created.

- Promise could be in one of 3 state: pending, fulfilled, or rejected.

- If Promise has been already fulfilled before handler is attached (`then/catch`).
  the handler will still be executed. So there is no race condition before asynchronus
  codes completion and its handler being attached.

- `.then` and `.catch` __return a new Promise every time__.

```
let p1 = Promise.resolve(1);

// return a simple value inside "then" will in turn return a Promise resolved with that value
let p2 = p1.then((value) => return value * 2)

// you can also return a Promise
let p3 = p1.then((value) => return Promise.reject("error"));

// you can throw error to project a rejected Promise
let p4 = p1.then((value) => throw "error");

// returning nothing will result in a fulfilled Promise with `undefined` as value
let p5 = p1.then((value) => console.log(value)) // print 1
		   .then((value) => console.log(value)); // print undefined
```

Note that if a `.catch` goes smoothly without error, it will then returned a fulfilled Promise with
returned value


```
let p1 = Promise.reject("error")
				.catch((err) => return 5)
				.then((value) => console.log(value)); // will print 5
```



## Branch

Think about promise as a tree structure. You start off with a single root when creating a
the first Promise. Then you can add branch by `.then` or `.catch`.


Chaining (deeper)
```
fetch('foo')
  .then(res => res.a.prop.that.does.not.exist)
  .catch(err => console.error(err.message)) // will log 'Cannot read property "prop" of undefined'
  .catch(err => console.error(err.message)) // will not log. since the first catch didn't throw any errors
```

Branch (more children)
```
var p = fetch('foo').then(res => res.a.prop.that.does.not.exist)
p.catch(err => console.error(err.message)) // will log
p.catch(err => console.error(err.message)) // will log
```


## Resolve with another Promise

```
var p1 = new Promise(function (resolve, reject) {
  setTimeout(() => reject(new Error('fail')), 3000)
})
var p2 = new Promise(function (resolve, reject) {
  setTimeout(() => resolve(p1), 1000)
})
p2.then(result => console.log(result))
p2.catch(error => console.log(error))
```

`p2` resolve with anthter Promise `p`. `p2` will have the same resolve/reject value provided by `p`.
Note that this behaviour only works with `resolve()`. If you `reject(p1)`, p2 will be rejected with p as 
rejection reason.



## Example: using `Promise.race` to implement timeout

```
var p = Promise.race([
  fetch('/resource-that-may-take-a-while'),
  new Promise(function (resolve, reject) {
    setTimeout(() => reject(new Error('request timeout')), 5000)
  })
])
p.then(response => console.log(response))
p.catch(error => console.log(error))
```

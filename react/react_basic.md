

# State Updates May Be Asynchronous

React *may batch multiple setState() calls into a single update for performance. Because `this.props` and `this.state` may be updated asynchronously, you should not rely on their values for calculating the next state.

In simpler term...It means you can’t call setState on one line and assume state has changed on the next.

```
setState({ name: "Michael" });
console.log(this.state.name);  // Nope.
```





Common pitfalls: 

```
// At this line, suppose 'this.state.foo' is 5
// When 'setState()` actually occurs, the values
// of this.state.foo might no longer be 5 (i.e. being updated
// by another set state call.
this.setState({foo: this.state.foo + 1 });

// Correct version
this.setState((prevState, props) => {
    return {foo: prevState.foo + 1}
})
```


```
// Capturing values from the state outside of the setState callback.
let previousFoo = this.state.foo;
this.setState((prevState) => {
    // BAD! Setting `foo` based on a potentially outdated
    // view of its current value: `foo` may have been updated
    // in the meantime by another call to `setState`.
    return { ...prevState, foo: previousFoo + 10 };
});

// better version
this.setState((prevState) => {
    return { ...prevState, foo: prevState.foo + 10 };
});
```

# Flux

Actin -> Dispatch -> Store -> View

__Principle__
- Unidirectional data flow
- Internalized control: Each store manages its own state; store control its state consistency internally (there should be no setter method in stores)


# ReactJS


## Ideology: 

- __One-way__ data flow down the __component hierarchy__
Data only flow from prop/state to DOM. Data does not flow from DOM to <some place> (model) directly. 

- Components are Just State Machines


## State 
State is reserved only for interactivity, that is, data that changes over time

__Minimum set of states__
- Is it passed in from a parent via props? If so, it probably isn't state.
- Does it remain unchanged over time? If so, it probably isn't state.
- Can you compute it based on any other state or props in your component? If so, it isn't state.

__Who should own the state__
The owner component of the other components that depended on the states. 

A common pattern is to create several stateless components that just render data, and have a stateful component above them in the hierarchy that passes its state to its children via props


- Try to keep as many of your components as possible stateless


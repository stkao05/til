# Cavet in use of <details> in React


Unlike <input> where it is a "controlled" element, `<details>` is
an uncontrolled element in React. Specially, when user click on a
the `<summary>` to expand/collapse the `<details>`, the `open` attribute
still managed by the browser.

This pose a challenge in using `<details>` in React, since
- We want to manage `open` state in the component
- But the `open` is also controlled by the browser


When there are two different places (component/browser) that manages the
same state `open`, the component code will react un-reliably


# Workaround


You can try to teardown and re-render the `<details>` element whenever
the `open` state change, via assigning different the `key` props


```
function DetailWorkaround() {
	const [open, setOpen] = useState(false)

    return <details open={open} key={open ? 1 : 0}>
		<summary onClick={() => setOpen(!open)}/>
    </details>
}
```

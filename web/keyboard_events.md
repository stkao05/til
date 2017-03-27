# keydown, keypress and keyup

In JavaScript, pressing a key triggers events which can be captured and handled. Three events are triggered when a key is pressed and released:
- keydown
- keypress
- keyup

The keydown event occurs when the key is pressed, followed immediately by the keypress event. Then the keyup event is generated when the key is released.

In order to understand the difference between keydown and keypress, it is useful to understand the difference between a "character" and a "key". A "key" is a physical button on the computer's keyboard while a "character" is a symbol typed by pressing a button.  In theory, the keydown and keyup events represent keys being pressed or released, while the keypress event represents a character being typed. The implementation of the theory is not same in all browsers.


# Composition Events (for Chinese, Japanese, and other non-latin languages)

The way IME composition works is that it buffers the user’s keystrokes until a character/word selection has been made, finalizing the input. The buffered keystrokes are temporarily displayed, but not actually inserted into the DOM. However, when I change the input field’s value during a composition, the composition gets terminated early and these buffered keystrokes get inserted into the input field.

- fire compositionstart when composition starts.
- fire compositionend when user selects a character/word and finalizes the input.
- fire compositionupdate on every input during composition, including immediately after the start event and immediately before the end event.
- input events should fire after composition events

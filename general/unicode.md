We start with the observation that “Unicode” is actually two separate and distinct things.  And the first of these things has nothing to do with computers.

Suppose you’re an English orientalist in, say, 1750.  You’ve just discovered Sumerian cuneiform characters from the middle east and Sanskit characters from India.  You get a brilliant idea.  You will make a list of all characters in all languages ever used.  Each will be identified by its own unique number.  So you start out making your list with your own good English characters.  You add in the cuneiform characters and the Sanskrit characters and Greek, Japanese, Chinese, and Korean
characters. You add in characters for the funny squiggly/accented/umlauted characters in Spanish, French and German. And so on. And finally you have a very long list of about a zillion characters.

```
1 a
2 b
3 c
...
26 z
27 A
28 B
...
52 Z
53 (space)
54 ? (question mark)
55 , (comma)
... and so on ...
```

And (as I say) you did it all with your feather-quill pen. This has nothing to do with computers. It is simply about creating a numbered list of all known characters.

When you finish, you have a complete (you hope) set of characters. So you call it a “character set”. And because you’re in a funny mood, instead of calling the numeric identifiers “numeric identifiers”, you call them “code points”. And because your list is meant to include every character in the known universe, you call it the Universal Character Set, or UCS.

Congratulations! You’ve just invented the first, non-computer, half of Unicode, the Universal Character Set.

Now you borrow Guido’s time machine and fast-forward 260 years to 2010.  Everybody is using computers.  So you have a brilliant idea.  You will find a way for computers to handle your UCS.

Now computers think in 8-bit bytes.  So you think:  we’ll use one byte for each numeric identifier (code point)!  Great idea!  An 8-bit encoding.

The problem of course is that with 8 bits you can make only 256 different bit combinations.  And your list has way more than 256 characters.  So you think: we’ll use two bytes for each character!  Great idea!  A 16-bit encoding.

But there are still problems.  First, even two bytes are not enough to store a number as big as a zillion.  You figure that you’ll need at least 3 bytes to hold the biggest number on your list.  Second, even if you decided to use four bytes (32 bits) for each character, your list might still keep growing and someday even 32-bits might not be enough.  Third, you’re doing mostly English, and 8 bits is plenty for working with English.  So with a 16-bit encoding, you’re using twice as much
storage as you really need (and, if you use a 32-bit encoding, you’re using four times as much as you need).

So you think:  Let’s just use an 8-bit encoding, but with a twist.  One of the bit combinations won’t identify a character at all, but will be sort of a continuation sign, saying (in essence) this character identifier is continued on the next several bytes.  So for the most part, you’ll use only one byte per character, but if you need a document to contain some exotic charcters, you can do that.

Congratulations!  You’ve just invented UTF-8 — the 8-bit Unicode Transformation Format, a variable length encoding in which every UCS character (code point) can be encoded in 1 to 4 bytes.

Now you still have one last problem.  You’ve defined both a UTF-8 format and a UTF-16 format.  So you go to open a file and start reading.  You read the first two bytes.  How do you know what you’re reading?  Are the first two bytes two characters in UTF-8 encoding? or a single character in UTF-16 encoding?  What you need is a standard marker at the beginning of files to indicate what encoding the file is in.

Bingo.  You’ve just invented the Byte Order Mark, or BOM (aka “encoding signature”).  The BOM is a two-byte marker at the beginning of a file that tells what encoding the file is using.

So now, when you read a file, you first read the BOM, which tells you what encoding was used to create the file.  This allows you to decode the file into code points (however code points are represented internally in your programming language: Java, Python, whatever).  And when you write out a file, you choose the encoding to be used to encode your Unicode charaters in bits.  You write the BOM, and you write out your Unicode strings.  When you write out the Unicode strings, you specify the
encoding to be used when writing the bits and bytes to the file.

And that’s the basics.    In summary,


```
Unicode =
UCS (definition of a universal character set)
+
UTF (techniques for encoding code points in bit-configurations)
```

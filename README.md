# Emacs implementation of Alabaster Theme

I am slowly crafting my own version of Alabaster theme originally written by
[@tonsky](https://github.com/tonsky/vscode-theme-alabaster).

I am using light themes for a while now and got very used to them, the idea behind Alabaster is very
interesting and aligned with my standards and what I think a non-distracting environment should look
like.


**Warning: Work in Progress.**


@tonsky perfect describes the motivation for the theme:


# Motivation


Most color themes highlight everything they can, ending up looking like a fireworks show.

Instead, Alabaster uses minimal highlighting; it defines just four classes:

1. Strings
2. All statically known constants (numbers, symbols, keywords, boolean values)
3. Comments
4. Global definitions

Additionally:

- Alabaster does not highlight standard language keywords (if, else, function, etc). They are
  usually least important and most obvious part of any program.

- Alabaster highlights comments. Most themes try to dim comments by using low-contrast greys. I
  think if code was complex enough that it deserved an explanation then it’s that explanation we
  should see and read first. It would be a crime to hide it.

- Alabaster doesn’t use font variations. It’s hard to scan code when it jumps between normal, bold
  and italics all the time. Also, not all fonts provide bold/italics variants.

- Having minimal amount of rules means you can consciously use them to look for the exact piece of
  information you need. Most other “fireworks” themes provide only one meaningful contribution: if
  it’s colored it’s probably syntactically correct. Instead, in Alabaster you can actually remember
  all the rules, and e.g. if you need to look for a string you know that you’re looking for a green
  token. And all the strings really pop out because there are not many other things highlighted.

- Alabaster only highlights things that parser could identify reliably. I believe that if
  highlighting works only partially then it does more harm than good. When highlighting works
  reliably, your brain learns to rely on it. When it’s not reliable, your brain spends precious
  brain cycles to re-check everything it sees on the screen.

<p align="center">
  <img src="https://raw.githubusercontent.com/wandersoncferreira/alabaster-theme/master/screenshot.png">
</p>

# Customization

Unfortunately, some changes I could not enforce through the theme itself. Therefore, I believe is
better to explicitly set these options in your own configuration file.

### Clojure

Change the following two parameters in CIDER to avoid unnecessary face colors.

```clj
(with-eval-after-load 'cider
  (setq cider-font-lock-dynamically nil
        cider-font-lock-reader-conditionals nil))
```

### Color numbers

Install the package [highlight-numbers](https://github.com/Fanael/highlight-numbers). By default the
correct face color is already set.


### Line numbers

I never used line numbers before, but I am giving it a try. This is my current setup.

```elisp
(require 'linum)
(setq linum-format "%4d  ")
(add-hook 'prog-mode-hook 'linum-mode)
```

### Fringe

I removed my left fringe completely.

```elisp
(fringe-mode '(0 . 16))
```

### Git gutter

I am using [git-gutter-fringe.el](https://github.com/emacsorphanage/git-gutter-fringe) because I
want to change the symbols of modifications in my buffer to the right side.

```elisp
(require 'git-gutter-fringe)
(setq-default git-gutter-fr:side 'right-fringe)
(setq-default right-fringe-width 16)
(global-git-gutter-mode +1)
```

### Global highlight line

```elisp
(global-hl-line-mode +1)
```

# Reading Resources

1. [Syntax highlighting is a waste of an information channel](https://buttondown.email/hillelwayne/archive/syntax-highlighting-is-a-waste-of-an-information/)

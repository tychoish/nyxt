(in-package :cl-user)

(defpackage :keymap
  (:use :common-lisp)
  (:import-from #:fset)
  (:import-from #:str)
  (:local-nicknames (#:alex #:alexandria))
  (:local-nicknames (#:types #:trivial-types))
  (:export
   modifier=
   +control+
   +meta+
   +shift+
   +super+
   +hyper+

   *modifier-list*
   *default-translator*

   make-key
   copy-key
   key-code
   key-value
   key-modifiers
   key-status

   make-keymap
   define-key
   lookup-key
   parents
   default
   translator

   translate-remove-shift-toggle-case
   translate-remove-shift
   translate-remove-but-first-control
   translate-remove-shift-but-first-control
   translate-remove-shift-but-first-control-toggle-case
   translate-shifted-control-combinations

   *print-shortcut*
   keys->keyspecs

   keymap->map
   keymap-with-parents->map
   symbol-keys

   compose)
  (:documentation "
The workflow goes as follows:
- Make a keymap with `make-keymap'.
- Define a binding on it with `define-key'.
- Lookup this binding with `lookup-key'.

Some globals can be tweaked to customize the library to your needs:

- `*modifier-list*': List of known keyboard modifiers like `+control+'.
- `*default-translator*': The default function to infer the right binding when
  the exact binding hits nothing.
- `*print-shortcuts*': Print modifiers using their short form instead of the
  full name, e.g. \"C\" instead of \"control\"."))
# Makefile style guide

Style guide for `Makefiles`.

---

## Contents

1. Naming conventions
    * Targets
    * Variables
2. Misc
3. Makefile template: `makefile_template.mk`
4. Credits

---

## 1. Naming conventions

### Targets

Target names should use lower case letters. Words are separated with an underscore '_'. E.g.:

```bash
test_debug:
    $(build_dir)/debug/bin
```

### Variables

Variables which are not special to make or inherited from the environment should be in lowercase. Words should be separated with underscore symbol _. E.g.:

```bash
src_dir = $(current_dir)/src
build_dir = $(current_dir)/build
```

---

## 2. Misc

### `SHELL` variable

Every Makefile should contain this line:

```bash
SHELL = /bin/sh
```

to avoid trouble on systems where the SHELL variable might be inherited from the environment.

### Displaying text

As per the GNU Make manual, you can use info / warning / error to display text:

```bash
$(error   text…)
$(warning text…)
$(info    text…)
```

### `:=` 'simply expanded' operator

As a rule of thumb, when assigning variables, look to use the `:=` 'simply expanded' operator. See: [makefiletutorial.com](https://makefiletutorial.com#flavors-and-modification)

### Command Echoing / Silencing: `@`

add an '@' before a command to stop it from being printed

### `$@` automatic variable

* `$@` is an automatic variable that contains the target name

---

## 3. Makefile template - `makefile_template.mk`

See `templates/makefile_template.mk` as a good example template / starting point for a Makefile.

---

## 4. Credits

* [Makefile style guide](https://style-guides.readthedocs.io/en/latest/makefile.html)
* [General Conventions for Makefiles](https://www.gnu.org/prep/standards/html_node/Makefile-Basics.html#Makefile-Basics)
* [stackoverflow.com](https://stackoverflow.com/questions/32130664/is-there-a-naming-convention-for-makefile-targets-and-variables)

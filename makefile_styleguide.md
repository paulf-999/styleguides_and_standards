# Makefile styleguide

Styleguide for `Makefiles`.

---

## Contents

1. General conventions
    * `SHELL` variable
    * Standard targets
    * Displaying text
2. Naming conventions
    * Targets
    * Variables
3. Misc
4. Makefile template - `makefile_template.mk`
5. Credits


General conventions
Naming conventions
---

## 1. General conventions

#### `SHELL` variable

Every Makefile should contain this line:

```
SHELL = /bin/sh
```

to avoid trouble on systems where the SHELL variable might be inherited from the environment.

#### Standard targets

Rather than make use of the exhaustive list of standard targets outlined within the
[GNU Makefile documentation](https://www.gnu.org/prep/standards/html_node/Standard-Targets.html#Standard-Targets), smaller projects will typically look to instead make use of more meaningful names based on the context. As a result, as a starting, look to make use of the following standard targets:

```
$make compile   (to compile)
$make lib       (to create the libraries)
$make link      (to link the objects into the executable)
$make run       (to run the program)
$make all       (to make all of them at once)
```

and, to make this happen as expected, I have to insert dependencies like:

```
all: run

run: link
    # Instructions for run

link: lib
    # Instructions for link

lib: compile
    # Instructions for make the lib

compile:
    #Instructions for compilation
```

---

## 2. Naming conventions

#### Targets

Target names should use lower case letters. Words are separated with a hyphen -. E.g.:

```
test-debug:
    $(build_dir)/debug/bin
```

#### Variables

Variables which are not special to make or inherited from the environment should be in lowercase. Words should be separated with underscore symbol _. E.g.:

```
src_dir = $(CURDIR)/src
build_dir = $(CURDIR)/build
```

---

## 3. Misc

#### Displaying text

As per the GNU Make manual, you can use info / warning / error to display text:

```
$(error   text…)
$(warning text…)
$(info    text…)
```

#### Other (tidy later)
* `$@` is an automatic variable that contains the target name
* As a rule of thumb, when assigning variables, look to use the 'simply expanded' operator (see: https://makefiletutorial.com#flavors-and-modification)
* Command Echoing/Silencing - add an '@' before a command to stop it from being printed

---

## 4. Makefile template - `makefile_template.mk`

See `makefile_template.mk` as a good example template / starting point for a Makefile.

---

## 5. Credits

* [Makefile style guide](https://style-guides.readthedocs.io/en/latest/makefile.html)
* [General Conventions for Makefiles](https://www.gnu.org/prep/standards/html_node/Makefile-Basics.html#Makefile-Basics)
* [stackoverflow.com](https://stackoverflow.com/questions/32130664/is-there-a-naming-convention-for-makefile-targets-and-variables)
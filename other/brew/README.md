To install brew packages on a new machine (from a text file) do:

```
for i in $(cat brew_leaves); do; brew install "$i";
```

done. You can use newlines where there are semicolons above. [assuming bash]

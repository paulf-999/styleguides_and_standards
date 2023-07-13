# Oh My Zsh: Install Instructions

To install Oh My Zsh and the Powerlevel10k theme, you can follow these steps:

## Step 1: Install `Oh My Zsh`

1. Open your terminal.
2. Make sure you have `zsh` installed on your system. If not, you can install it using your package manager. For example, on Ubuntu, you can run `sudo apt install zsh`.
3. Once `zsh` is installed, you can install Oh My Zsh by running the following command in your terminal:

    ```bash
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```

    This command will download and execute the installation script for Oh My Zsh.

4. After the installation script completes, it will prompt you to set Zsh as your default shell. Enter `'Y'` to confirm the change.

5. Close and reopen your terminal for the changes to take effect.

---

## Step 2: Install `Powerlevel10k` theme

1. Open your terminal.

2. Clone the Powerlevel10k repository from GitHub by running the following command:

    ```bash
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
    ```

3. Set the Powerlevel10k theme in your `.zshrc` configuration file. Open the file in a text editor using the command:

    ```bash
    nano ~/.zshrc
    ```

4. Locate the line that sets the `ZSH_THEME` variable and change it to:

    ```bash
    ZSH_THEME="powerlevel10k/powerlevel10k"
    ```

5. Save and close the file.
6. Restart your terminal, and you should see the Powerlevel10k configuration wizard.
7. Follow the prompts to customize your Powerlevel10k theme according to your preferences. The wizard will guide you through various options such as fonts, icons, prompt style, and colors.
8. After customizing the theme, the changes will be applied, and you will have the Powerlevel10k theme installed.

---

## Step 3: Install Plugins

One of the great things about Oh My Zsh is that we can customize Zsh using plugins. Let us install some of the most useful ones. These are as follows:

* `zsh-syntax-highlighting`
* `zsh-completions`
* `zsh-autosuggestion`

### Step 3.1. Clone the Git Repos

Git clone the above three plugins
To use plugins, first clone the repositories to your local.

### `zsh-syntax-highlighting`

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/
```

### `zsh-syntax-highlighting` and `zsh-completions`

```bash
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```

### zsh-autosuggestion

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/
```

### Step 3.2. Setup the plugins in ~/.zshrc

Open ~/.zshrc file

```bash
vim ~/.zshrc
```

Add the names of the cloned repositories to the plugin list.

```bash
plugins=(
 git
 zsh-syntax-highlighting
 zsh-autosuggestions
 zsh-completions
)
```

For zsh-completions add one more line just below plugins, as follows:

```bash
plugins=(
 git
 zsh-syntax-highlighting
 zsh-autosuggestions
 zsh-completions
)
# command for zsh-completions
autoload -U compinit && compinit
```

After saving ~/.zshrc with the plugins and command for zsh-completions, reload the terminal.

```bash
source ~/.zshrc
```

The plugins should be working now. And That's it! You have successfully installed:

* Oh My Zsh
* Configured the Powerlevel10k theme
* And added additional ohmyzsh plugins

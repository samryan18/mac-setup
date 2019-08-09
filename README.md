# New Mac Setup

* zsh/prezto
* pyenv/pyenv-virtualenv
* rc files

Other stuff:
* install iTerm2
* change colors in preferences > profiles > colors


## Adding Sublime Shortcuts to Jupyter Notebooks
1. Assuming Jupyter/Sublime Text 3 both already installed
2. Find your Jupyter configuration directory by running:
```bash
$ jupyter --config-dir
```
3. Create a folder inside the configuration directory called `custom/` 
4. Add a file called `custom.js` inside `custom/`
5. Add the following:
```javascript
require(["codemirror/keymap/sublime", "notebook/js/cell", "base/js/namespace"],
    function(sublime_keymap, cell, IPython) {
        cell.Cell.options_default.cm_config.keyMap = 'sublime';
        var cells = IPython.notebook.get_cells();
        for(var cl=0; cl< cells.length ; cl++){
            cells[cl].code_mirror.setOption('keyMap', 'sublime');
        }

    } 
);
```
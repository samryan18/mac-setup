# New Mac Setup

* zsh/prezto
* pyenv/pyenv-virtualenv
* rc files

Other stuff:
* install iTerm2
* change colors in preferences > profiles > colors


## Setting Up Sublime Shortcuts in Jupyter
1. Assuming Jupyter/Sublime Text 3 both already installed
2. Find your Jupyter configuration folder by running jupyter --config-dir
3. Create a folder inside called `custom` and put a file called `custom.js`
4. Add the following:
```
require(["codemirror/keymap/sublime", "notebook/js/cell", "base/js/namespace"],
    function(sublime_keymap, cell, IPython) {
        // setTimeout(function(){ // uncomment line to fake race-condition
        cell.Cell.options_default.cm_config.keyMap = 'sublime';
        var cells = IPython.notebook.get_cells();
        for(var cl=0; cl< cells.length ; cl++){
            cells[cl].code_mirror.setOption('keyMap', 'sublime');
        }
 
        // }, 1000)// uncomment  line to fake race condition 
    } 
);
```
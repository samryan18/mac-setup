# New Mac Setup

## Instructions
1. Run `mac_setup.sh` in a terminal (probably run commands one at a time)
    * This will set up zsh/prezto and pyenv/pyenv-virtualenv

2. Add the rc files to `~/`

## iTerm
* install iTerm2
* change colors in preferences > profiles > colors

## Jupyter

### Adding Sublime Shortcuts to Jupyter Notebooks
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

### Display dataframes side by side
```python
from IPython.display import display_html
def display_side_by_side(*args):
    html_str=''.join([df.to_html() for df in args])
    display_html(html_str.replace('table', 'table style="display:inline"'), raw=True)
```

### Disable Scrollable Cells
```javascript
%%javascript
IPython.OutputArea.prototype._should_scroll = function(lines) { return false; }
```

### Togle Code with Button (only show output and markdown)
```python
from IPython.display import HTML
HTML('''
<script>
code_show=true; 
function code_toggle() { 
    if (code_show){ $('div.input').hide(); } 
    else { $('div.input').show(); } code_show = !code_show 
} 
$( document ).ready(code_toggle);
</script>
<form action="javascript:code_toggle()"><input type="submit" value="Click here to toggle on/off the raw code."></form>''')
```

## Reference a git commit via its SHA

When saving data or results, reference the source code that generated it by storing the git commit sha along with it:


```python
import git

repo = git.Repo(search_parent_directories=True)
sha = repo.head.object.hexsha # this is unique to your commit and can be accessed through git or github

print(f'https://github.com/owner/repo-name/tree/{sha}')

```

Outputs:
```
>>> 'https://github.com/owner/repo-name/tree/f9cf1083909722c0d7f35229b34e8c7cf0c66559'
```


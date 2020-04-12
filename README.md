# vim-checka-wah-wah

Simple checkboxes in text files.

## Usage

On supported filetypes (markdown):

- `<Space>` toggles a bullet list item between not being a checkbox
  (`- something`), unmarked checkbox (`- [] something`), completed checkbox
  (`- [x] something`), and back to unmarked checkbox
- `<C-Space>` toggles between non-checkbox and checkbox bullet list items

Both mappings also work on visual selections of multiple lines to convert list
items in bulk.

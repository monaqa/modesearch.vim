# 🔎 modesearch.vim

Search with less backslash.

## Installation

Follow the documentation of your favorite plugin manager.

## Usage

Example:

```vim
nmap g/ <Plug>(modesearch-slash)
nmap g? <Plug>(modesearch-question)
cmap <C-x> <Plug>(modesearch-toggle-mode)
```

You can also start searching with a fixed mode with the following mappings:

```vim
" Always starts in 'rawstr' mode
nmap g/ <Plug>(modesearch-slash-rawstr)
" Always starts in 'regexp' mode
nmap g? <Plug>(modesearch-question-regexp)
```

## Demo

![demo-mode-search](https://user-images.githubusercontent.com/48883418/135260785-ad90de8f-7a6e-46a0-beb0-10f04eefc8c3.gif)

" Syntax for Flock golden-file templates: <base>.jinja files that use custom
" Jinja delimiters (@{ ... }@ for expressions, @% ... %@ for statements) so the
" templates don't collide with HCL's ${ } / Terraform interpolation.
"
" Neither treesitter nor jinja-lsp can highlight these (both assume the stock
" {{ }} / {% %} delimiters), so we load the BASE language's classic, regex-based
" syntax — which is tolerant of the non-standard directives — and overlay the
" custom delimiters on top. The base extension is stashed in b:jinja_base_ext by
" the filetype detection in plugins/treesitter.lua.

if exists('b:current_syntax')
  finish
endif

let s:base = get(b:, 'jinja_base_ext', '')
" Map file extensions to their syntax-file names where they differ.
let s:aliases = {'tf': 'terraform', 'yml': 'yaml'}
let s:base = get(s:aliases, s:base, s:base)

if s:base !=# '' && !empty(globpath(&runtimepath, 'syntax/' . s:base . '.vim'))
  execute 'runtime! syntax/' . s:base . '.vim'
  " Base syntax files set b:current_syntax; clear it so our overlay loads and so
  " the final `let b:current_syntax` below is authoritative.
  unlet! b:current_syntax
endif

" makejinja custom-delimiter overlay (see golden-files-aviation mkRepository.nix):
"   @{ ... }@  expression    @% ... %@  statement    @# ... #@  comment
syntax region jinjaTmplComment matchgroup=jinjaTmplDelim start=/@#/ end=/#@/ containedin=ALL keepend
syntax region jinjaTmplVar     matchgroup=jinjaTmplDelim start=/@{/ end=/}@/ containedin=ALL keepend
syntax region jinjaTmplBlock   matchgroup=jinjaTmplDelim start=/@%/ end=/%@/ containedin=ALL keepend contains=jinjaTmplKeyword
syntax keyword jinjaTmplKeyword contained
      \ if elif else endif for endfor in is not and or
      \ set block endblock macro endmacro call endcall filter endfilter
      \ include import from as with endwith without context

highlight default link jinjaTmplDelim    PreProc
highlight default link jinjaTmplKeyword  Statement
highlight default link jinjaTmplVar      Identifier
highlight default link jinjaTmplComment  Comment

let b:current_syntax = 'jinjatmpl'

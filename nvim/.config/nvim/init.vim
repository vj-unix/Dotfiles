set notermguicolors

highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE

" TERMINAL COLOR SCHEME MAPPINGS
highlight Comment        ctermfg=6   cterm=NONE  " Teal
highlight Identifier     ctermfg=9   cterm=NONE  " Variables
highlight Statement      ctermfg=2   cterm=BOLD  " Keywords like 'if/for'
highlight Constant       ctermfg=3   cterm=NONE  " Strings and Numbers 
highlight PreProc        ctermfg=9   cterm=NONE  " Macros / Includes
highlight Type           ctermfg=4   cterm=NONE  " Data types

" Syntax Overrides
highlight String         ctermfg=11  cterm=NONE  " Text strings
highlight Number         ctermfg=11  cterm=NONE  " Numerical values
highlight Boolean        ctermfg=9   cterm=NONE  " true or false keywords
highlight Function       ctermfg=2   cterm=NONE  " Function names specifically

" Punctuations, Brackets, and Pipelines
highlight Delimiter      ctermfg=2   cterm=NONE  " Targets brackets [ ] and punctuation
highlight Operator       ctermfg=2   cterm=NONE  " Targets pipelines | and operators

" if / then / else, etc
highlight Conditional    ctermfg=2   cterm=NONE  " if, then, else, elif, fi
highlight Repeat         ctermfg=2   cterm=BOLD  " while, until, for, do, done
highlight Keyword        ctermfg=2   cterm=BOLD  " other reserved words
highlight Label          ctermfg=2   cterm=BOLD  " case labels
highlight Exception      ctermfg=2   cterm=BOLD  " try/catch style keywords in other languages
highlight shRepeat       ctermfg=2   cterm=BOLD  " while / until in bash
highlight shCase         ctermfg=2   cterm=BOLD  " case
highlight shCaseEsac     ctermfg=2   cterm=BOLD  " esac
highlight shDo           ctermfg=2   cterm=BOLD  " do / done
highlight shIf           ctermfg=2   cterm=NONE  " if / fi

" --- Bash Command Arguments & Flags (Purple) ---
highlight shStatement    ctermfg=4   cterm=NONE  " External commands inside blocks
highlight shCmdSubRegion ctermfg=5   cterm=NONE  " Arguments inside checks
highlight shOption       ctermfg=5   cterm=NONE  " Command flags like -q or --verbose

" --- File & Directory Exploration (Purple) ---
highlight Directory      ctermfg=5   cterm=BOLD  " General directory display rule
highlight netrwDir       ctermfg=5   cterm=BOLD  " File explorer directories
highlight netrwPlain     ctermfg=13  cterm=NONE  " File explorer normal files

set mouse=


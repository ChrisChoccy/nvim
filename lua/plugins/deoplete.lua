-- deoplete
vim.g['deoplete#enable_at_startup'] = true

vim.fn['deoplete#custom#option'](
	'ignore_sources',
	{['_'] = {'around', 'file', 'dictionary', 'tag', 'buffer'}}
)

-- Custom Labels
vim.fn['deoplete#custom#source']('jedi', 'mark', '')
-- Disabling font due to graphical errors.
vim.g.have_nerd_font = false

if vim.fn.executable("pwsh") == 1 then
	vim.opt.shell = "pwsh" --"pwsh" for 7.x if installed
else
	vim.opt.shell = "powershell" --"powershell" for 5.x
end

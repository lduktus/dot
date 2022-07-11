# duktus 2021

#nvim_dir = $(HOME)/.config/nvim
fish_dir = $(HOME)/.config/fish
bin_dir = $(HOME)/.local/bin

.PHONY : prepare

prepare : 
#	mkdir -pv $(HOME)/.config/nvim
	mkdir -pv $(HOME)/.config/fish
	mkdir -pv $(HOME)/.local/bin

# verbosity levels 1-4
test : prepare
#	stow --simulate --stow --dotfiles --verbose 4 --no-folding --target $(nvim_dir) nvim
	stow --simulate --stow --dotfiles --verbose 4 --no-folding --target $(fish_dir) fish
	stow --simulate --stow --dotfiles --verbose 4 --no-folding --target $(HOME) tmux
#	stow --simulate --stow --dotfiles --verbose 4 --no-folding --target $(bin_dir) bin

link : prepare
#	stow --stow --dotfiles --verbose --no-folding --target $(nvim_dir) nvim
	stow --stow --dotfiles --verbose --no-folding --target $(fish_dir) fish
	stow --stow --dotfiles --verbose --no-folding --target $(HOME) tmux
#	stow --stow --dotfiles --verbose --no-folding --target $(bin_dir) bin

relink : prepare
#	stow --restow --dotfiles --verbose 4 --no-folding --target $(nvim_dir) nvim
	stow --restow --dotfiles --verbose 4 --no-folding --target $(fish_dir) fish
	stow --restow --dotfiles --verbose 4 --no-folding --target $(HOME) tmux
#	stow --restow --dotfiles --verbose 4 --no-folding --target $(bin_dir) bin

unlink : prepare
#	stow --delete --dotfiles --verbose --no-folding --target $(nvim_dir) nvim
	stow --delete --dotfiles --verbose --no-folding --target $(fish_dir) fish
	stow --delete --dotfiles --verbose --no-folding --target $(HOME) tmux
#	stow --delete --dotfiles --verbose --no-folding --target $(bin_dir) bin

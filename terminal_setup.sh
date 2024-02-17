#!/bin/bash
# Arch-based terminal setup script
echo "Installing zsh.."
yay -S zsh --needed --noconfirm
echo "Installing oh-my-zsh.."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "Installing starship.."
yay -S starship --needed --noconfirm
echo "Installing highlighting and autosuggestions plugins.."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Adding plugins in .zshrc file.."
sed -i 's/plugins=(/plugins=(starship zsh-syntax-highlighting zsh-autosuggestions /g' ~/.zshrc
zsh
chsh -s /bin/zsh
echo "Finished!"

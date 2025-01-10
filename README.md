## Setup a brand new Unix with your favourite tools and colors

## 📝 Remember to backup important stuff
- [ ] Credentials: `.ssh`, `.aws`, `.pgpass`, `.my.cnf`
- [ ] Configs: `.gitconfig`
- [ ] ZSH: Check `.zshrc` for changes and maybe grab `.zsh_history` too
- [ ] Projects

## 🧑‍🔧 Install new Unix (let's be honest, you will install Ubuntu)

## 🍝 Copypasta this
```
sudo apt install -y git \
   && git clone https://github.com/Koojav/fresh-unix-setup.git \
   && cd fresh-unix-setup \
   && chmod +x run_me.sh \
   && ./run_me.sh
```
## 🔄 Restart 

## 🎉 There you go!

Following shit has been configured for you:
- [x] `GRUB2 Theme` : the dual boot she told you not to worry about
- [x] `ZSH` `Antigen` : working search under CTR-R and various code completions in console
- [x] `Starship` `Gogh` : oooh shiny 
- [x] `htop` `curl` `git` `pyenv` : the only things that were really missing from a bare OS
- [x] `tldr` : man pages for human beings
- [x] `gh` : create Pull Requests like 90s hackers
- [x] `Visual Studio Code` : food ain't free
- [x] `Docker` : stage IV cancer
- [x] `aws-cli`, `kubectl`, `terraform`, `helm`: aaand all the nodes are gone
- [x] `Slack` : context switcher 3000
- [x] `Chrome` : renders StackOverflow a bit nicer than curl

## 📌 Optional stuff
- [ ] Visit https://starship.rs/config/ : Starship config manual
- [ ] Visit https://gogh-co.github.io/Gogh/ : Gogh color themes list 

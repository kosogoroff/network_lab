# Стенд выполненного домашнего задания по занятию "Архитектура сетей"

Для создания стенда лабораторной сети используйте команды:

```
git clone https://github.com/kosogoroff/network_lab.git
cd network_lab
vagrant up
```


Для создания репозитория использованы команды

```
[admin_insta11@mv334 network_lab]$ rm -rf .git
[admin_insta11@mv334 network_lab]$ 
[admin_insta11@mv334 network_lab]$ 
[admin_insta11@mv334 network_lab]$ git init
подсказка: Using 'master' as the name for the initial branch. This default branch name
подсказка: is subject to change. To configure the initial branch name to use in all
подсказка: of your new repositories, which will suppress this warning, call:
подсказка: 
подсказка: 	git config --global init.defaultBranch <name>
подсказка: 
подсказка: Names commonly chosen instead of 'master' are 'main', 'trunk' and
подсказка: 'development'. The just-created branch can be renamed via this command:
подсказка: 
подсказка: 	git branch -m <name>
Инициализирован пустой репозиторий Git в /home/admin_insta11/network_lab/.git/
[admin_insta11@mv334 network_lab]$ 
[admin_insta11@mv334 network_lab]$ git add .
[admin_insta11@mv334 network_lab]$ git commit -m "first commit"
[master (корневой коммит) 623e4f3] first commit
 16 files changed, 523 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 README.md
 create mode 100644 Vagrantfile
 create mode 100644 ansible.cfg
 create mode 100644 ansible/playbook.yml
 create mode 100644 ansible/templates/00-installer-config.yaml
 create mode 100644 ansible/templates/50-vagrant_centralRouter.yaml
 create mode 100644 ansible/templates/50-vagrant_centralServer.yaml
 create mode 100644 ansible/templates/50-vagrant_inetRouter.yaml
 create mode 100644 ansible/templates/50-vagrant_office1Router.yaml
 create mode 100644 ansible/templates/50-vagrant_office1Server.yaml
 create mode 100644 ansible/templates/50-vagrant_office2Router.yaml
 create mode 100644 ansible/templates/50-vagrant_office2Server.yaml
 create mode 100644 ansible/templates/iptables_rules.ipv4
 create mode 100755 generate_inventory.sh
 create mode 100644 inventory.ini
[admin_insta11@mv334 network_lab]$ 
[admin_insta11@mv334 network_lab]$ git remote add origin https://github.com/kosogoroff/network_lab.git
[admin_insta11@mv334 network_lab]$ 
[admin_insta11@mv334 network_lab]$ git push -u origin main
Перечисление объектов: 20, готово.
Подсчет объектов: 100% (20/20), готово.
При сжатии изменений используется до 24 потоков
Сжатие объектов: 100% (18/18), готово.
Запись объектов: 100% (20/20), 5.54 КиБ | 945.00 КиБ/с, готово.
Total 20 (delta 5), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (5/5), done.
To https://github.com/kosogoroff/network_lab.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
[admin_insta11@mv334 network_lab]$ 
```

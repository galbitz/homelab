.DEFAULT_GOAL := list

.PHONY: no_targets__ list
no_targets__:
list:
	@sh -c "$(MAKE) -p no_targets__ | awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);for(i in A)print A[i]}' | grep -v '__\$$' | sort"

generate-graph:
	dot -Tpng ./doc/comm.dot -o ./doc/comm.png

encrypt-secrets:
	devbox run gpg --symmetric --cipher-algo AES256 -o encrypted_secrets.sh unencrypted_secrets.sh 

decrypt-secrets:
	devbox run gpg --quiet --batch --yes --decrypt --passphrase="$(SECRET_PASSPHRASE)" --output unencrypted_secrets.sh encrypted_secrets.sh
	
lint:
	devbox run lint

install-requirements:
	devbox run install-requirements

tf-init:
	devbox run ./tfrun.sh init -input=false

tf-apply:
	devbox run ./tfrun.sh apply -input=false -compact-warnings -auto-approve

generate-ansible-inventory:
	devbox run ./tfrun.sh apply -target=local_file.hosts -compact-warnings -auto-approve

ansible-run:
	devbox run "cd playbooks && ./run.sh $(ARGS)"

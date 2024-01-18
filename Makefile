.DEFAULT_GOAL := list

.PHONY: no_targets__ list
no_targets__:
list:
	@sh -c "$(MAKE) -p no_targets__ | awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);for(i in A)print A[i]}' | grep -v '__\$$' | sort"

generate-graph:
	dot -Tpng ./doc/comm.dot -o ./doc/comm.png

encrypt-secrets:
	gpg --symmetric --cipher-algo AES256 -o encrypted_secrets.sh unencrypted_secrets.sh 

decrypt-secrets:
	gpg --quiet --batch --yes --decrypt --passphrase="$(SECRET_PASSPHRASE)" --output unencrypted_secrets.sh encrypted_secrets.sh
	
test:
	echo "test"
	echo "test2"

lint:
	devbox run lint

install-requirements:
	devbox run install-requirements

tf-init:
	./tfrun.sh init -input=false

tf-apply:
	./tfrun.sh apply -input=false -compact-warnings -auto-approve

bytecode:
	@find hetu -mindepth 2 -name "*.ht" -not -path "hetu/bytecode/*" | while read -r file; do feat=$$(basename $$(dirname $$file)); hetu compile "$$file" "hetu/bytecode/$$feat.out"; done
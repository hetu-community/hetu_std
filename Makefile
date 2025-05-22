bytecode:
	hetu compile hetu/http/http.ht hetu/bytecode/http.out &&\
	hetu compile hetu/timer/timer.ht hetu/bytecode/timer.out

chat:
	@find hetu -mindepth 2 -name "*.ht" -not -path "hetu/bytecode/*" | while read -r file; do feat=$$(basename $$(dirname $$file)); hetu compile "$$file" "hetu/bytecode/$$feat.out"; done
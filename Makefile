PROJECT=forms-examples

# =========================================================================
#  Dependencies
# =========================================================================

DEPS      = forms
dep_forms = git https://github.com/efcasado/forms

# =========================================================================
#  Configuration
# =========================================================================

ERLC_OPTS     += +debug_info +'{parse_transform,censor}'
COMPILE_FIRST  = censor
ERLC_EXCL      = censor

include erlang.mk

# =========================================================================
#  Targets
# =========================================================================

.PHONY: src/censor.erl
src/censor.erl:
	@erlc -o ebin/ -pa ebin/ -I include/ src/censor.erl


define erl-run
	erl -noshell -pa ebin -eval $(1) -s init stop
endef

censor:
	$(call erl-run, 'speaker:talk()')

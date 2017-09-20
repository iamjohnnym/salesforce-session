.PHONY: clean
clean:
	find . -type f -name '*.pyc' -delete

.PHONY: test
test:
	nosetests --with-cov --cov salesforce_session/

.PHONY: bandit
bandit:
	bandit -r salesforce_session/

.PHONY: coveralls
coveralls:
	coveralls

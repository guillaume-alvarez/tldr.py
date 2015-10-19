test:
	@echo "If their is an existing user config, backup it.";
	@test ! -f "$(HOME)/.tldrrc" && echo "None, skip..." || (mv "$(HOME)/.tldrrc" "$(HOME)/.tldrrc_bak"; echo "backuped.");

	@echo "Run the real tests.";
	@py.test --pep8 -vs tests/ tldr/;

	@echo "Restore the backup file if it exists after finishing the tests."
	@test ! -f "$(HOME)/.tldrrc_bak" && echo "None, skip..." || (mv "$(HOME)/.tldrrc_bak" "$(HOME)/.tldrrc"; echo "restored.");

restore:
	@echo "Restore the backup file if it exists after failing the tests."
	@test ! -f "$(HOME)/.tldrrc_bak" && echo "None, skip..." || (mv "$(HOME)/.tldrrc_bak" "$(HOME)/.tldrrc"; echo "restored.");

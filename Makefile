# Makefile
export PYTHONDONTWRITEBYTECODE=1

VENV = .venv

.PHONY: all install clean run-jupyter defaultrun

all: install

# -----------------------------------------------------------------------------
# 🐍 Install virtual environment and dependencies
# -----------------------------------------------------------------------------
install:
	@if [ ! -d "$(VENV)" ]; then \
		echo "🐍 Creating virtual environment..."; \
		python3 -m venv $(VENV); \
		echo "🐍 Installing certifi..."; \
		$(VENV)/bin/pip install certifi --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org; \
		echo "🐍 Capturing certifi certificate bundle path and upgrading pip/installing requirements..."; \
		CERT="$$($(VENV)/bin/python -m certifi)"; \
		echo "Certifi installed at: $$CERT"; \
		echo "🐍 Upgrading pip..."; \
		$(VENV)/bin/pip install --upgrade pip --cert=$$CERT --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org; \
		echo "🐍 Installing remaining requirements..."; \
		$(VENV)/bin/pip install -r requirements.txt --cert=$$CERT --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org; \
		echo "✅ Installation complete."; \
	else \
		echo "✅ Virtual environment already exists. Skipping installation."; \
	fi

clean:
	@echo "🧹 Cleaning up..."
	@find . -type d -name "__pycache__" -exec rm -rf {} +
	@rm -rf $(VENV)

run-jupyter: install
	@echo "🚀 Starting Jupyter Notebook server..."
	@$(VENV)/bin/jupyter notebook

# Standard entrypoint
defaultrun: run-jupyter
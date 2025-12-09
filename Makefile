# Variables
DATA_DIR = data
RESULTS_DIR = results
SCRIPTS_DIR = scripts

# Book files (adjust these names based on your actual data files)
BOOKS = $(wildcard $(DATA_DIR)/*.txt)

# Generate corresponding result files
WORD_COUNTS = $(patsubst $(DATA_DIR)/%.txt,$(RESULTS_DIR)/%.dat,$(BOOKS))

# Final report
REPORT = $(RESULTS_DIR)/report.txt

# Default target
.PHONY: all
all: $(REPORT)

# Rule to generate the final report from all word count files
$(REPORT): $(WORD_COUNTS)
	@echo "Generating final report..."
	python $(SCRIPTS_DIR)/generate_report.py $(WORD_COUNTS) > $@
	@echo "Report generated: $@"

# Pattern rule to count words in each book
$(RESULTS_DIR)/%.dat: $(DATA_DIR)/%.txt $(SCRIPTS_DIR)/count_words.py
	@echo "Processing $<..."
	@mkdir -p $(RESULTS_DIR)
	python $(SCRIPTS_DIR)/count_words.py $< $@

# Clean target to remove all generated files
.PHONY: clean
clean:
	@echo "Cleaning up generated files..."
	rm -rf $(RESULTS_DIR)
	@echo "Cleanup complete!"

# Help target
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all     - Run the complete analysis pipeline (default)"
	@echo "  clean   - Remove all generated files"
	@echo "  help    - Display this help message"

# Prevent deletion of intermediate files
.SECONDARY: $(WORD_COUNTS)

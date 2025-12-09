## Building a Data Analysis pipeline tutorial
adapted from [Software Carpentry](http://software-carpentry.org/)

This example data analysis project analyzes the word count for all words in 4
novels. It reports the top 10 most occurring words in each book in a [report](doc/count_report.qmd).

### Current usage:

#### Set-up (first time only)

1. Clone this repo, and using the command line, navigate to the root of this project.

2. Run the following commands to create the conda environment:

```
conda-lock install --name da-pipeline-make conda-lock.yml
```

#### Run the analysis 

Activate the conda environment:

```
conda activate da-pipeline-make
```

Run the analysis:

```
make all
```
#### Clean up files

Once finished, to clean up the files:

```
make clean
```

### Depenedencies
- GNU Make
- Quarto
- Python & Python libraries:
    - `click`
    - `matplotlib`
    - `pandas`

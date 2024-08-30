
# Assignment Base R

### Problem Statement

This assignment will focus on basic functions of R with an emphasis on
working with base R data structures and functional programming patterns.

### Learning Objectives and Skill List

- Understand how vector, matrix, and data frame data structures operate in R
- Logical tests and operator functions applied to data structures
- Use functions and `apply()` to iterate over rows of a matrix
- Use functional programming concepts to generalize data summarization operations
- Bonus: learn how to appropriately handle missing values

### Instructions

Please use the github classroom link to create your own repo for this assignment.

The project is laid out as such:  

```
main.R
test_main.R
report.Rmd
reference_report.html
```

Each step of the assignment is explained in the R markdown file, `report.Rmd`.
There you will find a list of tasks to explicity implement functions in your
empty `main.R` script. The `main.R` script contains stubs of each function
you'll need to implement, explaining what each function should do, the parameters
it expects to receive, and what type of output is expected to be returned. A
reference report, `reference_report.html` is also provided. Assuming you successfully
implement all the functions in `main.R`, your generated report should look
identical to the information displayed in `reference_report.html`. In this way,
you can use `reference_report.html` as a guide to determine if you are correctly
implementing your functions.

Here is the suggested workflow for developing and checking your code in this
assignment:

1. `main.R` contains function definitions, including signature descriptions, for
  a number of functions, but the bodies of those functions are currently blank
2. `report.Rmd` has code chunks that call functions defined in `main.R` - you do
  not need to write anything in the Rmd file (but you may)
3. Your task is to read the function descriptions and the text in the Rmarkdown
  document and fill in the function bodies to produce the desired behavior in
  main.R
4. You can test your work by executing individual code chunks in report.Rmd and
  comparing your output to the example compiled report in the repo
5. In the workflow, you will go back and forth between developing code in main.R
  and running code chunks in report.Rmd
6. In addition to inspecting your report results, also run
  `testthat::test_file('test_main.R')` to ensure they work correctly.
7. When you have developed function bodies for all the functions and executed
  all the code chunks in the report successfully, you should be able to knit the
  entire report

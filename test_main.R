#!/usr/bin/Rscript

library(testthat)

# if you change the name of your script, this line must be changed as well
source("main.R")

describe("less_than_zero()", {
  it("returns TRUE for negative numbers", {
    expect_equal(less_than_zero(-1), TRUE)
  })
  it("returns FALSE for zero", {
    expect_equal(less_than_zero(0), FALSE)
  })
  it("returns FALSE for positive numbers", {
    expect_equal(less_than_zero(1), FALSE)
  })
  it("returns a logical vector when a numeric vector is used as input", {
    expect_equal(less_than_zero(c(-1, 0, 1, 10)), 
                 c(TRUE, FALSE, FALSE, FALSE))
  })
  it("returns a logical matrix when a matrix is used as input", {
    expect_equal(less_than_zero(matrix(-2:1, nrow=2, byrow=T)),
                 matrix(c(TRUE, TRUE, FALSE, FALSE), nrow=2, byrow=T))
  })
})
         
describe("is_between()", {
  it("returns TRUE when input is within open interval (a, b)", {
    expect_equal(is_between(1, 0, 5), TRUE)
  })
  it("returns FALSE when input is not within open interval (a, b)", {
    expect_equal(is_between(-1, 0, 5), FALSE)
  })
  it("returns FALSE for endpoints as open intervals do not include endpoints", {
    expect_equal(is_between(0, 0, 5), FALSE)
  })     
  it("returns a logical vector when a numeric vector is input", {
    expect_equal(is_between(c(-1, 0, 1, 2, 5), 0, 5),
                 c(FALSE, FALSE, TRUE, TRUE, FALSE))
  })
  it("returns a logical matrix when a matrix is input", {
    expect_equal(is_between(matrix(1:4, nrow=2, byrow=T),0,3),
                 matrix(c(TRUE, TRUE, FALSE, FALSE), nrow=2, byrow=T))
  })
})

describe("rm_na()", {
  it("removes no NAs from a single input", {
    expect_equal(rm_na(3), 3)
  })
  it("returns the same vector if no NAs present", {
    expect_equal(rm_na(c(1,2,3)), c(1,2,3))
  })
  it("properly removes NAs when present in a vector", {
    expect_equal(rm_na(c(1,2,NA)), c(1, 2))
  })
  it("returns a vector of length 0 if all values are NA", {
    expect_length(rm_na(c(NA, NA, NA)), 0)
  })
})

describe("row_medians()", {
  m <- matrix(1:9, nrow=3, byrow=T)
  
  it("returns correct row median on simulated data", {
    expect_equal(row_medians(m), c(2, 5, 8))
  })
})

describe("summarize_rows()", {
  m <- matrix(1:9, nrow=3, byrow=T)
  
  it("correctly summarizes the min", {
    expect_equal(!!summarize_rows(m, min), c(1,4,7))
  })
  it("correctly summarizes the max", {
    expect_equal(!!summarize_rows(m, max), c(3,6,9))
  })
  it("correctly summarizes the mean", {
    expect_equal(!!summarize_rows(m, mean), c(2,5,8))
  })
})

describe("summarize_matrix()", {
  m <- matrix(1:9, nrow=3, byrow=T)
  m_summary <- summarize_matrix(m, na.rm=FALSE)
  
  it("returns a dataframe", {
    expect_true(is.data.frame(m_summary))
  })
  it("returns the correct colnames in order", {
    expect_true(identical(colnames(m_summary), 
                          c("mean", "stdev", "median", "min", "max", "num_lt_0", "num_btw_1_and_5", "num_na")))
  })
  it("correctly calculates the mean", {
    expect_equal(m_summary$mean, c(2,5,8))
  })
  it("correctly calculates the stdev", {
    expect_equal(m_summary$stdev, c(1, 1, 1))
  })
  it("correctly calculates the median", {
    expect_equal(m_summary$median, c(2, 5, 8))
  })
  it("correctly calculates the min", {
    expect_equal(m_summary$min, c(1,4,7))
  })
  it("correctly calculates the max", {
    expect_equal(m_summary$max, c(3,6,9))
  })
  it("correctly calculates numbers less than zero", {
    expect_equal(m_summary$num_lt_0, c(0, 0, 0))
  })
  it("correctly calculates numbers between 1 and 5", {
    expect_equal(m_summary$num_btw_1_and_5, c(2, 1, 0))
  })
  it("correctly determines number of NA", {
    expect_equal(m_summary$num_na, c(0, 0, 0))
  })
})


#  these tests are bonus - if you want to try the challenge, uncomment!
# 
# describe("Bonus tests! Make your code work when there are NAs!", {
#   m <- matrix(1:9, nrow=3, byrow=T)
#   m[2,1] <- NA
#   
#   it("returns correct mean values with na.rm=FALSE set", {
#     expect_equal(summarize_rows(m, mean, na.rm=FALSE), 
#                           c(2,NA,8))
#   })
#   it("returns correct mean values with na.rm=TRUE set", {
#     expect_equal(summarize_rows(m, mean, na.rm=TRUE), 
#                           c(2,5.5,8))
#   })
#   it("returns correct min values with na.rm=FALSE", {
#     expect_equal(summarize_rows(m, min, na.rm=FALSE), 
#                           c(1,NA,7))
#   })
#   it('returns correct min values with na.rm=TRUE', {
#     expect_equal(summarize_rows(m, min, na.rm=TRUE),
#                           c(1,5,7))
#   })
# })
# 
# describe("summarize_matrix() works with na.rm=FALSE", {
#   m_summary <- summarize_matrix(m, na.rm=FALSE)
#   
#   it("returns mean correctly", {
#     expect_equal(m_summary$mean, c(2, NA, 8))
#   })
#   it("returns stdev correctly", {
#     expect_equal(m_summary$stdev, c(1, NA, 1))
#   })
#   it("returns median correctly", {
#     expect_equal(m_summary$median, c(2, NA, 8))
#   })
#   it("returns min correctly", {
#     expect_equal(m_summary$min, c(1, NA, 7))
#   })
#   it("returns max correctly", {
#     expect_equal(m_summary$max, c(3, NA, 9))
#   })
#   it("returns numbers less than zero correctly", {
#     expect_equal(m_summary$num_lt_0, c(0, NA, 0))
#   })
#   it("returns numbers netween 1 and 5 correctly", {
#     expect_equal(m_summary$num_btw_1_and_5, c(2, NA, 0))
#   })
#   it("returns number of NAs correctly", {
#     expect_equal(m_summary$num_na, c(0, 1, 0))
#   })
# })
# 
# describe("summarize_matrix() works with na.rm=TRUE", {
#   m_summary <- summarize_matrix(m, na.rm=TRUE)
#   
#   it("returns mean correctly", {
#     expect_equal(m_summary$mean, c(2, 5.5, 8))
#   })
#   it("returns stdev correctly", {
#     expect_equal(m_summary$stdev, c(c(1, sd(c(5,6)), 1)))
#   })
#   it("returns median correctly", {
#     expect_equal(m_summary$median, c(2, 5.5, 8))
#   })
#   it("returns min correctly", {
#     expect_equal(m_summary$min, c(1, 5, 7))
#   })
#   it("returns max correctly", {
#     expect_equal(m_summary$max, c(3, 6, 9))
#   })
#   it("returns numbers less than zero correctly", {
#     expect_equal(m_summary$num_lt_0, c(0, 0, 0))
#   })
#   it("returns numbers netween 1 and 5 correctly", {
#     expect_equal(m_summary$num_btw_1_and_5, c(2, 0, 0))
#   })
#   it("returns number of NAs correctly", {
#     expect_equal(m_summary$num_na, c(0, 0, 0))
#   })
# })
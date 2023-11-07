
<!-- README.md is generated from README.Rmd. Please edit that file -->

# robson10classifier

<!-- badges: start -->
<!-- badges: end -->

The goal of the {robson10classifier} package is to provide a suite of
functions simplyfying the classification and analysis of childbirth data
according to the [Robson 10 Group Classification
System](https://www.who.int/reproductivehealth/publications/maternal_perinatal_health/robson-classification/en/),
which was adopted by the World Health Organisation in 2015.

## Overview of the Robson 10 Group Classification System

The image below is a summary of the TGCS, taken from the World Health
Organisation’s TGCS Implementation Manual, available from [this
page](https://www.who.int/reproductivehealth/publications/maternal_perinatal_health/robson-classification/en/).

<img src="man/figures/README_Robson-Classification-Summary.png" width="100%" alt="An overview of the Robson Ten Group Classification System (TGCS), taken from the World Health Organisation's TGCS Implementation Guide."/>

## Installation

You can install from github using the {remotes} package:

``` r
# install.packages("remotes")
remotes::install_github("https://github.com/ThomUK/robson10classifier")
```

## How to use

The package’s main is `tgcs_classify()`. It takes a data frame
containing a minimum of 6 columns, one for each of the obstetric
variables that are used to classify the Robson Groups. Each row in the
data frame represents a birth. The function returns the same data frame,
with an additional column for `Robson_Classification`. This can be a
number from 1 to 10, or in the case that data required for
classification was missing, “Unclassifiable”.

``` r
library(robson10classifier)

# prepare the data (ID, plus 6 columns of obstetric variables)
data <- data.frame(
  ID = c(1:5),
  Parity = c("Nullipara", "Multipara", "Nullipara", "Multipara", NA),
  Previous_CS = c("None", "One or more", "None", "One or more", NA),
  Onset_Of_Labour = c("Spontaneous", "Pre-labour CS", "Induced", "Spontaneous", NA),
  Number_Of_Fetuses = c("Multiple", "Single", "Single", "Single", "Multiple"),
  Gestational_Age = c("Term", "Preterm", "Term", "Term", NA),
  Fetal_Lie_And_Presentation = c("Cephalic", "Breech", "Cephalic", NA, NA)
)

# use the package to make the classifications
classification <- tgcs_classify(data)

# visualise the resulting classifications in a table
kableExtra::kbl(classification)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
ID
</th>
<th style="text-align:left;">
Robson_Classification
</th>
<th style="text-align:left;">
Parity
</th>
<th style="text-align:left;">
Previous_CS
</th>
<th style="text-align:left;">
Onset_Of_Labour
</th>
<th style="text-align:left;">
Number_Of_Fetuses
</th>
<th style="text-align:left;">
Gestational_Age
</th>
<th style="text-align:left;">
Fetal_Lie_And_Presentation
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
Nullipara
</td>
<td style="text-align:left;">
None
</td>
<td style="text-align:left;">
Spontaneous
</td>
<td style="text-align:left;">
Multiple
</td>
<td style="text-align:left;">
Term
</td>
<td style="text-align:left;">
Cephalic
</td>
</tr>
<tr>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
Multipara
</td>
<td style="text-align:left;">
One or more
</td>
<td style="text-align:left;">
Pre-labour CS
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
Preterm
</td>
<td style="text-align:left;">
Breech
</td>
</tr>
<tr>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
Nullipara
</td>
<td style="text-align:left;">
None
</td>
<td style="text-align:left;">
Induced
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
Term
</td>
<td style="text-align:left;">
Cephalic
</td>
</tr>
<tr>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
Unclassifiable
</td>
<td style="text-align:left;">
Multipara
</td>
<td style="text-align:left;">
One or more
</td>
<td style="text-align:left;">
Spontaneous
</td>
<td style="text-align:left;">
Single
</td>
<td style="text-align:left;">
Term
</td>
<td style="text-align:left;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
8
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
Multiple
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
NA
</td>
</tr>
</tbody>
</table>

## Package Planning

The package is in the early stages of development. The section below
summarises the functionality that is implemented, and the functionality
planned for the future.

#### 1. Implemented (or partially implemented) functions:

-   `tgcs_classify()` takes values for the 6 obstetric variables, and
    returns the Robson classification, or “Unclassifiable” if some data
    required to do the classification is missing.  
    In future:
    -   It will also return details about why an element is
        unclassifiable.  
    -   It will support sub-grouping of certain Robson Groups (eg. 2a,
        2b, 4a, 4b, 5.1, 5.2).
-   `tgcs_make_babies()` produces a simulated set of births, with
    randomly assigned obstetric variables. Useful for testing the
    package, or for a quick demo of the other functionality. eg.
    `data <- tgcs_make_babies(1000)` will make a dataframe of 1000
    births. Missing data is also included, which leads to
    “Unclassifiable” Robson Groups, as can be occasionally expected with
    real world data.  
    In future:
    -   An argument will be implemented to control the probability that
        the values under each variable occur. In this way it will be
        possible to tune the output in line with your facility’s numbers
        (eg. no missing data).
    -   Arguments will be implemented to add simulated birth dates, with
        a normally-distributed number of births on each date. It will be
        possible to tune the result by setting mean and standard
        deviations for the typical number of births per day in your
        facility.

#### 2. Planned for future implementation:

-   `tgcs_report_unclassifiable()` will take a population of birth
    records with obstetric variables, and will summarise the reasons for
    any unclassifiable records, according to which obstetric variables
    are missing.

-   `tgcs_report_time_series()` will take a population of birth records
    with dates (eg. births in a given healthcare facility or region),
    and will create an RMarkdown report of time-series trends for each
    Robson group, and unclassifiable records.

-   `tgcs_report_table()` will take a population of birth records with
    dates, and will create a Robson Classification Report Table to the
    same standard as table 5 of the World Health Organisation Robson
    Classification Implementation Manual p.34

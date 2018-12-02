
<!-- README.md is generated from README.Rmd. Please edit that file -->

# issue

Create a simple human readable table for readme that displays status of
GitHub repositoy issues

## Installation

You can install issue from github with:

``` r
# install.packages("remotes")
remotes::install_github("yonicd/issue")
```

``` r
library(issue)
```

``` r
issue::get_issues(repo = 'r-lib/pkgdown',
           last = 10)%>%
  issue::create_table()%>%
  knitr::kable()
```

| issue | title                                                                                                        | state  | labels  | opened\_by                                          | comments | comments\_users                                                                                                                                                                                                                 | assigned\_to | created             | updated             | closed              |
| ----: | :----------------------------------------------------------------------------------------------------------- | :----- | :------ | :-------------------------------------------------- | -------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :----------- | :------------------ | :------------------ | :------------------ |
|   919 | [Add headers to home template](https://github.com/r-lib/pkgdown/issues/919)                                  | open   |         | [jayhesselberth](https://github.com/jayhesselberth) |        1 | <span title="aaa">[jayhesselberth](https://github.com/jayhesselberth)</span>                                                                                                                                                                           |              | 2018-11-24 21:51:52 | 2018-12-01 13:35:41 | NA                  |
|   922 | [Pass params from deploy\_site\_github to build\_site](https://github.com/r-lib/pkgdown/issues/922)          | open   |         | [noamross](https://github.com/noamross)             |        0 |                                                                                                                                                                                                                                 |              | 2018-11-29 11:56:16 | 2018-11-29 11:56:16 | NA                  |
|   915 | [Deploy instructions create branch that pkgdown won’t write to](https://github.com/r-lib/pkgdown/issues/915) | open   |         | [hadley](https://github.com/hadley)                 |        2 | [hadley](https://github.com/hadley), [jayhesselberth](https://github.com/jayhesselberth)                                                                                                                                        |              | 2018-11-22 16:15:06 | 2018-11-28 11:57:15 | NA                  |
|   920 | [vignette chunk settings](https://github.com/r-lib/pkgdown/issues/920)                                       | open   | reprex  | [luca-scr](https://github.com/luca-scr)             |        4 | [jayhesselberth](https://github.com/jayhesselberth), [luca-scr](https://github.com/luca-scr), [jayhesselberth](https://github.com/jayhesselberth), [luca-scr](https://github.com/luca-scr)                                      |              | 2018-11-26 08:05:44 | 2018-11-26 22:01:13 | NA                  |
|   916 | [colorize the `README`](https://github.com/r-lib/pkgdown/issues/916)                                         | open   | feature | [IndrajeetPatil](https://github.com/IndrajeetPatil) |        0 |                                                                                                                                                                                                                                 |              | 2018-11-22 17:36:29 | 2018-11-26 18:33:07 | NA                  |
|   918 | [htmlwidgets Index.Rmd](https://github.com/r-lib/pkgdown/issues/918)                                         | open   | wip     | [JohnCoene](https://github.com/JohnCoene)           |        1 | [jayhesselberth](https://github.com/jayhesselberth)                                                                                                                                                                             |              | 2018-11-24 20:34:22 | 2018-11-26 14:08:24 | NA                  |
|   921 | [R output format from examples in help/reference pages](https://github.com/r-lib/pkgdown/issues/921)         | closed | feature | [luca-scr](https://github.com/luca-scr)             |        5 | [jayhesselberth](https://github.com/jayhesselberth), [luca-scr](https://github.com/luca-scr), [jayhesselberth](https://github.com/jayhesselberth), [hadley](https://github.com/hadley), [luca-scr](https://github.com/luca-scr) |              | 2018-11-26 08:12:40 | 2018-11-28 11:42:50 | 2018-11-28 11:42:50 |
|   917 | [replace ‘longer’](https://github.com/r-lib/pkgdown/issues/917)                                              | closed |         | [wibeasley](https://github.com/wibeasley)           |        0 |                                                                                                                                                                                                                                 |              | 2018-11-23 04:41:27 | 2018-11-23 14:12:40 | 2018-11-23 14:12:39 |
|   914 | [Hide sidebar on mobile home pages.](https://github.com/r-lib/pkgdown/issues/914)                            | closed |         | [jayhesselberth](https://github.com/jayhesselberth) |        0 |                                                                                                                                                                                                                                 |              | 2018-11-22 15:43:52 | 2018-11-22 18:37:09 | 2018-11-22 15:55:54 |
|   913 | [Hide sidebar on mobile homepage](https://github.com/r-lib/pkgdown/issues/913)                               | closed | bug     | [jayhesselberth](https://github.com/jayhesselberth) |        2 | [hadley](https://github.com/hadley), [jayhesselberth](https://github.com/jayhesselberth)                                                                                                                                        |              | 2018-11-21 20:14:57 | 2018-11-22 15:55:54 | 2018-11-22 15:55:54 |

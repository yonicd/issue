
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
           last = 20)%>%
  issue::create_table()%>%
  knitr::kable()
```

| issue | state  | created             | updated             | closed              | title                                                                                                         | labels                    | comments | opened\_by     | assigned\_to |
| ----: | :----- | :------------------ | :------------------ | :------------------ | :------------------------------------------------------------------------------------------------------------ | :------------------------ | :------- | :------------- | :----------- |
|     4 | open   | 2018-11-24 21:51:52 | 2018-12-01 13:35:41 | NA                  | [Add headers to home template](https://github.com/r-lib/pkgdown/issues/919)                                   |                           | 1        | jayhesselberth |              |
|     1 | open   | 2018-11-29 11:56:16 | 2018-11-29 11:56:16 | NA                  | [Pass params from deploy\_site\_github to build\_site](https://github.com/r-lib/pkgdown/issues/922)           |                           | 0        | noamross       |              |
|     8 | open   | 2018-11-22 16:15:06 | 2018-11-28 11:57:15 | NA                  | [Deploy instructions create branch that pkgdown won’t write to](https://github.com/r-lib/pkgdown/issues/915)  |                           | 2        | hadley         |              |
|     3 | open   | 2018-11-26 08:05:44 | 2018-11-26 22:01:13 | NA                  | [vignette chunk settings](https://github.com/r-lib/pkgdown/issues/920)                                        | reprex                    | 4        | luca-scr       |              |
|     7 | open   | 2018-11-22 17:36:29 | 2018-11-26 18:33:07 | NA                  | [colorize the `README`](https://github.com/r-lib/pkgdown/issues/916)                                          | feature                   | 0        | IndrajeetPatil |              |
|     5 | open   | 2018-11-24 20:34:22 | 2018-11-26 14:08:24 | NA                  | [htmlwidgets Index.Rmd](https://github.com/r-lib/pkgdown/issues/918)                                          | wip                       | 1        | JohnCoene      |              |
|    12 | open   | 2018-11-21 18:02:36 | 2018-11-22 00:36:26 | NA                  | [When using a custom navbar, the home page button is lost](https://github.com/r-lib/pkgdown/issues/911)       |                           | 1        | DavisVaughan   |              |
|    17 | open   | 2018-11-20 15:57:19 | 2018-11-20 23:14:38 | NA                  | [Release pkgdown 1.2](https://github.com/r-lib/pkgdown/issues/906)                                            |                           | 6        | hadley         |              |
|     2 | closed | 2018-11-26 08:12:40 | 2018-11-28 11:42:50 | 2018-11-28 11:42:50 | [R output format from examples in help/reference pages](https://github.com/r-lib/pkgdown/issues/921)          | feature                   | 5        | luca-scr       |              |
|     6 | closed | 2018-11-23 04:41:27 | 2018-11-23 14:12:40 | 2018-11-23 14:12:39 | [replace ‘longer’](https://github.com/r-lib/pkgdown/issues/917)                                               |                           | 0        | wibeasley      |              |
|     9 | closed | 2018-11-22 15:43:52 | 2018-11-22 18:37:09 | 2018-11-22 15:55:54 | [Hide sidebar on mobile home pages.](https://github.com/r-lib/pkgdown/issues/914)                             |                           | 0        | jayhesselberth |              |
|    10 | closed | 2018-11-21 20:14:57 | 2018-11-22 15:55:54 | 2018-11-22 15:55:54 | [Hide sidebar on mobile homepage](https://github.com/r-lib/pkgdown/issues/913)                                | bug                       | 2        | jayhesselberth |              |
|    11 | closed | 2018-11-21 18:49:12 | 2018-11-21 19:44:32 | 2018-11-21 19:20:14 | [Fix html table class tweaking](https://github.com/r-lib/pkgdown/issues/912)                                  |                           | 0        | jayhesselberth |              |
|    13 | closed | 2018-11-21 16:31:12 | 2018-11-21 19:20:14 | 2018-11-21 19:20:14 | [Failure on markdown table](https://github.com/r-lib/pkgdown/issues/910)                                      |                           | 0        | Bisaloo        |              |
|    19 | closed | 2018-11-20 00:07:17 | 2018-11-20 22:03:02 | 2018-11-20 12:59:29 | [Require whitespace or parens before author](https://github.com/r-lib/pkgdown/issues/904)                     |                           | 1        | hadley         |              |
|    14 | closed | 2018-11-20 16:52:15 | 2018-11-20 16:54:02 | 2018-11-20 16:53:58 | [Copy edits, mostly wordos](https://github.com/r-lib/pkgdown/issues/909)                                      |                           | 1        | jennybc        |              |
|    15 | closed | 2018-11-20 16:17:26 | 2018-11-20 16:26:26 | 2018-11-20 16:26:25 | [Commits that don’t update the website fail with auto deploy](https://github.com/r-lib/pkgdown/issues/908)    | bug,deploy :airplane:     | 1        | DavisVaughan   |              |
|    16 | closed | 2018-11-20 15:59:09 | 2018-11-20 16:15:51 | 2018-11-20 16:15:51 | [server IP address could not be found](https://github.com/r-lib/pkgdown/issues/907)                           |                           | 1        | IndrajeetPatil |              |
|    18 | closed | 2018-11-20 15:12:19 | 2018-11-20 15:17:04 | 2018-11-20 15:17:04 | [Only deploy a clean site?](https://github.com/r-lib/pkgdown/issues/905)                                      |                           | 2        | jayhesselberth |              |
|    20 | closed | 2018-11-19 16:46:40 | 2018-11-20 15:17:04 | 2018-11-20 15:17:04 | [Make sure that url field always (or never) requires a protocol](https://github.com/r-lib/pkgdown/issues/903) | feature,front end :tulip: | 2        | Bisaloo        |              |

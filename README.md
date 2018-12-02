
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

| issue | title                                                                                                         | state  | labels                    | comments | opened\_by                                          | assigned\_to | created             | updated             | closed              |
| ----: | :------------------------------------------------------------------------------------------------------------ | :----- | :------------------------ | -------: | :-------------------------------------------------- | :----------- | :------------------ | :------------------ | :------------------ |
|   919 | [Add headers to home template](https://github.com/r-lib/pkgdown/issues/919)                                   | open   |                           |        1 | [jayhesselberth](https://github.com/jayhesselberth) |              | 2018-11-24 21:51:52 | 2018-12-01 13:35:41 | NA                  |
|   922 | [Pass params from deploy\_site\_github to build\_site](https://github.com/r-lib/pkgdown/issues/922)           | open   |                           |        0 | [noamross](https://github.com/noamross)             |              | 2018-11-29 11:56:16 | 2018-11-29 11:56:16 | NA                  |
|   915 | [Deploy instructions create branch that pkgdown won’t write to](https://github.com/r-lib/pkgdown/issues/915)  | open   |                           |        2 | [hadley](https://github.com/hadley)                 |              | 2018-11-22 16:15:06 | 2018-11-28 11:57:15 | NA                  |
|   920 | [vignette chunk settings](https://github.com/r-lib/pkgdown/issues/920)                                        | open   | reprex                    |        4 | [luca-scr](https://github.com/luca-scr)             |              | 2018-11-26 08:05:44 | 2018-11-26 22:01:13 | NA                  |
|   916 | [colorize the `README`](https://github.com/r-lib/pkgdown/issues/916)                                          | open   | feature                   |        0 | [IndrajeetPatil](https://github.com/IndrajeetPatil) |              | 2018-11-22 17:36:29 | 2018-11-26 18:33:07 | NA                  |
|   918 | [htmlwidgets Index.Rmd](https://github.com/r-lib/pkgdown/issues/918)                                          | open   | wip                       |        1 | [JohnCoene](https://github.com/JohnCoene)           |              | 2018-11-24 20:34:22 | 2018-11-26 14:08:24 | NA                  |
|   911 | [When using a custom navbar, the home page button is lost](https://github.com/r-lib/pkgdown/issues/911)       | open   |                           |        1 | [DavisVaughan](https://github.com/DavisVaughan)     |              | 2018-11-21 18:02:36 | 2018-11-22 00:36:26 | NA                  |
|   906 | [Release pkgdown 1.2](https://github.com/r-lib/pkgdown/issues/906)                                            | open   |                           |        6 | [hadley](https://github.com/hadley)                 |              | 2018-11-20 15:57:19 | 2018-11-20 23:14:38 | NA                  |
|   921 | [R output format from examples in help/reference pages](https://github.com/r-lib/pkgdown/issues/921)          | closed | feature                   |        5 | [luca-scr](https://github.com/luca-scr)             |              | 2018-11-26 08:12:40 | 2018-11-28 11:42:50 | 2018-11-28 11:42:50 |
|   917 | [replace ‘longer’](https://github.com/r-lib/pkgdown/issues/917)                                               | closed |                           |        0 | [wibeasley](https://github.com/wibeasley)           |              | 2018-11-23 04:41:27 | 2018-11-23 14:12:40 | 2018-11-23 14:12:39 |
|   914 | [Hide sidebar on mobile home pages.](https://github.com/r-lib/pkgdown/issues/914)                             | closed |                           |        0 | [jayhesselberth](https://github.com/jayhesselberth) |              | 2018-11-22 15:43:52 | 2018-11-22 18:37:09 | 2018-11-22 15:55:54 |
|   913 | [Hide sidebar on mobile homepage](https://github.com/r-lib/pkgdown/issues/913)                                | closed | bug                       |        2 | [jayhesselberth](https://github.com/jayhesselberth) |              | 2018-11-21 20:14:57 | 2018-11-22 15:55:54 | 2018-11-22 15:55:54 |
|   912 | [Fix html table class tweaking](https://github.com/r-lib/pkgdown/issues/912)                                  | closed |                           |        0 | [jayhesselberth](https://github.com/jayhesselberth) |              | 2018-11-21 18:49:12 | 2018-11-21 19:44:32 | 2018-11-21 19:20:14 |
|   910 | [Failure on markdown table](https://github.com/r-lib/pkgdown/issues/910)                                      | closed |                           |        0 | [Bisaloo](https://github.com/Bisaloo)               |              | 2018-11-21 16:31:12 | 2018-11-21 19:20:14 | 2018-11-21 19:20:14 |
|   904 | [Require whitespace or parens before author](https://github.com/r-lib/pkgdown/issues/904)                     | closed |                           |        1 | [hadley](https://github.com/hadley)                 |              | 2018-11-20 00:07:17 | 2018-11-20 22:03:02 | 2018-11-20 12:59:29 |
|   909 | [Copy edits, mostly wordos](https://github.com/r-lib/pkgdown/issues/909)                                      | closed |                           |        1 | [jennybc](https://github.com/jennybc)               |              | 2018-11-20 16:52:15 | 2018-11-20 16:54:02 | 2018-11-20 16:53:58 |
|   908 | [Commits that don’t update the website fail with auto deploy](https://github.com/r-lib/pkgdown/issues/908)    | closed | bug,deploy :airplane:     |        1 | [DavisVaughan](https://github.com/DavisVaughan)     |              | 2018-11-20 16:17:26 | 2018-11-20 16:26:26 | 2018-11-20 16:26:25 |
|   907 | [server IP address could not be found](https://github.com/r-lib/pkgdown/issues/907)                           | closed |                           |        1 | [IndrajeetPatil](https://github.com/IndrajeetPatil) |              | 2018-11-20 15:59:09 | 2018-11-20 16:15:51 | 2018-11-20 16:15:51 |
|   905 | [Only deploy a clean site?](https://github.com/r-lib/pkgdown/issues/905)                                      | closed |                           |        2 | [jayhesselberth](https://github.com/jayhesselberth) |              | 2018-11-20 15:12:19 | 2018-11-20 15:17:04 | 2018-11-20 15:17:04 |
|   903 | [Make sure that url field always (or never) requires a protocol](https://github.com/r-lib/pkgdown/issues/903) | closed | feature,front end :tulip: |        2 | [Bisaloo](https://github.com/Bisaloo)               |              | 2018-11-19 16:46:40 | 2018-11-20 15:17:04 | 2018-11-20 15:17:04 |

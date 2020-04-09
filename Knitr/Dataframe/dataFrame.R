---
title: "DataFrame"
author: "Rob Hayward"
date: "7 November 2015"
output: 
  html_document: 
    theme: cosmo
---

From [Lionel Hertzog](http://datascienceplus.com/working-with-data-frame-in-r/)

Transpose
```{r}
data(cars)
mtcars <- t(mtcars)
```
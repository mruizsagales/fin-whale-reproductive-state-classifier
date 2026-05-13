# fin-whale-reproductive-state-classifier
Random forest classifier for predicting fin whale reproductive state from reproductive morphometric measurements.
## Files
- `predict_fin_whale_reproductive_state.R`
- `fin_whale_reproductive_rf_model.rds`
## Required predictors
The model uses the following morphometric variables:
- `max_ovary_weigth` (grams)
- `area_of_largest_ovarian_body` (mm²)
- `area_of_largest_ovarian_follicle` (mm²)
- `mean_uterine_horns_width` (mm)
- `mammary_gland_width` (mm)
## Required R packages
```r
install.packages(c("recipes", "tibble", "ranger", "caret"))
```
## Example

```r
source("predict_fin_whale_reproductive_state.R")
```

### Immature female

```r
predict_reproductive_class(
  max_ovary_weigth = 264.5,
  area_of_largest_ovarian_body = 0,
  area_of_largest_ovarian_follicle = 58,
  mean_uterine_horns_width = 82.8,
  mammary_gland_width = 23.4
)
```

### Pregnant female

```r
predict_reproductive_class(
  max_ovary_weigth = 1558.0,
  area_of_largest_ovarian_body = 12408.0,
  area_of_largest_ovarian_follicle = 406.6,
  mean_uterine_horns_width = 350.7,
  mammary_gland_width = 50.2
)
```

### Lactating female

```r
predict_reproductive_class(
  max_ovary_weigth = 842.0,
  area_of_largest_ovarian_body = 2280.4,
  area_of_largest_ovarian_follicle = 166.7,
  mean_uterine_horns_width = 173.2,
  mammary_gland_width = 199.0
)
```

### Anoestrous female

```r
predict_reproductive_class(
  max_ovary_weigth = 838.2,
  area_of_largest_ovarian_body = 1981.4,
  area_of_largest_ovarian_follicle = 189.4,
  mean_uterine_horns_width = 148.6,
  mammary_gland_width = 57.0
)
```

## Notes

- The repository contains the trained random forest classifier and prediction function only.


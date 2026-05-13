
# Fin whale reproductive state classifier

# required packages:
install.packages(c("recipes", "tibble", "ranger", "caret")); library(c("recipes", "tibble", "ranger", "caret"))

predict_reproductive_class <- function(
    model_path = "fin_whale_reproductive_rf_model.rds",
    max_ovary_weigth = NA,
    area_of_largest_ovarian_body = NA,
    area_of_largest_ovarian_follicle = NA,
    mean_uterine_horns_width = NA,
    mammary_gland_width = NA,
    ovulatory_body = NA
) {
  
  model_obj <- readRDS(model_path) # load trained model
  new_data <- data.frame( # new observations
    max_ovary_weigth = as.numeric(max_ovary_weigth),
    area_of_largest_ovarian_body =as.numeric(area_of_largest_ovarian_body),
    area_of_largest_ovarian_follicle =as.numeric(area_of_largest_ovarian_follicle),
    mean_uterine_horns_width =as.numeric(mean_uterine_horns_width),
    mammary_gland_width =as.numeric(mammary_gland_width),
    ovulatory_body =as.numeric(ovulatory_body))
  
  new_pp <- recipes::bake(model_obj$recipe,new_data = new_data) # apply preprocessing learned during training
  pred <- predict(model_obj$model,newdata = new_pp,type = "raw") # predictions
  prob <- predict(model_obj$model,newdata = new_pp,type = "prob") # probability
  tibble::tibble(predicted_class =as.character(pred),predicted_probability =prob[1, as.character(pred)] # output
  )
}


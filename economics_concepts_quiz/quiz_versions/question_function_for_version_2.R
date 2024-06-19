generate_quiz <- function(df, selected_unit) {

  
  focused_concepts_df <- df %>%
    filter(`Unit Name` == selected_unit)
  

  
  
  
  correct_options <- 1
  wrong_options_diff_unit <- 3
  wrong_options_same_unit <- 2
  number_of_options <-  correct_options + wrong_options_diff_unit + wrong_options_same_unit
  
  
  selected_row_df <- focused_concepts_df %>%
    sample_n(correct_options)
  
  
  
  # 1) Filter the selected row from microeconomics_concepts_df and select 3 rows randomly
  diff_unit_options_df <-  df %>%
    anti_join(selected_row_df, by = c("Concept","Unit Name")) %>%
    sample_n(wrong_options_diff_unit)
  
  # 2) Filter the selected row from focused_concepts_df and select 2 options
  same_unit_options_df <- focused_concepts_df %>%
    anti_join(selected_row_df, by = c("Concept","Unit Name")) %>%
    sample_n(wrong_options_same_unit)
  
  wrong_options_df <- bind_rows(diff_unit_options_df,same_unit_options_df) %>% 
    mutate(correct = FALSE)
  
  all_options_df <- selected_row_df %>% 
    mutate(correct = TRUE) %>% 
    bind_rows(wrong_options_df) %>% 
    sample_n(number_of_options)  

  
  
  
  
  quiz(
    question(paste0("1. What is ",selected_row_df$Concept,"?"),
             answer(wrong_options_df$`Abbreviated Definition`[1]),
             answer(wrong_options_df$`Abbreviated Definition`[2]),
             answer(wrong_options_df$`Abbreviated Definition`[3]),
             answer(wrong_options_df$`Abbreviated Definition`[4]),
             answer(wrong_options_df$`Abbreviated Definition`[5]),
             answer(selected_row_df$`Abbreviated Definition`[1], correct = TRUE)
    )
  )
}

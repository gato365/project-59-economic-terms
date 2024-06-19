
select_rows <- function(df, selected_unit) {
  focused_concepts_df <- df %>%
    filter(`Unit Name` == selected_unit) %>%
    slice_sample(n=3) # Select three rows randomly from the filtered dataframe
  return(focused_concepts_df)
}

# Function to generate quiz questions based on the selected rows
generate_quiz <- function(econ_df,selected_rows_df) {
  quizzes <- list()
  
  for(i in 1:nrow(selected_rows_df)) {
    correct_options <- 1
    wrong_options_diff_unit <- 3
    wrong_options_same_unit <- 2
    number_of_options <- correct_options + wrong_options_diff_unit + wrong_options_same_unit
    
    # Filter for different unit options
    diff_unit_options_df <- econ_df %>%
      anti_join(selected_rows_df[i,], by = c("Concept", "Unit Name")) %>%
      sample_n(wrong_options_diff_unit)
    
    # Filter for same unit but different concepts
    same_unit_options_df <- econ_df %>%
      filter(`Unit Name` == selected_rows_df$`Unit Name`[i]) %>%
      anti_join(selected_rows_df[i,], by = "Concept") %>%
      sample_n(wrong_options_same_unit)
    
    # Combine wrong options and set their correctness status
    wrong_options_df <- bind_rows(diff_unit_options_df, same_unit_options_df) %>%
      mutate(correct = FALSE)
    
    # Combine all options and shuffle
    all_options_df <- bind_rows(selected_rows_df[i,] %>% mutate(correct = TRUE), wrong_options_df) %>%
      sample_n(number_of_options)
    
    # Generate quiz question
    quizzes[[i]] <- quiz(
      question(paste0(i, ". What is ", selected_rows_df$Concept[i], "?"),
               answer(all_options_df$`Abbreviated Definition`[1], correct = all_options_df$correct[1]),
               answer(all_options_df$`Abbreviated Definition`[2], correct = all_options_df$correct[2]),
               answer(all_options_df$`Abbreviated Definition`[3], correct = all_options_df$correct[3]),
               answer(all_options_df$`Abbreviated Definition`[4], correct = all_options_df$correct[4]),
               answer(all_options_df$`Abbreviated Definition`[5], correct = all_options_df$correct[5])
      )
    )
  }
  
  return(quizzes)
}
`

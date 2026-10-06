### CLEAR WORKSPACE
rm(list = ls())
while (!is.null(dev.list())) {
  dev.off()
}

### IMPORT LIBRARIES

### LOAD DATA 
data <- read.csv("algorithmic-task-dataset.csv")


### ADD NEW COLUMNS
data$action <- "action"
data$reason <- "reason"



### INSPECT DATA
print(data)
summary(data)
sapply(data, class)
str(data[, c("status", "age", "score", "days_since_activity", "answer_a", "answer_b")])
#[data are OK, corresponding to the assignement, reasonable types of variables, small size]







### PREDEFINE FUNCTIONS - we predefine functions with input one row of the data, and they evaluate conditions on which we decide what action to take


## NO_ACTION
noaction <- function(row) {
  if (isTRUE(row$status == "inactive")) {
    condition = TRUE
    reason = "status == \"inactive\""
  }
  else {
    condition = FALSE
    reason = ""
  }
  return(list(condition = condition, reason = reason))
  }
  

## REVIEW

# (i) age
reviewage <- function(row) {
  if (isTRUE(row$age >= 18 && row$age <= 100)) {
    condition = FALSE
    reason = ""
  }
  else if (isTRUE(row$age < 18)) {
    condition = TRUE
    reason = "age < 18"
  }
  else if (isTRUE(row$age > 100)) {
    condition = TRUE
    reason = "age > 100"
  }  
  else {
    condition = TRUE
    reason = "age ERROR"
  }
  return(list(condition=condition, reason=reason))
}

# (ii) score
reviewscore <- function(row) {
  if (isTRUE(row$score >= 0 && row$score <= 100)) {
    condition = FALSE
    reason = ""
  }
  else if (isTRUE(row$score < 0)) {
    condition = TRUE
    reason = "score < 0"
  }
  else if (isTRUE(row$score > 100)) {
    condition = TRUE
    reason = "score > 100"
  }  
  else {
    condition = TRUE
    reason = "score ERROR"
  }
  return(list(condition=condition, reason=reason))
}

# (iii) days_since_activity
reviewdays <- function(row) {
  if (isTRUE(row$days_since_activity >= 0)) {
    condition = FALSE
    reason = ""
  }
  else {
    condition = TRUE
    reason = "days_since_activity ERROR"
  }
  return(list(condition=condition, reason=reason))
}

# (iv) answer_a
reviewaa <- function(row) {
  if (isTRUE(row$answer_a %in% c("ANO", "NE"))) {
    condition = FALSE
    reason = ""
  }
  else {
    condition = TRUE
    reason = "answer_a ERROR"
  }
  return(list(condition=condition, reason=reason))
}

# (v) answer_b
reviewab <- function(row) {
  if (isTRUE(row$answer_b %in% c("ANO", "NE"))) {
    condition = FALSE
    reason = ""
  }
  else {
    condition = TRUE
    reason = "answer_b ERROR"
  }
  return(list(condition=condition, reason=reason))
}

# (vi) review
review <- function(row) {
  checks <- list(
    reviewage(row),
    reviewscore(row),
    reviewdays(row),
    reviewaa(row),
    reviewab(row)
  )
  conditions <- sapply(checks, function(x) x$condition)
  reasons <- sapply(checks, function(x) x$reason)
  condition <- any(conditions)
  reason <- paste(reasons[conditions], collapse = ", ")
  return(list(
    condition = condition,
    reason = reason
  ))
}


## URGENT

# (i) condition I 
urgent1 <- function(row) {
  if (isTRUE(row$score >= 90 && row$answer_b == "ANO")) {
    condition = TRUE
    reason = "score >= 90 && answer_b == \"ANO\""
  }
  else {
    condition = FALSE
    reason = ""
  }
  return(list(condition=condition, reason=reason))
}

# (ii) condition II 
urgent2 <- function(row) {
  if (isTRUE(row$score >= 80 && row$age >= 65)) {
    condition = TRUE
    reason = "score >= 80 && age >= 65"
  }
  else {
    condition = FALSE
    reason = ""
  }
  return(list(condition=condition, reason=reason))
}

# (iii) urgent
urgent <- function(row) {
  checks <- list(
    urgent1(row),
    urgent2(row)
  )
  conditions <- sapply(checks, function(x) x$condition)
  reasons <- sapply(checks, function(x) x$reason)
  condition <- any(conditions)
  reason <- paste(reasons[conditions], collapse = ", ")
  return(list(
    condition = condition,
    reason = reason
  ))
}


## CONTACT

# (i) condition I 
contact1 <- function(row) {
  if (isTRUE(row$score >= 70)) {
    condition = TRUE
    reason = "score >= 70"
  }
  else {
    condition = FALSE
    reason = ""
  }
  return(list(condition=condition, reason=reason))
}

# (ii) condition II 
contact2 <- function(row) {
  if (isTRUE(row$answer_a == "ANO" && row$days_since_activity > 30)) {
    condition = TRUE
    reason = "answer_a == \"ANO\" && days > 30"
  }
  else {
    condition = FALSE
    reason = ""
  }
  return(list(condition=condition, reason=reason))
}

# (iii) contact
contact <- function(row) {
  checks <- list(
    contact1(row),
    contact2(row)
  )
  conditions <- sapply(checks, function(x) x$condition)
  reasons <- sapply(checks, function(x) x$reason)
  condition <- any(conditions)
  reason <- paste(reasons[conditions], collapse = ", ")
  return(list(
    condition = condition,
    reason = reason
  ))
}


## REMINDER
reminder <- function(row) {
  if (isTRUE(row$days_since_activity > 30)) {
    condition = TRUE
    reason = "days > 30"
  }
  else {
    condition = FALSE
    reason = ""
  }
  return(list(condition=condition, reason=reason))
}

### PUT ALL THINGS TOGETHER - now we predefine function that uses all of the functions done before to process the whole dataset based on the criteria in the assignement

process_data <- function(data) {
  for (i in 1:nrow(data)) {
    # we work with rows of the data
    row <- data[i, ]
    
    # NO_ACTION
    step1 = noaction(row)
    if (step1$condition) {
      row$action <- "NO_ACTION"
      row$reason <- step1$reason
    }
    else {
      # REVIEW
      step2 = review(row)
      if (step2$condition) {
        row$action <- "REVIEW"
        row$reason <- step2$reason
      }
      else {
        # URGENT
        step3 = urgent(row)
        if (step3$condition) {
          row$action <- "URGENT"
          row$reason <- step3$reason
        }
        else {
          # CONTACT
          step4 = contact(row)
          if (step4$condition) {
            row$action <- "CONTACT"
            row$reason <- step4$reason
          }
          else {
            # REMINDER
            step5 = reminder(row)
            if (step5$condition) {
              row$action <- "REMINDER"
              row$reason <- step5$reason
            }
            else {
              row$action <- "STANDARD"
              row$reason <- "no conditions met"
    }  
    }
    }
    }
    }
    data[i, ] <- row
  }
  return(data)
}


res = process_data(data)

print(res)





#data[, c("user_id", "action", "reason")]




# Save final table to .csv
write.csv(res, "algorithmic-results.csv", row.names = FALSE)












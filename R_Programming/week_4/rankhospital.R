rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        outcome_file <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        if(!(state %in% unique(outcome_file$State))) {
                stop("invalid state")
        }
        switch (outcome, "heart attack"  = { col = 11 },
                "heart failure" = { col = 17 },
                "pneumonia"     = { col = 23 },
                stop("invalid outcome"))
        

        outcome_subset = outcome_file[outcome_file[ , 7] ==state, c(2, col)]
        names(outcome_subset) = c("Hospital.Name","Outcome")
                #Don't show warning:
        outcome_subset$Outcome = suppressWarnings(as.numeric(outcome_subset$Outcome)) 
                #Remove NAs:
        outcome_subset = na.omit(outcome_subset)     
        nhosp = nrow(outcome_subset)
                #Convert "best" and "worst into numbers
        switch(num, best = {
                num = 1
        }, worst = {
                num = nhosp
        })
        if (num > nhosp) {
                return(NA)
        }
        
        ## Return hospital name in that state with lowest 30-day death rate
        hosp_rank = outcome_subset[order(outcome_subset$Outcome, outcome_subset$Hospital.Name), ]
        best_hosp = hosp_rank[[num, "Hospital.Name"]]
        return(best_hosp)   
}
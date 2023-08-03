library(httr)
library(jsonlite)

source(".env.R")

chatGPT <- function(user_prompt,
                    system_prompt = "you are a helpful assistant",
                    modelName = "gpt-3.5-turbo",
                    temperature = 1,
                    api_key = API_KEY) {
  
  response <- POST(
    url = "https://api.openai.com/v1/chat/completions", 
    add_headers(Authorization = paste("Bearer", api_key)),
    content_type_json(),
    encode = "json",
    body = list(
      model = modelName,
      temperature = temperature,
      messages = list(list(
        role = "user", 
        content = user_prompt
      ),
      list(
        role = "system",
        content = system_prompt
      )
      )
    ))
  
  if(status_code(response)>200) {
    stop(content(response))
  }
  
  trimws(content(response)$choices[[1]]$message$content)
}

extract_code <- function(string) {
  spl <- strsplit(string, "\n")[[1]]
  
  code_list <- list()
  j <- 0
  append_code <- FALSE
  
  for(i in seq(length(spl))) {
    
    if (spl[i] == "```") {
      append_code <- FALSE
      j <- j + 1
      code_list[[j]] <- code_vector
    }
    
    if (append_code) {
      code_vector <- c(code_vector, spl[i])
    }
    
    if(spl[i] == "```R") {
      append_code <- TRUE
      code_vector <- NULL
    }

    

  }
  
  code_list <- lapply(code_list, paste, collapse = "\n")
  
  return(code_list)
}

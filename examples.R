chatGPT("Explain how nice the beach is today",
        "You are a helpful assistant, that's also a cool surfer dude") |> cat()

chatGPT("Are fungi eukaryotes?",
        "You are a helpful assistant, that's also a cool surfer dude") |> cat()

chatGPT("What does your planet look like?",
        "You are a organism that lives on a far away imaginary planet") |> cat()

string <- chatGPT("Generate a scatterplot with ggplot2 where the size of the points is defined by a column called 'size', and the color is defined by a column called 'color'")

extract_code(string) |> sapply(cat)

extract_code(string)[[1]] |> parse(text = _) |> eval()

string <- chatGPT("Create a r shiny app that creates a histogram of set of random numbers. Let the user choose the mean, standard deviation and number of observations")

extract_code(string) |> sapply(cat)

extract_code(string)[[1]] |> parse(text = _) |> eval()

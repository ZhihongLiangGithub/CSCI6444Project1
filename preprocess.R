library(sqldf)
maildir <-
  "C:/Users/Liang/Desktop/BigData/enron_mail_20150507/maildir"
files <- list.files(path = maildir,
                    full.names = T,
                    recursive = T)
data <- lapply(files, function(path) {
  print(path)
  lines <- readLines(path)
  #extract the message-ID
  id <- gsub("Message-ID: ", "", lines[grepl("^Message-ID: .*", lines)][1])
  #extract the sender
  sender <- gsub("From: ", "", lines[grepl("^From: .*", lines)][1])
  #extract the receiver(s)
  start <- grep("^To:.*", lines)[1]
  end <- grep("^Subject:.*", lines)[1] - 1
  receiver <- character()
  if (is.na(start)) {
    receiver <- NA
  } else{
    if (start > end) {
      receiver <- NA
    } else{
      receiver <- gsub("\t", "", lines[start:end])
      receiver <- gsub("To: ", "", receiver)
      receiver <- paste(receiver, collapse = "")
    }
  }
  #extract the cc(s)
  # start <- grep("^Cc:.*", lines)[1]
  # end <- grep("^Mime-Version:.*", lines)[1] - 1
  # cc <- character()
  # if (is.na(start)) {
  #   cc <- NA
  # } else {
  #   if (start > end) {
  #     cc <- NA
  #   } else{
  #     cc <- gsub("\t", "", lines[start:end])
  #     cc <- gsub("Cc: ", "", cc)
  #     cc <- paste(cc, collapse = "")
  #   }
  # }
  return(c(id, sender, receiver))
})
dataframe <- data.frame(id = sapply(data, "[", 1), sender = sapply(data, "[", 2), receiver = sapply(data, "[", 3))
dataframe <- na.omit(dataframe)
newdf <- sqldf("select sender, receiver from dataframe group by id")
save(newdf, file = "email_data.RData")

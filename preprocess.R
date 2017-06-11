maildir <-
  "C:/Users/Liang/Desktop/BigData/enron_mail_20150507/maildir"
files <- list.files(path = maildir,
                    full.names = T,
                    recursive = T)
data <- lapply(files, function(path) {
  print(path)
  lines <- readLines(path)
  #extract the sender
  from <- gsub("From: ", "", lines[grepl("^From: .*", lines)][1])
  #extract the receiver(s)
  start <- grep("^To:.*", lines)[1]
  end <- grep("^Subject:.*", lines)[1] - 1
  to <- character()
  if (is.na(start)) {
    to <- NA
  } else{
    if (start > end) {
      to <- NA
    } else{
      to <- gsub("\t", "", lines[start:end])
      to <- gsub("To: ", "", to)
      to <- paste(to, collapse = "")
    }
  }
  #extract the cc(s)
  start <- grep("^Cc:.*", lines)[1]
  end <- grep("^Mime-Version:.*", lines)[1] - 1
  cc <- character()
  if (is.na(start)) {
    cc <- NA
  } else {
    if (start > end) {
      cc <- NA
    } else{
      cc <- gsub("\t", "", lines[start:end])
      cc <- gsub("Cc: ", "", cc)
      cc <- paste(cc, collapse = "")
    }
  }
  return(c(from, to, cc, path))
})
dataframe <- data.frame(from = sapply(data, "[", 1), to = sapply(data, "[", 2), cc = sapply(data, "[", 3), path = sapply(data, "[", 4))
rm(data)
rm(files)
rm(maildir)
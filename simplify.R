library(plyr)

load("email_data.RData")
#count the frequency of senders and select those records which are above mean
senderfreq <- count(newdf$sender)
names(senderfreq) <- c("sender", "freq")
senderfreq2 <- senderfreq[which(senderfreq$freq > mean(senderfreq$freq)),]
#split the receivers and add to new rows according to the senders
s <- strsplit(as.character((newdf$receiver)), split = ", ")
newdf2 <- data.frame(sender = rep(newdf$sender, sapply(s, length)), receiver = unlist(s))
#count the frequency of receivers and select those records which are above mean
receiverfreq <- count(newdf2$receiver)
names(receiverfreq) <- c("receiver", "freq")
receiverfreq2 <- receiverfreq[which(receiverfreq$freq > mean(receiverfreq$freq)),]
#select the emails
newdf3 <- newdf2[newdf2$sender %in% senderfreq2$sender & newdf2$receiver %in% receiverfreq2$receiver,]
save(newdf3, file = "processed.RData")

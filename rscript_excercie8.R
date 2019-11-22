#Exercise08

#Question 1
UWvsMSU.txt <- read.delim("UWvMSU_1-22-13.txt")
UWvsMSU.df <- as.data.frame(UWvsMSU.txt)

#create dataframe with total points for each team after they score 
#separate UW and MSU into separate dfs
UW <- subset(UWvsMSU.df, UWvsMSU.df$team == "UW")
MSU <- subset(UWvsMSU.df, UWvsMSU.df$team == "MSU")
#loop through team df to generate a vector of the cumulative score
UWscore <- c(UW$score)
UWcum <- numeric(length(UWscore))
for(i in 1:length(UWscore)){
  UWcum[i] <- sum(UWscore[1:i])
}
UW["cumulative"] <- UWcum
#same for MSU
MSUscore <- c(MSU$score)
MSUcum <- numeric(length(MSUscore))
for(i in 1:length(MSUscore)){
  MSUcum[i] <- sum(MSUscore[1:i])
}
MSU["cumulative"] <- MSUcum

#combine the two dfs
merged <- rbind(UW,MSU)

#plot  team scores throughout game
library(ggplot2)
game_plot <- ggplot(merged, aes(x=time, y=cumulative))
game_plot+geom_line(aes(color=team))+xlab("Time")+ylab("Score Total")+
  scale_color_manual(values=c("darkgreen", "red"))

#Question 2: number game
#run code and enter input values to guess the correct number


print("Guess a number between 1 and 100")
answer <- sample(1:100,1)
for(i in 1:10){
  input <- as.numeric(readline())
  if(input > answer){
    print("Lower")
  }else if(input < answer){
    print("Higher")
  }else{
    print("Correct!")
  }
}






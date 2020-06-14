library(gtools)

#joining strings with paste
number <- "Three"
suits <- "Hearts"
paste(number,suits)

# Joining vectors element-wise with paste
paste(letters[1:5],as.character(1:5))

#Generating combinations of 2 vectors with expand.grid
expand.grid(pants = c("blue","black"),shirt = c("White","gray","plaid"))

#Creating deck of cards
suits <- c("Diamonds","Clubs","Hearts","Spades")
numbers <- c("Ace","Deuce","Three","four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King")
deck <- expand.grid(number=numbers,suit=suits)
deck <- paste(deck$number,deck$suit)


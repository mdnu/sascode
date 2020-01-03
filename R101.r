### Module #1 - R Basics

### Math Variables and Strings

# addition
139 + 121

# division
260 / 60

# storing a variable
x <- 139 + 121

y <- x / 60

# variable reassignment
x <- 139 + 121
x <- x / 60

# remove variable from memory
rm(my_variable)

# order of operations
total_hr <- (139 + 121) / 60

# strings
movie <- "toy story"

# vectors in R
# think of one dimensional arrays in other languages
# combine function
c(81, 125) / 60

ratings <- c(81, 125)
ratings / 60

# vector from 1 to 10
c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
c(1:10)
c (10:1) # 10 to 1

# strings in R
movie <- "Toy Story"
movie

genres <- c("Animation", "Comedy", "Biography", "Horror", "Romance", "Sci-fi")
genres

# logical vector
1997 > 2000 # false
movie_ratings <- c(7.5, 8.5, 8.3, 7.5, 6.9, 5.2, 8.2, 8.0, 7.9, 9.3)
movie_ratings > 7.5 # false true true false false false ...

# "factors" - variables that can take on a limited # of values
# also called categorical variables

# nominal categorical variable / factor
genre_vector <-c("comedy", "comedy", "animation", "animation", "crime")
genre_factor <- factor(genre_vector)
genre_factor # lists levels
summary(genre_vector)
summary(genre_factor) # lists the # of occurences of each of the component categories

# ordinal categorical variable / factor
movielength_vector <- c("very short", "short", "medium", "short", "long", "very short", "very long")
mvlength_factor <- factor(movielength_vector,
			  ordered = TRUE,
			  levels = c("very short", "short", "medium", "long", "very long"))
mvlength_factor

### vector operations

# naming elements of a vector
year <- c(1985, 1999, 2010, 2002)
names(year) <- c("the breakfast club", "american beauty", "black swan", "chicago")
year["black swan"]

# length of a vector
length(year)

# sort a vector
year <- c(1985, 1999, 2010, 2002)
names(year) <- c("the breakfast club", "american beauty", "black swan", "chicago")
year_sorted <- sort(year)
year_sorted

# smallest and largest number
year <- c(1985, 1999, 2010, 2002)
min(year)
max(year)

# average of numbers
cost_2014 <- c(8.6, 8.5, 8.1)
sum(cost_2014)/3
mean(cost_2014)

# vector summary
cost_2014 <- c(8.6, 8.5, 8.1)
summary(cost_2014)

# vector index (to retrieve elements)
# indexing begins at 1, not 0.
cost_2014 <- c(8.6, 8.5, 8.1)
cost_2014[2]
cost_2014[c(2,3)] # 2nd and 3rd elements
cost_2014[1:3] # 1st to 3rd elements

# remove element from specific index
titles <- c("black swan", "casino", "city of god", "jumanji", "toy story")
titles[-1] # removes entry in index 1

# retrieving elements that satisfy a logical condition
cost_2014 <- c(8.6, 8.5, 8.1)
cost_2014 > 8.3
cost_2014[cost_2014 > 8.3]

# missing values
age_restric <- c(14, 12, 10, NA, 18, NA)

# vector arithmetic
age_restriction <- c(14, 16, 12, 10, 18, 18)
sequences <- c(2, 3, 0, 2, 6, 3)
multiply <- age_restriction * sequences

cost_2014 <- c(8.6, 8.5, 8.1)
cost_2014 * 10

### Module #2 - Data Structures in R------------------------------------------------
### arrays and matrices

movie_vector <- c("akira", "toy story", "the room", "the wave", "whiplash", "star wars", "the ring", "the artist", "jumanji")
movie_array <- array(movie_vector, dim = c(4,3)) # 4 rows, 3 columns

# accessing an array element
movie_array[1,2]

# extracting an entire matrix row/column
movie_array[1,] # row
movie_array[,2] # column

# matrices
# must be 2 dimensional
# created column-wise

movie_vector <- c("akira", "toy story", "the room", "the wave", "whiplash", "star wars", "the ring", "the artist", "jumanji")
movie_matrix <- matrix(movie_vector, nrow = 3, ncol = 3) # arranged by columns rather than rows
movie_matrix <- matrix(movie_vector, nrow = 3, ncol = 3, byrow = TRUE) # arranged by rows

# specifying a dimension
movie_array <- array(movie_vector, dim = c(4,3))
movie_array

# get documentation help for arrays
?array

# get array dimension
dim(movie_array)

# using logical conditions to subset arrays
length_vector <- c(125, 81, 118, 81, 106, 121, 95, 100, 104)
length_array <- array(length_vector, dim = c(3,3))
length_array

mask_array <- length_array > 120
mask_array

# subsetting array, second example
x_vector <- c("Akira", "Toy Story", "Room", "The Wave", "Whiplash",
              "Star Wars", "The Ring", "The Artist", "Jumanji")
x_array <- array(x_vector, dim = c(3,3))

x_array[mask_array]

# accesing subsets of matrix entries
movie_matrix[2:3, 1:2] # rows 2 to 3, columns 1 to 2.

# concatenating matrices
upcoming_movie <- c("Fast and Furious 8", "xXx: Return of Xander Cage", "Suicide Squad")
new_vector <- c(movie_vector, upcoming_movie)
new_vector

#### Lists
# similar to a vector, but with differing data types

movie <- list("toy story", 1995, c("animation", "adventure", "comedy"))
movie

# accessing elements of a list
movie[2]
movie[2:3] # indices 2 and 3

# named lists
movie <- list(name = "toy story",
	      year = 1995,
	      genre = c("animation", "adventure", "comedy"))

# accessing named lists
movie$genre
movie["genre"]
movies[3]

# retrieving specific type of object for a list element
class(movie$name)
class(movie$foreign)

# adding elements to lists
movie <- list(name = "toy story",
	      year = 1995,
	      genre = c("animation", "adventure", "comedy"))
movie["age"] <- 5

# modifying list elements
movie["age"] <- 5
movie["age"] <- 6

# removing list elements
movie["age"] <- NULL

# concatenating lists
movie_part1 <- list(name = "Toy Story")
movie_part2 <- list(year = 1995, genre = c("Animation", "Adventure", "Comedy"))
movie_concatenated <- c(movie_part1, movie_part2)
movie_concatenated

#### Data Frames
# contains correlated information
# eg. movie titles and corresponding years

movies <- data.frame(name = c("toy story", "akira", "the breakfast club", "the artists", "modern times", "fight club", "city of god", "the untouchables"),
		     year = c(1995, 1998, 1985, 2011, 1936, 1999, 2002, 1987),
		     stringAsFactors = F)
movies

# accessing data frame entries
movies$name

# access column
movies[1]

# accessing individual elements
movies[1,2]

# data frame info summary
str(movies)

# head and tail function
# first and last six elements
head(movies)
tail(movies)

# adding a new column
movies['length'] <- c(81, 125, 97, 100, 87, 139, 130, 119)

# adding a new row
movies <- rbind(movies, 
		c(name = "dr. strangelove",
		  year = 1964,
		  length = 94))

# deleting rows
movies <- movies[-9,] # delete row 9

# deleting columns
movies["length"] <- NULL

# find the type of an object
class(movie$name)
class(movie$foreign)

#--------------------------------------------------------------------------
# R Programming Fundamentals

# conditions and loops
movie_year <- 2002
if (movie_year > 2000) {
	print('movie year is greater than 2000')
} else {
	print('movie year is not greater than 2000')
}

# logical operators
1995 < 1987
20016 >= 2015
"Toy Story" == "Toy Story"
"Toy Story" != "Interstellar"
"Toy Story" == "Toy Story" & 1995 < 1987

# comparison and logical operators
# ==, "is equal to"
# !=, "is not equal to"
# >,<,>=,<=, self-explanatory
# &, and
# |, or
# !, not
# %in%, "is found in?"

# for loops
years <- c(1995, 1998, 1985, 2011, 1936, 1999)
for (yr in years) {
	print(yr)
}

for (yr in years) {
	if (yr < 1980) {
		print("old movie")
	} else {
		print("not that old")
	}
}

# while loops
count <- 1
while (count <= 5) {
	print(c("iteration number:", count))
	count <- count + 1
}

# download a data set:
download.file("https://ibm.box.com/shared/static/n5ay5qadfe7e1nnsv5s01oe1x62mq51j.csv", destfile="/resources/data/movies-db.csv")

# associate downloaded data to a data frame
movies_Data <- read.csv("/resources/data/movies-db.csv", header=TRUE, sep=",")

# subsets and loops
decade = 'recent'
if(decade == 'recent' ){
    # Subset the dataset to include only movies after year 2000.
    subset(movies_Data, year >= 2000)
} else { # If not...
    # Subset the dataset to include only movies before 2000.
    subset(movies_Data, year < 2000)
}

# while loop in data
iteration = 1
while (iteration <= 5) {
    print(c("This is iteration number:",as.character(iteration)))
    print(movies_Data[iteration,]$name)
    iteration = iteration + 1
}

# applying functions to vectors
my_list <- c(10,12,15,19,25,33)
my_list + 2 # add two to all values in vector
my_list ** 2 # exponentiate all values by two
my_list + my_list # sum two vectors element-wise

### Functions in R

# pre-defined functions
# finding the mean
ratings <-c(8.7, 6.9, 8.5)
mean(ratings)

# sorting values, in ascending order
sort(ratings)
sort(ratings, decreasing = TRUE) # in descending order

# user-defined functions
printHelloWorld <- function() {
	print("hello world!")
}
printHelloWorld()

add <- function(x, y) {
	x + y
}
add(3, 4)

# returning values explicitly
add <- function(x, y) {
	return(x + y)
}
add(3, 4)
# note: if the function lacks a return statement
# then R will automatically return the value of
# the last evaluated expression.

# if/else in functions
isGoodRating <- function(rating) {
	if (rating < 7) {
		return("NO")
	} else {
		return("YES")
	}
}

# using a default value for a function argument
isGoodRating <- function(rating, threshold = 7) {
	if (rating < threshold) {
		return("NO")
	} else {
		return("YES")
	}
}
isGoodRating(8)

# overwriting default value:
isGoodRating(8, threshold = 8.5)

# nested functions
# example: deciding a movie to watch
watchMovie <- function(moviename, my_threshold = 7) {
	rating <- my_data[my_data[,1] == moviename, "average_rating"]
	isGoodRating(rating, threshold = my_threshold)
}
watchMovie("Akira")
watchMovie("Akira", 8)

# global and local variables
myFunction <- function() {
	y <<- 3.14 # global variable
	temp <- 'hello world'
	return(temp)
}
myFunction()
y
temp

## Objects & Classes
# object: data structure with attributes.
# and methods that act on those attributes.
# the object's attribute that specifies its type
# is the object's "class".

# object classes: numeric, character, logical, integer.
# numeric is the default class.

age_restriction <- c(12, 10, 18, 18)
class(age_restriction) # notice it is 'numeric' and not 'integer'

# convert from numeric to integer
integer_vector <- as.integer(age_restriction)
class(integer_vector)
# there is also the "as.numeric" function for converting back.

# converting to character class
year <- as.character(1995)

# recall that vectors are meant to only store data of the same type.
# illustrate this: try to create a vector with both character and
# numeric types:
combined <- c("toy story", 1995, "akira" 1998)
class(combined) # notice that R convers the numeric types into character types.

# complex class
z = 8 + 6i
z
class(z)

# difference between class and mode
# for a simple vector, the class and mode of the vector are the same.
# in matrices, arrays, data frames, and lists, the class() function
# shows the type of the data structure. i.e. the class of matrix will
# be 'matrix' regardless of what data types are inside the matrix.
# mode, otoh, determines what types of data can be found within the
# object, and how these values are stored. so we'll need to use the
# mode() function to find the data types of values inside a matrix.

# on a vector
movies <- c("Toy Story", "Akira", "The Breakfast Club", "The Artist") # creating two vectors
genre <- c("Animation/Adventure/Comedy", "Animation/Adventure/Comedy", "Comedy/Drama", "Comedy/Drama")

class(movies)
mode(movies)

# on a matrix
movies_genre <- cbind(movies, genre)
movies_genre 
class(movies_genre)
mode(movies_genre)

# for arrays
# recall that arrays can still only have one data type inside of it, but the set
# of data types it can store is larger. e.g: an array can store matrices as elements
sample_array <- array(1:12, 
		      dim = c(3, 2, 2)) # create an array with dimensions 3 x 2 x 2 
sample_array
class(sample_array)
mode(sample_array)

# for data frames
# recall that data frames are similar to arrays, but let you assign names to rows and
# columns. as well, they allow each column to have a different data type if you wish.
Name <- c("Toy Story", "Akira", "The Breakfast Club", "The Artist")
Year <- c(1995, 1998, 1985, 2011)
Length <- c(81, 125, 97, 100)
RowNames = c("Movie 1", "Movie 2", "Movie 3", "Movie 4")

sample_DataFrame <- data.frame(Name, Year, Length, row.names=RowNames) 
sample_DataFrame

class(sample_DataFrame)

# for lists
# recall that lists are similar to vectors, but can store multiple data types
sample_List = list("Star Wars", 8.7, TRUE)
sample_List

class(sample_List)

mode(sample_List)

mode(sample_List[[3]])

# object attributes
# you can change any individual attribute of an object with the 'attr()' function
# you can also use the 'attribute()' function to return a list of all the attributes
# currently defined for some object.
z <- c(8.3, 8.1, 7.9, 8, 30, 10.4, 1, 15)
z
attr(z, "dim") <- c(4,2) # convert dimension of vector into a 4x2 matrix.
z
class(z)
mode(z)

### Debugging

# errors
"a" + 10

for(i in 1:3) {
	print(i + "a")
}

# tryCatch
tryCatch(10 + 10)
tryCatch("a" + 10)

tryCatch(10 + "a", error = function(e)
		print("oops, something went wrong"))

x <- tryCatch(10 + "a", error = function(e) return("10a")) # no error
x

tryCatch(10 + 10, error = function(e)
		print("oops, something went wrong"))

# tryCatch with return
tryCatch(10 + "a", error = function(e)
		return("10a"))

# tryCatch with loops
tryCatch(
	for(i in 1:3) {
		print(i + "a")
		}
	, error = function(e) print("found error."))

# warning handling
# warnings will not halt code
as.Integer("A")

tryCatch(as.Integer("A"),
		warning = function(e)
			print("Warning."))


#--------------------------------------------------------------------------
# Working with Data in R

# reading CSV files
# comma separated values
read.csv("/file_path/movies-db.csv")

# reading XLS files
# no native function for reading excel files
install.packages("readxl")
library(readxl)
read_excel("/file_path/movies-db.xls")
my_excel_data <- read_excel("/file_path/movies-db.xls")
str(my_excel_data) # structure of your table

# accessing data from dataset
# by default, R will structure the data as a dataframe
my_data <- read.csv("/file_path/movies-db.csv")
my_data
head(my_data) # first six rows
str(my_data) # print out structure of table


# accessing elements
my_data['name'] # column
my_data[1,] # row
my_data[1, c("name","length_min")] # row, selected columns

# accessing built-in data sets
data()

# help
help(CO2)


# reading text files
text <- readLines("/file_path/toy_story.txt")

# text operations
# number of sentences
length(text)

# number of characters
nchar(text)

# size of file (in bytes)
file.size("/file_path/toy_story.txt")

# reading by word rather than line
text <- scan("/file_path/toy_story.txt", "")


# writing and saving files in R
# exporting as a text file

# exporting matrix as a file
m <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 2, ncol = 3)
write(m, file = "matrix_as_text.txt", ncolumns = 3, sep = " ")

# exporting as a CSV file (for data frames)
write.csv(df, file = "file_path/dataset.csv", row.names = FALSE)
write.table(df, file = "file_path/dataset.csv", row.names = FALSE, col.names = FALSE, sep = ",") # omit column names

# exporting as an excel file
install.packages("xlsx")
library(xlsx)

write.xlsx(df, file = "file_path/dataset.xlsx", sheetName = "sheet1", col.names = TRUE, row.names = FALSE)

# saving R objects in .RData files
save(list = c("var1", "var2", "var3"), file = "vars.RData", safe = TRUE)

#--------------------------------------------------------------------------
# Strings and Dates in R

# read in text from a file
summary <- readLines("/file_path/The_Artist.txt")
summary
length(summary) # get length
file.size("/file_path/The_Artist.txt") # get file size

# scan
my_data <- scan("/file_path/The_Artist.txt")
my_data

# number of characters in a string
nchar(summary[1])

# convert all characters to uppercase
toupper(summary[1])

# convert all characters to lowercase
tolower(summary[1])

# replace a specific set of characters in a string
chartr(" ", "-", summary[1]) # replace, replacement, string

# breaking apart a string by using some expression
char_list <-strsplit(summary[1], " ") # break up string by space character, returns a list
word_list <- unlist(char_list) # turns list above back to a character vector
word_list

# sorting, ordering elements alphabetically
sorted_list <- sort(word_list)
sorted_list

# concatenating elements of a character vector
paste(sorted_list, collapse = " ") # collapse determines string value that separates elements

# isolate a portion of a string
sub_string <- substr(summary[1], 
		     start = 4,
		     stop = 50)
sub_string # includes leading and tailing space character

# trimming leading/tailing space characters
trimws(sub_string)

# get substring by counting back from last position
library(stringr)
str_sub(summary[1], -8, -1) # negative start and end arguments, gets last 8 characters.

## The Date Format in R
# date is represented as the number of days since january 1, 1970

# load up preliminary data set
bestActors
str(bestActors) # date of birth represented in non-standard form, of type int.
# this format is the UNIX time format, counting number of seconds since january 1, 1970.

# reformatting UNIX dates
actors.birthday <- as.POSIXct(bestActors$Date.of.Birth, 
			      origin = "1970-01-01")
# output of above will be a full timestamp in format: YYYY-MM-DD HH:MM:SS

# convert above format to date class
actors.birthday <- as.Date(actors.birthday)

# second example:
bestActresses
str(bestActresses) # date of birth column holds factors, not the date class

# converting character formats to date
actresses.birthday <- as.Date(bestActresses$Date.of.Birth, 
			      "%Y/%m/%d") # param says to expect the format to be "year month day" separated with slashes.

# date string formatting
as.Date("27/06/94", "%d/%m/%y") # output: 1994-06-27, in date class format

# specifying the format in detail
# chart:
# "%a" = "three character abbreviated weekday name"
# "%A" = "full weekday name"
# "%b" = "three character abbreviated month name"
# "%B" = "full month name"
# "%d" = "day of the month"
# "%m" = "month of the year"
# "%y" = "two digit year representation"
# "%Y" = "four digit year representation"

# operations on date objects
# time difference
as.Date("1994/06/27") - as.Date("1959/01/01")

# using a comparator
as.Date("1994/06/27") > as.Date("1959/01/01")

# subtracting from a date
as.Date("1994/06/27") - 14

# current date (system date)
Sys.Date() # date format
date() # string format
Sys.time() # current time in POSIX timestamp format

# conversions on date class object
weekdays(Sys.Date()) # converts the date into a string representing the weekday that date falls on
months(Sys.Date()) # similar
quarters(Sys.Date()) # similar

# convert to julian calendar
julian(Sys.Date())

# create a sequence of dates
seq(Sys.Date(), by = "month", length.out = 4) # start at current date, increment by month


## regular expressions in R
# regex occurs in many places: data extraction, cleaning, analysis, validation, text mining, and parsing.
# see data frame, names and emails from different regions
# problem: some email addresses have domain differences
# task: isolate all characters between @ and .
# i.e. convert data into some form suitable for data analysis

email_df <- read.csv("https://ibm.box.com/shared/static/cbim8daa5vjf5rf4rlz11330lvqbu7rk.csv")
email_df

# email format: "test@testing.com"
# in regex: .+@.+
# . = "wilfcard"
# + = used to match the preceding pattern element one or more times
# hence, a period followed by a plus sign will match any sequence of one or more characters.
# @ = matches an 'at sign' in the string

# regex: @.+\\.
# two backslashes: ensures that the period character itself will be matched in a string,
# rather than the period acting as a wild card.

# grep
# takes in at least two inputs, the regular expression and a list of strigns you'd like to check for a match
grep("@.*", 
     c("test@testing.com", 
       "not an email", 
       "test2@testing.com")) 
# asterisk: will match zero or more of the previous element rather than one or more.
# output above: list positions of the strings which match the regex

grep("@.*", 
     c("test@testing.com", 
       "not an email", 
       "test2@testing.com"), 
     value = TRUE) # output the actual values

# gsub
# substitute strings found by the regular expression
gsub("@.*", 
     "@newdomain.com", 
     c("test@testing.com", 
       "not an email", 
       "test2@testing.com")) # second argument is the replacement string.

# extract the matched strigns
matches <- regexpr("@.*", 
		   c("test@testing.com", 
		     "not an email", 
		     "test2@testing.com"))
regmatches(c("test@testing.com", 
	     "not an email", 
	     "test2@testing.com"), 
	   matches)

# solving the example problem:
matches <- regexpr("@.*\\.", 
		   email_df[,'Email']) # apply a regex to the email column, isolating everything from the @ sign to the .
email_df[,'Domain'] = regmatches(email_df[,'Email'], 
				 matches) # extract the matching substrings and add them to a new column called 'domain'
email_df
table(email_df[,'Domain']) # construct a frequency table for the domains in the data frame.



# Final Project
## Domain of interest: Music Charts
- Why are you interested in this field/domain?

All of us love listening to music, but we find that many of our favorite songs never seem to make it on the top of the billboards. Pop songs are always on the top even though it's not our taste. Many pop songs are formulaic, so we want to know the secret sauce that allows certain artists and companies to reach and stay on the top of the billboards. 

- What other examples of data driven project have you found related to this domain (share at least 3)?
1. [History of Rock Music](https://svds.com/rockandroll/#littlerichard) creates data visualizations on the connections between artists and songs in the rock and roll era. The website is a big visualization like a big spider web where artists and songs are small circles and lines connect them together, and the web highlights immediate connections whenever you click a person.
2. [Spotify Wrapped](https://open.spotify.com/genre/2019-page) summarizes data about a user's favorite genre and songs over the past year and provides statistics about them to the user. Spotify has cool visualizations like showing a record book such as hours listening or top listened tracks. 
3. Haebichan Jung analyzes the trends within the [kpop industry](https://towardsdatascience.com/the-data-science-of-k-pop-understanding-bts-through-data-and-a-i-part-1-50783b198ac2) through Spotify playlists and analyzes its characteristics. The analysis includes conclusions about why certain groups stay at the top along with graphs that show popularity of famous groups.

- What data-driven questions do you hope to answer about this domain (share at least 3)?
1. What key is the most popular for top songs on Spotify?
2. What song(s) or genre(s) are the most dancible to? What has the most energy to it?
3. Does the length of a song affect its liveliness (statistic from Spotify)?
4. What is the most streamed song (of all time)?
5. Are songs with features more popular than without?
6. Which artist has the most number of streams?
7. What is the artist ot the song that lasted on the charts for the longest period of time?
8. Which artists has the most number of songs on the charts?
9. Which songs lasted longest after their year of publishing? 

## Finding Data
- Where did you download the data (e.g., a web URL)?

We found all our datasets through Kaggle. Each came from a different source, and we downloaded the dataset from the website. We picked the one datasets that we wanted when downloading (since all urls had their datasets came in packages of multiple datasets) to put in the data folder.

Below are URL's to the websites where we got our data. If you want to check our data on the website itself, make sure to pick the one with the right name! (ie. the names similar to the ones from our folder)
- Dataset 1: [Ultimate Spotify Tracks](https://www.kaggle.com/zaheenhamidani/ultimate-spotify-tracks-db)
- Dataset 2: [Spotify Weekly Top 200 Streams](https://www.kaggle.com/danield2255/data-on-songs-from-billboard-19992019#spotifyWeeklyTop200Streams.csv)
- Dataset 3: [Billboard Weekly Songs With Song And Artist Spotify Popularity](https://www.kaggle.com/miteshsingh/hollywood-music-dataset) 


### Dataset 1: Ulitmate Spotify Tracks 
Zaheen Hamidani collected all the data for the dataset. All songs were gathered from the Spotify API, and the dataset looks at songs and their dancibility, liveliness, and other fun stuff to look at (as a means to quantify songs).
- How many observations (rows) are in your data?
**232725**
- How many features (columns) are in the data?
**18**
- What questions (from above) can be answered using the data in this dataset?
  1. What key is the most popular for top songs on Spotify? We can find the highest frequency of keys for songs.
  2. What song(s) or genre(s) are the most dancible to? We can group songs to their respectible genres and find which has the most overall dancibility (another metric from Spotify).
  3. Does the length of a song affect its liveliness? We can compare length of songs and liveliness level for songs and get a general idea of them.

### Dataset 2: Spotify Weekly Top 200 Streams
Daniel DeFoe used data collated to do a research project at California Polytechnic State University in San Luis Obispo. The data we specifically looked at was the one from Spotify. Data was gathered through the Spotify API that expanded on the first dataset including stream count for a week, artist, and any features. 

- How many observations (rows) are in your data?
**26395**
- How many features (columns) are in the data?
**5**
- What questions (from above) can be answered using the data in this dataset?
  1. What is the most streamed song? We can filter to find the song with the top streams in a week.
  2. Are songs with features more popular than without? We can compare popularity of songs with features compared to ones without.
  3. Which artist has the most number of streams? We can find the artist with most number of streams (based on their songs in the Top 200 chart).
  
### Dataset 3: Billboard Weekly Songs with Song and Artist Spotify Popularity
Mitesh Singh collected this dataset in the fall of 2018 for his CSE 519 class at SBU. He took his information from Billboard Weekly top songs and a part of the Spotify API. We took the data that was from Billboard top 100 weekly (since we thought we could pair it up with dataset 2 with weekly). The dataset has weekly chart rankings for Hollywood songs released 1955-2017 along with provided song and artist popularity on Spotify in Nov 2018.

- How many observations (rows) are in your data?
**300,601**
- How many features (columns) are in the data?
**8**
- What questions (from above) can be answered using the data in this dataset?
  1. What is the artist of the song that lasted on the charts for the longest period of time? We can find the longest duration of song on the top of the Billboard Weekly Songs.
  2. Which artists has the most number of songs on the charts? We can see how many songs artist have in the top of the charts and compare their amounts.
  3. Which songs lasted longest after their year of publishing? We can find the longest duration of a song in the top of the Billboard Weekly Songs.

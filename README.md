# Assignment_Predicting_future_outcomes
A game manufacturer and retailer, Turtle Games, sells its own products, along with sourcing and selling products manufactured by other companies.
It range includes books, board games, video games and toys.
The company collects data from sales as well as customer reviews. Turtle Games has a business objective of improving overall sales performance by utilising customer trends. 
Turtle Games want to improve overall sales performance and wants to understanding:
how customers accumulate loyalty points?
how groups within the customer base can be used to target specific market segments? 
how social data (e.g. customer reviews) can be used to inform marketing campaigns?
the impact that each product has on sales?
how reliable the data is (e.g. normal distribution, skewness, or kurtosis)?
what the relationship(s) is/are (if any) between North American, European, and global sales? 
45% of loyalty points can be explained by spending scores.
If spending scores changes by one unit, loyalty points changed by 33 points.
95% of the samples will derive a slope within the interval 31.464 and 34.659.
Probability of t-value is 0, so slope is significant.
38% of loyalty points can be explained by earnings.
If earnings change by one unit, loyalty points changed by 33 points.
95% of the samples will derive a slope within the interval 32.270 and 36.106
Probability of t-value is 0, so slope is significant.
Age is not a useful variable to determine the number of loyalty points, and had no correlation.
Individually, spending scores and renumeration are not enough to accurately predict loyalty points.
Combining both using a multiple linear regression offered more accurate insights.  82.7% of loyalty points can be explained by a combination of renumeration and spending scores.  This is a strong correlation for predicting loyalty points. 
50% of customers earn between £30.34k and £63.96k.  
The mean spending score is 50 (out of 100). 
The mean loyalty points is 1578 points.
I used K clusters, as it is mainly used to unlabelled data.
To determine the ideal number of clusters I used both the Elbow and silhouette methods and settled on 4 clusters.
This was supported by using a pairplot that clearly showed 4 defined clusters.
The biggest cluster is group 0 (red) with 994 customers (accounting for 50% of customers).
The second biggest cluster is group 2 (blue) with 652 (32.6%) of customers.
The spending scores of group 0 is only slight better than group 2. Group 2 spending score is spread across the whole range. 
How is the spending score calculated?  I've assumed it takes into account the total spends, how often they shop with Turtle Games, and their average spend per order.
If these customers are shopping little and often Turtle Games could target these customers to slightly increase their spend. Something as simple as offering free delivery or extra loyalty points for their next x orders could permanently increased their spending habit.
Within group 0 (the biggest cluster) most spending scoring is between 40 and 60 with loyalty points between 1000 and 2000. A campaign to encourage this group to place 1 extra order should increase their loyalty points, spending score, and Turtle Games overall sales for the season.
Most common words in the reviews include game, fun, one, play, like and love.
The histogram for sentiment of online products reviews showed there are some outliers with -1 negative scores.
I did not want to delete these, as further investigation is required. If these are for the same/similar products the buyers, quality control, manufacturers use the information to improve the product/range; it could also explain why a product is selling poorly (if the first could of reviews are negative it push everyone else off purchasing).
Overall, polarity scores are positives!  50% of the scores fall between 0.05 and 0.35, with a mean of 0.21.
Sentiment scores are postive. 50% of the scores fall between 0 and 0.48, with a mean of 0.22.  
Even though there are more neutral scores, overall, the summaries are more positive than the reviews! 
Over 800 neutral summaries, compared to under 500 neutral reviews.
Is there potential to improve sales further if these netural summaries reflect the reviews?
The subjectivity of the summary is weighted toward 0, suggesting that the customers are focusing on facts, rather than opinion.
Doesn’t take the expected bell shape I was expecting.
Further investigation showed that these summaries are short and concise, with over half stating “five stars”.
I also discovered that this model does not recognise that “five stars” is actually a very positive review! This could also explain the jagged levels on the polarity summary.  The polarity and sentiment of the summaries is to be taken with a pince of salt.
The histogram showed globally, over 200 lines did up to £5m.  The bulk of lines fell in this backet. I know from Excel that 18% of lines accounted for 50% of sales!
Suggesting there is alot of skues not earning their keep and could be discontinued. 
I need to find out how to create a chart or table that clearly showed this.
Using the boxplot, on global sales you can see a number of outliers near the 0 lines that should potentially be discontinued. 
Turtle Games should also consider worst/best sellers by region.  
Actions taken to increase sales, need to consider the sales history of that region, and if it makes sense to be applied to all or selected regions.
The 2600 game sells well in the US but is one of the worst selling games in EU! 
Reducing option count could potentially reduce the cost of warehouse space.  
Reducing option count also means the site would be less cluttered and easier to browd (potentially increasing sales).
Reducing the number of worst sellers means more space (both in the warehouse and online) for better and/or new games.
US had more outliers highlighting best sellers.  
Are there any lessons to be learnt that can be applied to other regions?
Is there a reason for the high sales?  Was it on promotion/sale?  Did it receive extra marketing or listed in a premium location of the website in both regions? 
Would be helpful if I could have access to margins by line by region. 
To increase sales, could Turtle Games offer these best selling games for other consoles?  
Are there expansion packs, sequels or spin offs due to be released? 
Focusing on best selling games could increase Turtle Games buying power and also reduced costs.
As a manufacturer, as well as retailer, are there other merchandise Turtle Games could develop this licence for? 
Increase sales by offering household goods such as duvets, or clothes such as T-shirts!  This could potentially increase the average customer spend, and how often they shop with Turtle Games.
Not normally distributed
Heavy right tailed distribution.
postitive correlation between how long something has been on sale and actual sales.
What is the time frame of sales?  Are the older lines (smaller item numbers) performing better because they have been on sale longer?  
Or are they performing better because they are long standing best sellers (such as Minecraft and Grand Theft Auto) and continue to be best sellers year after year?
There does not appear to be a colelation between the year the game was release and the product number. 
Number of products performing better than average
With the exception of sport,EU and NA follow similar sales mix across the genres
More sales in NA, but potential to increase sales in EU. 
High positive correlations between NA_Sales and Global_Sales.
High positive correlations between EU_Sales and Global_Sales.
Correlation between product code and sales between -0.41 and -0.46.
Linear regression models using NA sales to predict Global sales has Adjusted R Squared os 0.81.
81% of global sales could be predicted by NA sales.  This is a good accuracy model.  
With multiple linear regression (model B) produced an Adjusted R Squared of 0.99.  Used NA Sales, EU Sales and product for this model.



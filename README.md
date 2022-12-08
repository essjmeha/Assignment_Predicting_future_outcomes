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
95% of the samples will derive a slope within the interval 31.464 and 34.659
Probability of t-value is 0, so slope is significant.
38% of loyalty points can be explained by earnings
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
The second biggest cluster is group 2 (blue) with 652 (32.6%) of customers
The spending scores of group 0 is only slight better than group 2. Group 2 spending score is spread across the whole range. 
How is the spending score calculated?  I've assumed it takes into account the total spends, how often they shop with Turtle Games, and their average spend per order.
If these customers are shopping little and often Turtle Games could target these customers to slightly increase their spend. Something as simple as offering free delivery or extra loyalty points for their next x orders could permanently increased their spending habit.
Within group 0 (the biggest cluster) most spending scoring is between 40 and 60 with loyalty points between 1000 and 2000. A campaign to encourage this group to place 1 extra order should increase their loyalty points, spending score, and Turtle Games overall sales for the season.

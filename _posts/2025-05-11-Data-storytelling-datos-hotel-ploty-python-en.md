---
source: _notebooks/2025-05-11-Data-storytelling-datos-hotel-ploty-python.ipynb
layout: post
title: Data storytelling, visualizing data on hotel reservations.
date: 2025-05-11 10:49:19
author: Carlos Andrés Moreno
summary: In this article we are going to carry out a storytelling of a set of hotel
  reservation data
categories: Data
thumbnail: plot
tags:
- Data
- Python
- Plotly
lang: en
page_id: data-storytelling-datos-hotel-ploty-python
---
# Introduction

As part of the Master's Degree in Data Sciences that I am studying at the [Universidad Oberta de Catalunya](https://uoc.edu), I was assigned an activity that consists of creating *Data Storytelling* of a set of data on hotel reservations in Lisbon, Portugal. I think it is an excellent opportunity to show a little of what I have learned this semester in the Data Visualization subject, that is why I have decided to create *storytelling* in a new blog article.


# About the data

The data set that we are going to use throughout *storytelling* has been fully described in the article titled [Hotel booking demand datasets](https://www.sciencedirect.com/science/article/pii/S2352340918315191). As mentioned above, the data deals with hotel reservations in Lisbon, Portugal made from July 1, 2015 to August 31, 2017. Particularly two hotels, one located in the urban area of ​​the city and another resort-type hotel.

Each row in the data set is a reservation made by a customer for one of the two hotels. Additionally, we have information on the number of children, babies and adults within the reserve; month, week and day on which the reservation was made; country of residence of the client, whether the reservation was canceled or not, the type of food that was included for the clients, among other information of interest.

# Tools used for visualization

All the visualizations that you are going to see have been created using the [Plotly](https://plotly.com/python/) library. The blog is hosted on Github pages and uses Jekyll to generate the entire site (if you want to know a little more about this, you can click [here](https://carmoreno.com.co/tutoriales/2015/08/13/Como-hice-el-blog/)).

I would also like to mention [Jérome Eertmans](https://github.com/jeertmans), his blog article titled ["Embedding Plotly in a Jekyll Post"](https://eertmans.be/posts/plotly-example/) was a great help to be able to integrate Plotly and Jekyll without dying in the attempt (sometimes a good Google search is better than writing to Gemini or ChatGPT).

# Now, let's get to work.

### Do you prefer a lot or a few people?

Lisbon is one of the most visited tourist destinations every year in Europe, it has an excellent climate, good food, beautiful landscapes and Mediterranean beaches. In 2021, this city ranked [third](https://elordenmundial.com/mapas-y-graficos/ciudades-mas-visitadas-europa/) among the 15 most visited cities in Europe, only behind Paris and Barcelona. However, just because it is so popular does not mean that everything is rosy; It often means places of interest full of people, few places to park your vehicle and paying higher prices per season. Wouldn't it be better to go to Lisbon in a slightly more relaxed season? We could use hotel data to know when there are the greatest number of tourists. The more reservations without cancellation there are, it means the greater number of people going to these hotels. Let's look at what the data tells us.

<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_9d4b6a60-c168-4d8b-8a4b-eb18680be32e/figure_5.html"
    frameborder="0"
    allowfullscreen
</iframe>



Apparently the months with the most reservations are July and August, both for the Urban Hotel and the Resort Hotel. This should not surprise us, since it is normally during the summer months that more people go on vacation. However, something that is surprising are the numbers of completed reservations for the month of **June**, since they are few compared to the incredible weather this month, only 6,404.

Let's now look at the month of September, although it is not usually extremely sunny from start to finish, it is not bad at all for taking a vacation, even so the number of completed reservations is not as many (6,392) as in July and August. Generally, the first four months of the year and the last three do not have the best weather, so it is not surprising that the number of completed reservations is not that high. It seems that traveling in June and September offers us a quite interesting 'climate/number of tourists' relationship. But, what nationality would be the people we would meet if we traveled in one of those two months? Let's explore.

### The most travelers

First let's look generally at where the people who have made a completed reservation (without cancellation) at one of the two hotels come from.

<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_9d4b6a60-c168-4d8b-8a4b-eb18680be32e/figure_7.html"
    frameborder="0"
    allowfullscreen
</iframe>



We see that we have many countries (**178** to be exact). It makes sense that Portugal is the country from which most reservations are made to Lisbon, followed by nearby countries such as Spain, France, Italy and the United Kingdom. The latter, like Ireland, seem to prefer the Resort Hotel instead of the Urban Hotel.

On the contrary, tourists who come from the first three countries mentioned above prefer to visit the Urban Hotel, as do tourists who come from Germany. Now let's explore which countries the tourists we could find in Lisbon would be from, if we traveled in June or September. We are going to only take countries that have 50 people or more, in order to show more meaningful data. Let's look:

<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_9d4b6a60-c168-4d8b-8a4b-eb18680be32e/figure_9.html"
    frameborder="0"
    allowfullscreen
</iframe>



The previous tree graph shows us the number of people by nationality that we can meet, whether we go in June or September and whether we stay at the Resort Hotel or the Urban Hotel. You can hover over each box to obtain the total number of people of each nationality, also click, for example, on the Urban Hotel of the month of June, to navigate directly to this information.

We see that if we stayed at the Resort Hotel in either of the two months, we would have many more chances of meeting British people than Portuguese. On the contrary, at the Urban Hotel we would meet more Portuguese, Germans and French people. In September we could meet some Spaniards at the Urban Hotel. It seems that the British tend to prefer the Resort Hotel.

From the previous graph we can also see that there will be a little more tourists in June than in September, however, it will be the Urban Hotel that will have the most people regardless of the month. Therefore, if your plan is to relax in a hotel near the beach and not so much go out to see the city full of tourists, it would be an excellent plan to go to the Resort Hotel near the sea in June since there will be fewer people, and if you speak English, you could take the opportunity to practice, since most of them would be British.

### Be aware of cancellations!

We have already seen that June and September can be the best months to travel if you are looking for a balance between climate and number of tourists, but you may not care much about the latter. Perhaps the most important thing for you is to travel in the summer months, whether there are many tourists or not; However, it is not always possible to book in time and the best months are the first to go. How about we look at the rate of cancellations per month to see if we have any chance of "hunting" for a canceled reservation in case we cannot book in time, and go on vacation to Lisbon.

In the following graphs the "Yes" label has the percentage of canceled reservations and "No" the percentage of completed reservations. For each month we can obtain this information by hovering over a month or simply clicking on it. We see that for the total reservations made at the Resort Hotel in the month of June, only **33.07%** were cancelled, while the remaining **66.93%** were completed. In general, it seems that reservations for this type of hotel have a smaller rate of cancellations. It will be better to plan your accommodation at the Resort Hotel in advance and book in advance.

<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_9d4b6a60-c168-4d8b-8a4b-eb18680be32e/figure_13.html"
    frameborder="0"
    allowfullscreen
</iframe>



Another interesting behavior we see is that in the month of January, where the Resort Hotel has a minimum cancellation percentage, in fact it is the lowest of all with **14.82%** (work vacations in January?).

On the other hand, at the Urban Hotel, for the month of June we have a higher cancellation rate of **44.69%**. Imagine that you were unable to book a place in Lisbon for your next vacation. In this scenario, it seems more likely that you will be able to take advantage of a cancellation made at the Urban Hotel, but that it will be more difficult to "hunt" one for the Resort Hotel.


<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_9d4b6a60-c168-4d8b-8a4b-eb18680be32e/figure_14.html"
    frameborder="0"
    allowfullscreen
</iframe>

Finally and just out of curiosity, let's look at the percentage of reservation cancellations by country of origin.

### Are the most travelers now not so much?

In the following heat map we can see the cancellation rate of the different countries that have made at least ten reservations taking both hotels into account. The reason for this filter is that there are many countries that have only one canceled reservation, this would give us a 100% cancellation rate for that country, which would not be significant enough.

We can do _zoom in_ / _zoom out_ to see the rate of cancellations by continent. Focusing on Europe we see that Portugal has the largest rate of cancellations. At first we thought they were the ones who traveled the most, but apparently they are also the ones who cancel reservations the most. On the other hand, on the American continent, the countries that cancel accommodation reservations to Lisbon the least are Mexico with **11.76%** and Peru with **20.79%**.

<iframe style="color-scheme: none;"
    scrolling="no"
    width="100%"
    height="545px"
    src="/assets/notebooks/html_9d4b6a60-c168-4d8b-8a4b-eb18680be32e/figure_16.html"
    frameborder="0"
    allowfullscreen
</iframe>



## Conclusions

Some conclusions (somewhat lightly) that we can draw after this _data storytelling_ are:

* June and September offer a good relationship between climate and number of tourists.
* It is very difficult to reserve accommodation at the Resort Hotel at the last minute, so it is better to do this process in advance.
* Portugal is the country where the tourists who travel the most to Lisbon come from, but also where they cancel reservations the most (In Europe).
* It is easier to book at the last minute at the Urban Hotel.
* The British prefer the Resort Hotel, while the rest of the neighboring countries prefer the Urban Hotel.


Thank you very much for making it to the end of this exercise. You can see the complete code for this article in [this notebook](https://drive.google.com/file/d/1GwkCM4jNAFAsFcwcZrN84yKPCbC9HcEa/view?usp=sharing).

{% highlight python %}print("See you soon"){% endhighlight %}

<small><i>Translated using GPT 5.3 Codex</i></small>

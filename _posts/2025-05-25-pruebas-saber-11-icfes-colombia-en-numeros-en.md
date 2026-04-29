---
source: _notebooks/2025-05-25-pruebas-saber-11-icfes-colombia-en-números.ipynb
layout: post
class: dashboard
title: Pruebas Saber 11 in numbers
author: Carlos Andrés Moreno
date: 2025-05-20 12:31:19
summary: Data storytelling about Pruebas Saber 11, the final high school exam in
  Colombia
categories: dataviz
thumbnail: plot
tags:
- Data
- Python
- Plotly
lang: en
page_id: pruebas-saber-11-icfes-colombia-en-numeros
---
# About Pruebas Saber 11

Pruebas Saber 11 is an exam designed by the Colombian Institute for the Evaluation of Education (ICFES) that is given to each student in the final year of secondary education in Colombia. This test measures the level of knowledge in different areas or subjects, specifically in Critical Reading, Mathematics, Social and Citizenship, Natural Sciences and English. The exam is divided into two sessions, lasting 4 hours and 30 minutes each. Each subject has a score from 0 to 100 points and the test has a global score that ranges from 0 to 500 points. Depending on these scores, the student will have options to apply for scholarships to continue their higher studies, or to be admitted to a public or private university.

A person who has obtained a bachelor's degree in previous years can also take this test, which, by the way, can be taken more than once in different elective years.

# About the data

The data that will be used throughout this study have been obtained from the [Official Open Data Platform of the Government of Colombia](https://www.datos.gov.co), and are available for download at this [link](https://www.datos.gov.co/Educaci-n/Resultados-nicos-Saber-11/kgxf-xxbe/about_data). Originally, this _dataset_ has the results of the evaluations from the year 2010 to the year 2022. However, for practical purposes, I have decided to focus on the year 2022. Perhaps then I will be encouraged to study the data from previous years to make comparisons, look at changes and trends over time.

Furthermore, I have decided to focus on two major aspects that can influence the performance of the tests: Family and collegiate aspects. For the first, we will look at the performance of the students according to the socioeconomic stratum of the family home and if the student has internet at home. As for the schools, we will study the performance according to the day (morning, afternoon, Saturday, etc.), gender of the school (male, female or mixed school), whether the school is bilingual or not, whether the school is rural or urban and finally, we will look at the performance of the students in public and private schools.



## Related works

There have already been other quite good works on the analysis of the Pruebas Saber 11, I would like to highlight the one carried out by Javier Moreno and Jorge Orlando Melo with the mathematics and language results for the 2013 results; This work focused on municipalities and public schools. In addition, we tried to find some interesting correlations between multidimensional poverty and violence with the results of the exam. You can go check out this work [here](https://finiterank.github.io/saber_notebooks/).

# Take a look at the national level

First let's review the distributions at the national level. We see that the scores for English, Social and Citizenship and Natural Sciences are concentrated to the left, in the lowest values, while we can see a slight concentration to the right in the subjects of Mathematics and Critical Reading. It seems that students are better in Mathematics and Reading and not so much in the other subjects, although it may also be that the educational system is not in accordance with what the English, Natural and Social Sciences and Citizen Sciences tests are evaluating.

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_11.html" %}


If we look at the last graph, we can see that the global score, which ranges from 0 to 500 points, has a concentration to the left, which suggests that students in Colombia tend to get scores lower than the national average, which for the year 2022 was **251.4** according to [Portafolio](https://www.portafolio.co/economia/finanzas/educacion-en-colombia-puntaje-promedio-de-probas-saber-11-aumento-en-2022-581407). With a score equal to or lower than the average, it is quite unlikely that you will be able to obtain scholarships for higher education, not to mention the chances of being admitted to an academic program that requires a minimum requirement.

The above makes us ask what is special about those schools where students who performed well in the Pruebas Saber 11 study. Perhaps official entities can take note of this and, why not, implement certain practices or routines to begin to raise the scores of their graduates.

# Study English millet

Let's look at the distribution of scores in the different areas for bilingual and non-bilingual schools. For this we use the [box diagrams](https://bookdown.org/jboscomendoza/r-principiantes4/diagramas-de-caja.html), you can mouse over each box to see its information. For the forgetful reader, let's remember that each box has a line in the middle, this is the median. The top of the box is the third quartile of the data and the bottom of the box is the first quartile, the range from the first to the third quartile is known as the Interquartile Range, which is the box itself. The lines coming out of the boxes are called whiskers and represent the minimum and maximum values, while the points further away represent outliers.

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_13.html"
    orientation="left"
    height="650px"
    text="We can see that students from bilingual schools have a score range from **41** to **77**. Scores are concentrated in the upper part of the box (the highest scores), which tells us that most students scored between **55** (the median) and **77**. There were even students with perfect scores of **100** points. In contrast, students from non-bilingual schools have a range from **40** to **58**, with a median of **49**. As expected, bilingual schools achieve better results in English."
%}

In other subjects, bilinguals tend to be a little higher as well (not as much as they are in English). These differences of between 6 and 10 points in the other subjects, added to their incredible scores in English tests, mean that, in the overall score of the exam, bilinguals surpass (and by far) both the national average and the average of non-bilinguals.

In the following [Bullet Chart](https://www.tableau.com/chart/what-is-bullet-graph#:~:text=A%20bullet%20graph%20is%20a,elements%20to%20provide%20additional%20detail.) we can see it better. The vertical white line marks the overall national average while the dark blue line measures the average score of students at each school; The light blue stripes in the background represent the overall score ranges. We see that bilinguals are above the national average by **+18** points and non-bilinguals are only by **+1** point. Furthermore, the latter have an average of **252**, 18 points below the bilinguals, who have **270** points on average.

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_14.html" height="255px" %}


# Official and Private Schools

I couldn't find much information regarding the nature of the schools for the year 2022. However:

> ... By 2023 in Colombia there were 53,148 schools with 8 out of 10 being official. This gives us approximately 42,518 official schools and 10,630 non-official schools. — M*ateo Medina Ariza, in [Two out of every ten school students in Colombia study in private schools](https://www.larepublica.co/economia/dos-de-cada-diez-estudiantes-escolares-en-colombia-estudian-en-colegios-privados-3964187), Diario La República*

Based on the above, we could then affirm that in Colombia there are fewer private schools, which means that more students from official schools take Saber 11.

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_16.html" 
    height="650px"
    orientation="left"
    text="According to the visualizations, private-school students score higher than public-school students across all subjects. In English and Critical Reading, this gap is even more pronounced. One possible reason is that public schools often have many more students per teacher, making classroom learning more complex and limiting individualized attention. By 2023, there were around 24 students per teacher in public schools and 14 in private schools, according to the same [La República article](https://www.larepublica.co/economia/dos-de-cada-diez-estudiantes-escolares-en-colombia-estudian-en-colegios-privados-3964187)." %}

Finally, students from private schools obtain an average of **274** in the overall exam score, exceeding the overall national average by **+22** points. Students from official schools obtain only **244** on average, remaining **-8** points behind national expectations. Without a doubt, this should set off alarm bells in the Colombian Ministry of Education and seek actions that will allow its students to raise their students' Pruebas Saber 11 scores.

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_17.html" height="255px" %}

_Note: There may be official or private bilingual schools, to obtain the data we discriminated only by the nature of the school (official and private)._

# From the countryside to the city

For no Colombian it should be a secret that the National Government has a very large debt with rural areas. Colombia is not a country of cities but of fields, and on this the reader and I may or may not agree. What does not enter into any debate is that:

> In Colombia there are approximately 39,949 rural educational establishments, which are equivalent to 67.5% of the total national establishments. While in urban areas there are 17,346 establishments, equivalent to 32.5% nationally. — *Josué Sarmiento Lozano in [The Universe of the school and rural schools in Colombia](https://rutamaestra.santillana.com.co/el-universo-de-la-escuela-y-los-colegios-rurales-en-colombia/)*

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_19.html" 
    orientation="left"
    height="650px"
    text="Students from rural schools tend to obtain noticeably lower results in all subjects compared to students from urban schools. In general, the interquartile range for urban-school students is between **40** and **60** points for most evaluated subjects. In rural schools, however, the third quartile does not even reach **60** points. Even worse, the lowest scores start below **40**, suggesting that a low score for an urban student is often not as low as a low score for a rural student."
%}

Furthermore, none of the maximum score values ​​of rural students exceed those obtained by urban students. If we compare the subject of Mathematics, which is where rural students seem to shine a little more, the maximum score obtained is **80** points, which is still below the maximum Mathematics scores of urban students, which is **84** points.

What could be the reason for these results in rural schools? The truth is that there are many factors and it is beyond the purpose of this study to describe them all in detail. What is certain is that there is a lack of state presence in most rural areas. Let's not isolate the problem only to schools, issues such as accessibility through roads, public services such as water and electricity and infrastructure of educational centers, all these components go hand in hand and can surely influence the results of the Pruebas Saber 11. I recommend reading the article that I mentioned before entitled [The Universe of the school and rural schools in Colombia](https://rutamaestra.santillana.com.co/el-universo-de-la-escuela-y-los-colegios-rurales-en-colombia/).


{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_20.html" height="255px" %}


# Girls, Boys and Mixed Under the Magnifying Glass

Something that should be taken into account in these comparisons is that they are not entirely fair, because the percentage of single-gender schools in Colombia is very low compared to mixed schools. For Pruebas Saber 11 in 2022, 96% of evaluated students belonged to mixed schools, 2.31% to girls' schools, and only 0.75% to boys' schools. That said, let's interpret the visualizations.

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_21.html"
    orientation="left"
    height="650px"
    text="The first thing that stands out is that, in general, girls' schools and boys' schools perform better in all Pruebas Saber 11 subjects than mixed schools (those with both boys and girls). Approximately, the score range for girls' and boys' schools starts around **50** points, while mixed schools start in the **40s**."
%}

The data seems to indicate that boys' schools do slightly better in English and Maths compared to girls' schools. In the other subjects, both groups have very similar scores. Regarding the national average, boys' schools exceed it by **+45** points. Girls' schools also surpass it, by **+36** points. Mixed schools lag behind and fail to surpass the national average overall score, remaining **-2** points below.

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_22.html" height="380px" %}

So, the order seems to be: boys' schools first, then girls' schools very closely behind, and finally mixed schools. What explains this behavior? Why do boys perform better, for example, in Mathematics?

> That boys do better than girls in subjects such as mathematics and natural sciences is not new news; Of the 65 countries that presented the PISA test in 2009, 54 countries presented this trend. Likewise, the ICFES has known about these differences for three decades. One of the explanations for the difference between genders is that boys have greater visuospatial skills. — _Taken from [Mixed, masculine, feminine. Does the gender of the school matter?](https://www.eccole.co/importa-el-genero-del-colegio/)_



# The School Day and its Surprising Effect on Pruebas Saber 11

To finish with the aspects related to the schools where the students belong, let's look at the data from the school days. The lowest scores come from the night and Saturday days, both days with similarly bad numbers for all subjects. While the highest scores are given by full-time students. In the graph, you can click on each square in the legend to activate/deactivate matchday categories. As for the morning, afternoon and single sessions, their scores for all subjects are also quite similar, with the morning session being a little higher in the global average compared to the afternoon session.

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_23.html" height="650" %}

[Looking for a little more about the full day](https://www.youtube.com/watch?v=2B74W0aoB08), it seems that it is not something completely common in schools in the country, the idea behind this day is that students can participate in cultural and academic reinforcement activities after the end of classes. It is not entirely clear whether this is mandatory or optional. If the reader has more information about this day, it would be very useful if they left a comment at the end. Without a doubt, it is something worth investigating, since the results are positive with respect to the scores in all the subjects evaluated for this day.

Looking at the average of the global scores for each day, we can see that full-day students are **+32** points above the national average. The reader will be able to draw their own conclusions from the other days shown in the bullet chart.


{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_24.html" height="575px" %}


Apart from the aspects of school that we have just studied above, it is also worth asking if there is any socioeconomic factor that affects the scores of the Pruebas Saber 11. Violence, poverty, access to technology, educational level of the student's parents? To finish this study I want to look at two aspects: Stratum and Internet Access. Let's look.

# Strata in Pruebas Saber 11, what do the data tell us?

The following bar graph shows the number of students on the y-axis and the different ranges of the overall scores on the x-axis. By hovering over it you can see the percentage information for each range. The first thing we realize is that there are more students who took the Pruebas Saber 11 who belong to Strata 1, 2 and 3. For the non-Colombian reader, the lower the Stratum number means the lower the family's economic income, in addition to the fact that the family home is located in neighborhoods with more complex social problems (although of course, we cannot forget the phenomenon of hidden wealth/poverty).

{% include graph.html src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_27.html" %}

The higher we go in the stratum, the more the percentage of students who are between 300 and 400 points grows. Until, reaching Stratum 6, we see how the previously mentioned range exceeds in percentage the range of 200 to 300. Something to take into account is the total number of students per stratum. It would not be fair to compare Stratum 1 with Stratum 6, the total population in both would make us fall into conclusions and judgments lightly. However, we could compare the first 3 strata with each other. It seems that the socioeconomic status of the student influences the results of the tests, this makes sense when reading related works, like [this one](https://finiterank.github.io/saber_notebooks/) that I mentioned at the beginning, where we see a correlation between poverty and math and reading results.


# Internet to the rescue?

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_30.html" 
    orientation="left"
    text="Finally, it is interesting to ask whether having internet at home helps students obtain better scores. In Stratum 1, **71%** of students in the highest overall score range had internet at home, as did **54%** of those in the 200-300 point range. At the same time, **57%** of students in the lowest score range did not have internet. This could suggest that, in Stratum 1, having internet can make a difference and help improve results."  
%}

{% include graph.html 
    src="/assets/notebooks/html_0ce1758d-900f-4b33-a252-049700540dad/figure_31.html" 
    orientation="left"
    text="However, something counterintuitive happens in Strata 2 and 3. In the lowest score ranges, more than half of students had internet. So why, if most had internet at home, were their scores still low? There are many possible factors: maybe students did not use internet to study for the exam, or their connection quality was poor. Beyond knowing whether a student had internet at home, we should ask how they used it, and especially whether they used it to practice for Pruebas Saber 11 before taking it." %}


# Thank you!

If you have reached this point, I only have to thank you for your time, the notebook with the visualization code can be accessed through [this link](https://colab.research.google.com/drive/1hxYrCXIEwsEeHUkDhqlcd7HrlSDTjKL4?usp=sharing). I have used Plotly for all these visualizations as I did in this [another article](https://carmoreno.com.co/data/2025/05/11/Data-storytelling-datos-hotel-ploty-python/) about hotel reservations, which if you haven't read it I encourage you to do so, it is by far much shorter than this one 🙃.

<small><i>Translated using GPT 5.3 Codex</i></small>
